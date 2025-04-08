---
title: "VPN"
date: 2025-01-16T08:51:14+02:00
draft: false
weight: 40
summary: Tout ce dont vous avez besoin de savoir sur la configuration et l'utilisation d'un VPN avec YAMS
---

# Gardez vos téléchargements privés 🔒

Parlons des VPN ! Bien qu'ils puissent sembler facultatifs, **vous devez toujours utiliser un VPN lorsque vous téléchargez des torrents**. Il ne s'agit pas seulement de protéger votre vie privée, il s'agit de vous garder en sécurité sur Internet !

YAMS utilise [gluetun](https://github.com/qdm12/gluetun) pour gérer la connexion VPN. C'est une sorte de contrôleur de trafic super intelligent pour nos téléchargements ! 🚦

## Fournisseurs VPN supportés 🌐

YAMS fonctionne avec de nombreux fournisseurs VPN ! Voici la liste complète avec les liens directs vers leurs guides d'installation :

### Choix populaires 🌟

-   [ProtonVPN](https://github.com/qdm12/gluetun-wiki/blob/main/setup/providers/protonvpn.md) (Recommandé ! Simple à installer et bonne protection de la vie privée)
-   [Mullvad](https://github.com/qdm12/gluetun-wiki/blob/main/setup/providers/mullvad.md)
-   [NordVPN](https://github.com/qdm12/gluetun-wiki/blob/main/setup/providers/nordvpn.md)
-   [Private Internet Access](https://github.com/qdm12/gluetun-wiki/blob/main/setup/providers/private-internet-access.md)
-   [Surfshark](https://github.com/qdm12/gluetun-wiki/blob/main/setup/providers/surfshark.md)

### Liste complète 📋

-   [AirVPN](https://github.com/qdm12/gluetun-wiki/blob/main/setup/providers/airvpn.md)
-   [Cyberghost](https://github.com/qdm12/gluetun-wiki/blob/main/setup/providers/cyberghost.md)
-   [ExpressVPN](https://github.com/qdm12/gluetun-wiki/blob/main/setup/providers/expressvpn.md)
-   [FastestVPN](https://github.com/qdm12/gluetun-wiki/blob/main/setup/providers/fastestvpn.md)
-   [Hidemyass](https://github.com/qdm12/gluetun-wiki/blob/main/setup/providers/hidemyass.md)
-   [IPVanish](https://github.com/qdm12/gluetun-wiki/blob/main/setup/providers/ipvanish.md)
-   [IVPN](https://github.com/qdm12/gluetun-wiki/blob/main/setup/providers/ivpn.md)
-   [Perfect Privacy](https://github.com/qdm12/gluetun-wiki/blob/main/setup/providers/perfect-privacy.md)
-   [Privado](https://github.com/qdm12/gluetun-wiki/blob/main/setup/providers/privado.md)
-   [PrivateVPN](https://github.com/qdm12/gluetun-wiki/blob/main/setup/providers/privatevpn.md)
-   [PureVPN](https://github.com/qdm12/gluetun-wiki/blob/main/setup/providers/purevpn.md)
-   [SlickVPN](https://github.com/qdm12/gluetun-wiki/blob/main/setup/providers/slickvpn.md)
-   [Torguard](https://github.com/qdm12/gluetun-wiki/blob/main/setup/providers/torguard.md)
-   [VPN Secure](https://github.com/qdm12/gluetun-wiki/blob/main/setup/providers/vpn-secure.md)
-   [VPN Unlimited](https://github.com/qdm12/gluetun-wiki/blob/main/setup/providers/vpn-unlimited.md)
-   [VyprVPN](https://github.com/qdm12/gluetun-wiki/blob/main/setup/providers/vyprvpn.md)
-   [WeVPN](https://github.com/qdm12/gluetun-wiki/blob/main/setup/providers/wevpn.md)
-   [Windscribe](https://github.com/qdm12/gluetun-wiki/blob/main/setup/providers/windscribe.md)

Si vous souhaitez utiliser un autre fournisseur VPN, vous pouvez installer votre [propre fournisseur VPN](https://github.com/qdm12/gluetun-wiki/blob/main/setup/providers/custom.md), mais gardez en tête qu'il ne sera pas officiellement supporté par YAMS. Vous serez en terre inconnue ! 🛠️

## Configuration manuelle 🔧

Voyons comment configurer votre VPN manuellement. Pour ce guide, je vais supposer que YAMS est installé dans `/opt/yams`. Ajustez le chemin si vous l'avez installé autre part !

### Étape 1: Éteindre YAMS

```bash
yams stop
```

### Étape 2: Configurez les paramètres de votre VPN

Ouvrez le fichier `.env` :

```bash
nano /opt/yams/.env
```

Trouvez la section du VPN et modifiez-là :

```bash
# VPN configuration
VPN_ENABLED=y
VPN_SERVICE=protonvpn     # Votre service VPN parmi la liste ci-dessus
VPN_USER=your-username    # Nom d'utilisateur de votre VPN
VPN_PASSWORD=your-pass    # Mot de passe de votre VPN
```

### Étape 3: Mettez à jour Docker Compose

Ouvrez le fichier `docker-compose.yaml` :

```bash
nano /opt/yams/docker-compose.yaml
```

Trouvez la section du service qBittorrent et faites les changements suivants :

```yaml
qbittorrent:
    # ports:     # Commentez cette ligne
    #  - 8081:8081
    network_mode: "service:gluetun" # Décommentez cette ligne
```

Trouvez la section pour le service SABnzbd et faites de même :

```yaml
sabnzbd:
    # ports:     # Commentez cette ligne
    # - 8080:8080
    network_mode: "service:gluetun" # Décommentez cette ligne
```

À la fin du fichier, trouvez la section du service Gluetun et décommentez ces ports :

```yaml
gluetun:
    ports:
        - 8080:8080/tcp # Décommentez cette ligne
        - 8081:8081/tcp # Décommentez cette ligne
```

### Étape 4: Redémarrez et testez

```bash
yams restart
```

### Étape 5: Vérifiez que tout fonctionne correctement

```bash
yams check-vpn
```

Vous devriez avoir le résultat suivant :

```bash
Getting your qBittorrent IP...
<qbittorrent_ip>
Your country in qBittorrent is Brazil

Getting your IP...
<your_local_ip>
Your local IP country is North Korea

Your IPs are different. qBittorrent is working as expected! ✅
```

Si vous avez une erreur, revérifiez tous vos paramètres et assurez-vous qu'ils soient corrects !

## Astuces 🎯

1. **Vérifications régulières** : Utilisez la commande `yams check-vpn` régulièrement pour vérifier que votre VPN fonctionne
2. **Kill Switch** : YAMS inclut automatiquement un Kill Switch. Si le VPN disfonctionne, les téléchargements s'arrêtent automatiquement.
3. **La vitesse compte** : Choisissez un serveur VPN proche de vous pour de meilleures performances
4. **Problèmes de port** : Si vous ne pouvez plus accéder à qBittorrent après avoir mis en place le VPN, consultez la section dépannage ci-dessous

## Passer à WireGuard ⚡

Par défaut, YAMS utilise le protocole **OpenVPN** avec Gluetun mais si votre fournisseur de VPN le supporte, vous pouvez passer à **WireGuard** pour de meilleurs performances.

Nous vous recommandons d'utiliser ProtonVPN, et nous avons écrit un guide complet pour vous aider à changer :

👉 [Configurer Gluetun avec WireGuard](/advanced/wireguard/).

> 💡 Si vous stockez votre clé privée WireGuard dans le fichier `.env`, assurez-vous d'avoir lu le guide [Votre fichier d'environnement](/advanced/env-file/) pour savoir comment gérer vos secrets correctement.

## Dépannage 🔧

### Problèmes courants :

1. **Accès impossible à qBittorent :**

    - Vérifiez les logs de gluetun : `docker logs gluetun`
    - Vérifiez les informations de connexion de votre VPN
    - Assurez-vous que les ports sont correctement configurés

2. **Déconnexion intempestives du VPN :**

    - Essayez un serveur VPN différent
    - Vérifiez votre connextion internet
    - Cherchez les éventuelles erreurs dans les logs de gluetun

3. **Téléchargements lents :**
    - Essayez un serveur VPN plus proche de vous
    - Vérifiez si votre fournisseur VPN restreint le Peer-to-peer
    - Certains fournisseurs ont des serveurs dédiés au torrenting. Essayez-les !

## Besoin de plus de sécurité ? 🛡️

Vous voulez vérifier que votre client torrent utilise bien le VPN ? Dirigez-vous vers [Détecter les fuites d'IP](/advanced/torrenting/#la-sécurité-dabord--détecter-les-fuites-dip-) pour un guide détaillé !

## Toujours besoin d'aide ? 🆘

Si vous êtes bloqué :

1. Visitez notre page [Problèmes courants](/faqs/common-errors/)
2. Visitez le [Forum YAMS](https://forum.yams.media)
3. Rejoignez notre serveur [Discord](https://discord.gg/Gwae3tNMST) ou [Matrix](https://matrix.to/#/#yams-space:rogs.me)

N'oubliez pas : Un VPN fonctionnel est crucial pour télécharger de manière sécurisée. Prenez le temps de l'installer correctement et vous serez prêts à démarrer ! 🚀
