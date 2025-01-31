---
title: "Erreurs courantes"
date: 2025-01-30T11:35:44+02:00
draft: false
weight: 1
summary: Solutions aux problèmes courants rencontrés avec YAMS et comment les résoudre
---

# Problèmes courants rencontrés avec YAMS et solutions 🔧

## Problèmes liés à Docker

### Permission Denied Errors 🚫

Vous obtenez cette erreur lorsque vous exécutez des commandes YAMS ?

```bash
permission denied while trying to connect to the Docker daemon socket at unix:///var/run/docker.sock
```

**Solution rapide :**

```bash
# Ajoutez vous au groupe docker
sudo usermod -aG docker $USER

# Déconnectez-vous et reconnectez-vous, ou lancez la commande :
newgrp docker
```

**Toujours des problèmes ?**

1. Vérifiez l'appartenance au groupe :

    ```bash
    groups $USER
    ```

    Vous devriez voir "docker" dans la liste.

2. Vérifiez les permissions du socket :

    ```bash
    ls -l /var/run/docker.sock
    ```

    Ça devrait afficher : `srw-rw---- 1 root docker`

3. Vérifiez le service Docker :
    ```bash
    systemctl status docker
    ```

## Problèmes de VPN

### Gluetun ne se connecte pas 🔌

Si votre VPN ne fonctionne pas, nous allons résoudre le problème étape par étape :

1. **Vérifiez les logs de Gluetun**

    ```bash
    docker logs -n 100 gluetun
    ```

2. **Messages d'erreur courants :**

    - "Authentication failed": Vérifiez vos identifiants VPN
    - "Network unreachable": Vérifiez votre connexion internet
    - "No such host": Problèmes de DNS. Vérifiez les paramètres de votre réseau

3. **Vérifiez les paramètres VPN**

    ```bash
    # Dans votre fichier .env
    VPN_ENABLED=y
    VPN_SERVICE=votre_fournisseur
    VPN_USER=votre_identifiant
    VPN_PASSWORD=votre_mot_de_passe
    ```

4. **Testez la connexion VPN**

    ```bash
    yams check-vpn
    ```

5. **Problèmes spécifiques aux fournisseurs :**
    - **ProtonVPN** : Veillez à utiliser les bons identifiants ([Nom d'utilisateur OpenVPN / IKEv2](https://account.proton.me/u/0/vpn/OpenVpnIKEv2)).
    - **Mullvad** : Le numéro de compte doit comporter exactement 16 chiffres
    - **NordVPN** : Utilisez votre token et non votre mot de passe habituel

### Corrections rapides du VPN 🛠️

1. **Réinitialisez la connexion VPN**

    ```bash
    yams restart
    ```

2. **Forcez la régénération du conteneur**

    ```bash
    yams destroy
    yams start
    ```

3. **Vérifiez les paramètres du réseau**
    ```bash
    docker network ls
    ```

## Problèmes liés aux clients de téléchargement

### qBittorrent n'est pas accessible 🔒

1. **Vérifiez si le VPN est activé**

    - Vérifiez votre [Configuration VPN](/advanced/vpn/)
    - Lancez un test du VPN :
        ```bash
        yams check-vpn
        ```

2. **Vérifiez le mappage des ports**

    ```bash
    docker ps | grep qbittorrent
    ```

    Le port 8081 devrait être affiché

3. **Vérifiez le mode réseau**
   Dans `docker-compose.yaml`:

    ```yaml
    qbittorrent:
        network_mode: "service:gluetun"
    ```

4. **Vérifiez les logs**
    ```bash
    docker logs qbittorrent
    ```

### Problème de connexion à SABnzbd 📡

1. **Vérifiez le statut du service**

    ```bash
    docker ps | grep sabnzbd
    ```

2. **Vérifiez la configuration**
   Look for:

    ```yaml
    sabnzbd:
        ports:
            - 8080:8080
    ```

3. **Consultez les logs**
    ```bash
    docker logs sabnzbd
    ```

## Problèmes liés au serveur multimédia

### Jellyfin/Emby/Plex ne trouve pas les médias 📺

1. **Vérifiez les permissions**

    ```bash
    ls -l /your/media/directory
    ```

    Should be owned by PUID:PGID from your .env file

2. **Vérifiez les points de montage**

    ```bash
    docker inspect your-media-server
    ```

    Look for "Mounts" section

3. **Erreur de chemins**

    - Dans le conteneur : `/data/movies`, `/data/tshows`
    - Sur votre système : Votre chemin `MEDIA_DIRECTORY`

4. **Scan des bibliothèques**
    - Déclenchez un scan manuel dans l'interface web
    - Vérifiez les chemins d'accès aux bibliothèques dans les paramètres

## Problèmes de performances

### Utilisation excessive du CPU 🔥

1. **Vérifiez les statistiques des conteneurs**

    ```bash
    docker stats
    ```

2. **Vérifiez les ressources du système**

    ```bash
    top
    # or
    htop
    ```

3. **Recherche de problèmes dans les logs**
    ```bash
    docker logs --tail 100 container-name
    ```

### Problèmes de mémoire 💾

1. **Vérifiez la mémoire disponible**

    ```bash
    free -h
    ```

2. **Surveillez la mémoire des conteneurs**

    ```bash
    docker stats --format "table {{.Name}}\t{{.MemUsage}}"
    ```

3. **Fixez des restrictions aux conteneurs**
   In docker-compose.yaml:
    ```yaml
    services:
        your-service:
            mem_limit: 1g
    ```

## Encore besoin d'aide ? 🆘

Toujours bloqué ? Nous sommes là pour vous aider !

1. **Vérifiez les logs détaillés**

    ```bash
    # Logs de tous les conteneurs
    docker-compose logs

    # Logs d'un conteneur spécifique
    docker-compose logs container-name
    ```

2. **Ressources communautaires**

    - [Forum YAMS](https://forum.yams.media)
    - [Serveur Discord](https://discord.gg/Gwae3tNMST)
    - [Chat Matrix](https://matrix.to/#/#yams-space:rogs.me)

3. **Remonter un problème :**
    - Consultez nos [Issues GitLab](https://gitlab.com/rogs/yams/-/issues) existantes
    - Fournissez vos logs et votre configuration lorsque vous ouvrez un ticket

N'oubliez pas : La plupart des problèmes ont des solutions simples ! Si vous êtes bloqué, notre communauté est là pour vous aider ! 💪
