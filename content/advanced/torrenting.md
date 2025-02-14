---
title: "Torrenting"
date: 2025-01-16T08:51:14+02:00
draft: false
weight: 5
summary: Tout ce que vous devez savoir pour une utilisation sûre et efficace des torrents avec YAMS
---

# Torrenting avancé avec YAMS 🌊

Bien que [Sonarr](/config/sonarr) et [Radarr](/config/radarr) gèrent la plupart de vos téléchargements automatiquement, il peut arriver que vous souhaitiez télécharger quelque chose manuellement. Voyons comment le faire en toute sécurité !

## Téléchargements manuels 📥

### Ajouter un torrent

1. Ouvrez qBittorrent depuis `http://{votre-adresse-ip}:8081`
2. Cliquez sur l'icône "+" ou le bouton "Add torrent file" :
   [![Add torrent button](/pics/advanced-torrent-1.png)](/pics/advanced-torrent-1.png)

3. Sélectionnez votre fichier .torrent et cliquez sur "Upload Torrents" :
   [![Upload torrents](/pics/advanced-torrent-2.png)](/pics/advanced-torrent-2.png)

4. Suivez l'avancée du téléchargement :
   [![Download progress](/pics/advanced-torrent-3.png)](/pics/advanced-torrent-3.png)

### Trouver vos téléchargements

Lorsqu'un téléchargement est fini, vous trouverez le fichier dans votre répertoire multimédia, dans le dossier "downloads" :

```bash
/srv/media$ tree downloads/torrents/
downloads/torrents/
└── your-downloaded-file.iso

0 directories, 1 file
```

## La sécurité d'abord : Détecter les fuites d'IP 🛡️

Même avec un VPN, il est important de vérifier que votre véritable IP ne soit pas exposée. Voici comment procéder à une vérification approfondie :

### Utiliser un testeur d'IP

1. Visitez le site [whatismyip.net Torrent Checker](https://www.whatismyip.net/tools/torrent-ip-checker/index.php) récupérez leur lien magnet :
   [![Torrent checker](/pics/advanced-torrent-4.png)](/pics/advanced-torrent-4.png)

2. Dans qBittorrent, cliquez sur "Add Torrent Link":
   [![Add magnet link](/pics/advanced-torrent-5.png)](/pics/advanced-torrent-5.png)

3. Coller le lien magnet et cliquez sur "Download":
   [![Paste magnet](/pics/advanced-torrent-6.png)](/pics/advanced-torrent-6.png)

4. Vous verrez apparaître un nouveau torrent appelé "Torrent Tracker IP Checker". Pas d'inquéitude, ça ne téléchargera rien !
   [![IP checker torrent](/pics/advanced-torrent-7.png)](/pics/advanced-torrent-7.png)

5. De retour sur leur site Web, vous pourrez voir l'adresse IP de votre client de téléchargement :
   [![IP check results](/pics/advanced-torrent-8.png)](/pics/advanced-torrent-8.png)

### Vérifier les résultats 🔍

Pour une bonne protection de votre vie privée, vérifiez que :

1. L'adresse IP affichée est **différente** de votre vraie adresse IP
2. L'adresse IP correspond à celle affichée par la commande `yams check-vpn`
3. Le pays affiché correspond à la localisation de votre serveur VPN

## Astuces pour une utilisation sécurisée des torrents 🎯

1. **Toujours vérifier votre VPN d'abord**

    ```bash
    yams check-vpn
    ```

    Faites-le avant chaque téléchargement !

2. **Utilisez le Kill Switch**
   YAMS configure qBittorrent pour utiliser uniquement l'interface réseau du VPN. Si le VPN disfonctionne, les téléchargements s'arrêtent automatiquement.

3. **Testez régulièrement**

    - Testez votre IP tous les mois
    - Vérifiez le statut de votre VPN avant de gros téléchargements
    - Surveillez le statut de connexion de qBittorrent

4. **Organisation des téléchargements**

    - Utilisez des labels pour les différents types de contenu
    - Mettez en place des dossiers de téléchargment selon les catégories du contenu (TV, films, livres, etc.)
    - Supprimez les torrents complets régulièrement

5. **Activez la redirection de port**
    - Visitez notre guide sur la [Redirection de port](/advanced/port-forwarding/)
    - Améliore significativement la vitesse de téléchargement
    - Fonctionne automatiquement avec ProtonVPN

## Dépanner les problèmes courants 🔧

### Les téléchargements ne démarrent pas

1. Vérifiez la connexion du VPN
    ```bash
    yams check-vpn
    ```
2. Vérifiez le statut des trackers sur qBittorrent
3. Essayez un autre serveur VPN

### Téléchargements lents

1. Essayez un serveur VPN plus proche de vous
2. Vérifiez si votre fournisseur VPN restreint le Peer-to-peer
3. Vérifiez si vous n'atteignez pas les limites d'utilisation de bande passante de votre VPN

### Coupures de connexion

1. Vérifiez si le problème provient du fournisseur VPN
2. Essayez un serveur VPN différent
3. Surveillez l'utilisation des ressources système

## Bonnes pratiques 📚

1. **Gardez le VPN allumé**

    - Vérifiez toujours si le VPN est actif avant de télécharger
    - Utilisez la commande `yams check-vpn` régulièrement
    - Surveillez l'interface réseau de qBittorrent

2. **Maintenance régulière**

    - Supprimez les torrents complets
    - Mettez à jour qBittorrent lorsque YAMS le demande
    - Vérifiez régulièrement les fuites d'IP

3. **Gestion des téléchargements**
    - Mettez des ratios raisonnables
    - Utilisez des catégories pour l'organisation
    - Surveillez l'espace disque régulièrement

## Besoin d'aide ? 🆘

Vous avez des soucis avec le torrenting ? Nous sommes là pour vous aider !

1. Visitez notre page [Problèmes courants](/faqs/common-errors/)
2. Visitez le [Forum YAMS](https://forum.yams.media)
3. Rejoignez notre serveur [Discord](https://discord.gg/Gwae3tNMST) ou [Matrix](https://matrix.to/#/#yams-space:rogs.me)

N'oubliez pas : Un torrenting sûr est un bon torrenting. Vérifiez toujours que votre VPN fonctionne avant de télécharger ! 🛡️
