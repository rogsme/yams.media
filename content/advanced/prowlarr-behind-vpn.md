---
title: "Lancer Prowlarr derrière le VPN"
date: 2025-01-15T11:50:16+02:00
draft: false
weight: 60
summary: Un guide complet pour acheminer le trafic de Prowlarr à travers votre VPN pour plus de confidentialité
---

# Plus de confidentialité pour Prowlarr 🔒

Bien que le téléchargement de fichiers .torrent ne soit généralement pas illégal, certains fournisseur d'accès Internet peuvent essayer de bloquer votre accès aux indexeurs. Pour y remédier, placez Prowlarr derrière votre VPN !

## Pourquoi mettre Prowlarr derrière le VPN ? 🤔

1. **Passer outre les blocages des FAI** : Certains FAI peuvent bloquer les indexeurs de torrent
2. **Confidentialité accrue** : Gardez vos recherches privées
3. **Diversité de choix** : Accédez à des indexeurs restreints dans votre pays

## Étapes de configuration 🛠️

Nous allons devoir mofidier deux services dans votre fichier `docker-compose.yaml` : Prowlarr et Gluetun. Allons-y étape par étape !

### Étape 1: Modifier la configuration de Prowlarr

Tout d'abord, mettons à jour Prowlarr pour qu'il utilise le réseau du VPN. Ouvrez votre `docker-compose.yaml` et trouvez le service Prowlarr :

```yaml
prowlarr:
    image: lscr.io/linuxserver/prowlarr
    container_name: prowlarr
    # Supprimez ou commentez la section 'ports'
    # ports:
    #   - 9696:9696
    network_mode: "service:gluetun" # Ajoutez cette ligne
    environment:
        - PUID=${PUID}
        - PGID=${PGID}
        - WEBUI_PORT=9696 # Ajoutez cette ligne
    volumes:
        - ${INSTALL_DIRECTORY}/config/prowlarr:/config
    restart: unless-stopped
```

Changements principaux :

1. Retirez ou commentez la section `ports`
2. Ajoutez `network_mode: "service:gluetun"`
3. Ajoutez `WEBUI_PORT=9696` aux variables d'environnement

### Étape 2: Modifier la configuration de Gluetun

Nous allons maintenant dire à Gluetun de gérer le trafic de Prowlarr. Trouvez le service Gluetun dans votre `docker-compose.yaml` :

```yaml
gluetun:
    image: qmcgaw/gluetun:v3
    container_name: gluetun
    cap_add:
        - NET_ADMIN
    devices:
        - /dev/net/tun:/dev/net/tun
    ports:
        - 8888:8888/tcp # HTTP proxy
        - 8388:8388/tcp # Shadowsocks
        - 8388:8388/udp # Shadowsocks
        - 8080:8080/tcp # gluetun
        - 9696:9696/tcp # Ajoutez cette ligne pour Prowlarr
    volumes:
        - ${INSTALL_DIRECTORY}/config/gluetun:/config
    environment:
        - FIREWALL_OUTBOUND_SUBNETS=192.168.1.0/24 # Ajoutez cette ligne
    restart: unless-stopped
```

Changements principaux :

1. Ajoutez `9696:9696/tcp` aux ports
2. Ajoutez `FIREWALL_OUTBOUND_SUBNETS` aux variables d'environnement

### Étape 3 : Trouvez votre sous-réseau 🔍

La valeur de `FIREWALL_OUTBOUND_SUBNETS` doit correspondre au sous-réseau de votre conteneur. Voici comment le trouver :

1. Ouvrez Portainer
2. Cliquez sur "Containers"
3. Vérifiez la colonne "IP Address"

La plupart des installations utilisent l'un de ses sous-réseaux :

-   `172.18.0.0/24` si vos conteneurs utilisent une IP comme celle-ci `172.18.x.x`
-   `192.168.1.0/24` si vos conteneurs utilisent une IP comme celle-ci `192.168.1.x`

### Étape 4: Appliquer les changements 🔄

Sauvegardez les changements et redémarrez YAMS :

```bash
yams restart
```

## Tester votre installation 🎯

Après le redémarrage de YAMS, vérifiez que :

1. Vous pouvez toujours accéder à Prowlarr via `http://{votre-adresse-ip}:9696`
2. Vos indexeurs fonctionnent toujours
3. La fonctionnalité de recherche fonctionne correctement

## Dépannage 🔧

### Vous n'arrivez pas à accéder à Prowlarr ?

1. Vérifiez les logs de Gluetun :

```bash
docker logs gluetun
```

2. Vérifiez que vos paramètres de sous-réseau sont corrects
3. Assurez-vous que l'attribution des ports est correcte dans les deux services

### Les indexeurs ne fonctionnent pas ?

1. Vérifiez votre connexion VPN :

```bash
yams check-vpn
```

2. Essayez d'accéder manuellement à un indexeur via Prowlarr
3. Vérifiez dans les logs de Prowlarr si des erreurs apparaissent

### Vous avez encore un problème ?

1. Comparez votre configuration avec les exemples ci-dessus
2. Assurez-vous que votre fournisseur VPN autorise la redirection de port
3. Essayez un serveur VPN différent

## Astuces 💡

1. **La vitesse compte** : Choisissez un serveur VPN proche de vous pour de meilleures performances
2. **Vérifications régulières** : Utilisez la commande `yams check-vpn` pour vérifier que votre VPN fonctionne
3. **Surveillez les logs** : Gardez un œil sur les logs de Prowlarr et Gluetun pour détecter les erreurs

## Besoin d'aide ? 🆘

Si vous êtes bloqué :

1. Visitez notre page [Problèmes courants](/faqs/common-errors/)
2. Visitez le [Forum YAMS](https://forum.yams.media)
3. Rejoignez notre serveur [Discord](https://discord.gg/Gwae3tNMST) ou [Matrix](https://matrix.to/#/#yams-space:rogs.me)

N'oubliez pas : Prendre quelques mesures supplémentaires pour protéger votre vie privée en vaut toujours la peine ! Protégez-vous ! 🛡️
