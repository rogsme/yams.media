---
title: "Prérequis pour Proxmox LXC"
date: 2025-03-29T10:00:00-03:00 
draft: false
weight: 10
summary: Étapes nécessaires à l'installation de YAMS dans un conteneur LXC Proxmox.
---

# Prérequis pour l'installation de YAMS dans un conteneur LXC Proxmox

Si vous prévoyez d'installer YAMS dans un conteneur LXC Proxmox, une configuration spécifique au niveau de l'hôte est nécessaire **avant** d'exécuter le script d'installation de YAMS. Ces étapes garantissent que Docker et le service VPN (Gluetun) peuvent fonctionner correctement dans l'environnement LXC en fournissant un accès au périphérique TUN nécessaire.

>**Note :** Ce guide est basé sur la solution découverte et partagée par l'utilisateur du forum **Bobs_Manager**. Vous pouvez trouver la discussion originale [ici, sur le forum YAMS](https://forum.yams.media/viewtopic.php?t=212).

⚠️ **Important :** N'utilisez qu'un conteneur LXC **non privilégié** pour YAMS. Les conteneurs privilégiés présentent des risques de sécurité importants et ne sont pas recommandés.

Suivez ces étapes sur votre système **hôte** de Proxmox :

1.  **Accédez au shell de l'hôte Proxmox :** Connectez-vous à votre serveur Proxmox via SSH ou utilisez l'accès shell de l'interface web pour le nœud (pas la console LXC).

2.  **Éditez le fichier de configuration LXC :** Ouvrez le fichier de configuration spécifique au conteneur LXC dans lequel vous avez l'intention d'installer YAMS. Remplacez `<container-ID>` par l'identifiant numérique de votre conteneur LXC.
    ```bash
    nano /etc/pve/lxc/<container-ID>.conf
    ```

3.  **Ajoutez des lignes de configuration :** Ajoutez les lignes suivantes à la **fin** du fichier. Ces lignes accordent au conteneur les permissions nécessaires et montent le périphérique `/dev/net/tun` de l'hôte dans le conteneur.
    ```ini
    lxc.cgroup.devices.allow: a
    lxc.cap.drop:
    lxc.cgroup2.devices.allow: c 10:200 rwm
    lxc.mount.entry: /dev/net/tun dev/net/tun none bind,create=file
    ```
    Votre fichier de configuration devrait ressembler à ceci à la fin :
    [![Proxmox LXC Config Example](/pics/proxmox-lxc-config.png)](/pics/proxmox-lxc-config.png)

4.  **Sauvegardez et fermez:** Enregistrez les modifications dans le fichier de configuration et quittez l'éditeur.

5.  **Redémarrez le conteneur LXC :** Pour que les changements prennent effet, vous devez redémarrer le conteneur LXC. Vous pouvez le faire via l'interface web de Proxmox ou en utilisant les commandes suivantes sur l'hôte Proxmox :
    ```bash
    pct stop <container-ID>
    pct start <container-ID>
    ```

## Étapes suivantes

Après avoir rempli ces conditions préalables et redémarré le conteneur LXC, vous pouvez maintenant vous connecter à la console du conteneur LXC et procéder à l'installation de YAMS en suivant le [guide d'installation](/install/steps/).