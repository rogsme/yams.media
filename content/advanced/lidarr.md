---
title: "Lidarr"
date: 2025-01-15T11:50:16+02:00
draft: false
weight: 8
summary: Lidarr est un gestionnaire de bibliothèque musicale pour les utilisateurs d'Usenet et de BitTorrent. Il peut surveiller plusieurs flux RSS pour détecter les nouveaux albums de vos artistes préférés et s'interfacer avec les clients et les indexeurs pour les récupérer, les trier et les renommer. Lidarr peut également être configuré pour améliorer automatiquement la qualité des fichiers existants dans la bibliothèque lorsqu'un format de meilleure qualité devient disponible.
---

# Qu'est-ce que Lidarr ?

Selon leur [wiki](https://lidarr.audio/) :

> Lidarr est un gestionnaire de bibliothèque musicale pour les utilisateurs d'Usenet et de BitTorrent. Il peut surveiller plusieurs flux RSS pour détecter les nouveaux albums de vos artistes préférés et s'interfacer avec les clients et les indexeurs pour les récupérer, les trier et les renommer. Lidarr peut également être configuré pour améliorer automatiquement la qualité des fichiers existants dans la bibliothèque lorsqu'un format de meilleure qualité devient disponible.

Dans YAMS, Lidarr va s'occuper de gérer toute notre musique : téléchargement, tri, etc.

## Configuration initiale

Dans votre navigateur, allez sur [http://{votre-adresse-ip}:8686/](). Vous allez arriver sur une page vide avec notamment 3 messages sur l'onglet "System".

[![lidarr-1](/pics/lidarr-1.png)](/pics/lidarr-1.png)

### Gestion des médias

Dans un premier temps, allez dans "Settings", puis "Media management". Sur cette page, cliquez sur le gros bouton ➕.

[![lidarr-2](/pics/lidarr-2.png)](/pics/lidarr-2.png)

Depuis la fenêtre de dialogue "Add root folder", remplissez les informations suivantes :

-   Dans "Name", mettez "Music"
-   Dans "Path", mettez "/music/"

Enfin, cliquez sur "Save".

[![lidarr-3](/pics/lidarr-3.png)](/pics/lidarr-3.png)

Vous devriez maintenant voir votre dossier "Music" dans la section "Root folder".

[![lidarr-4](/pics/lidarr-4.png)](/pics/lidarr-4.png)

### Clients de téléchargement

Ici, vous allez ajouter les clients de téléchargement pour Lidarr. C'est là que Lidarr va se connecter à [qBittorrent](/config/qbittorrent).

Dans "Settings", allez sur "Download Clients" puis cliquez sur le bouton ➕.

[![lidarr-5](/pics/lidarr-5.png)](/pics/lidarr-5.png)

Sur l'écran "Add Download Client", descendez puis cliquez sur "qBittorrent".

[![lidarr-6](/pics/lidarr-6.png)](/pics/lidarr-6.png)

-   Dans "Name", mettez le nom de votre client de téléchargement (qBittorrent).
-   Dans "Host", mettez l'adresse IP de votre serveur (dans mon cas, `192.168.0.169`).
-   Dans "Username", mettez `admin`.
-   Dans "Password", mettez `adminadmin`.

[![lidarr-7](/pics/lidarr-7.png)](/pics/lidarr-7.png)

En bas de la page, vous pouvez cliquer sur "Test" et si tout est bon, vous devriez voir un ✅
[![radarr-10](/pics/radarr-10.png)](/pics/radarr-10.png)
[![radarr-11](/pics/radarr-11.png)](/pics/radarr-11.png)

Si tout fonctionne correctement, cliquez sur "Save". Votre client de téléchargement devrait maintenant apparaître sur la page "Download Clients" !

[![lidarr-8](/pics/lidarr-8.png)](/pics/lidarr-8.png)

### Configuration de Prowlarr

Vous allez d'abord avoir besoin de la clé API de votre instance Lidarr.

Vous pouvez l'obtenir via Lidarr. Allez sur [http://{votre-adresse-ip}:8686/settings/general](), dans l'onglet "Settings", puis dans la section "Security".

[![lidarr-11](/pics/lidarr-11.png)](/pics/lidarr-11.png)

Pour l'instant, copiez juste la clé et gardez là dans un endroit sûr.

Dans "Settings", allez sur "Apps" et cliquez sur le bouton ➕.

[![lidarr-9](/pics/lidarr-9.png)](/pics/lidarr-9.png)

Depuis la fenêtre de dialogue "Add Application", cliquez sur "Lidarr"

[![lidarr-10](/pics/lidarr-10.png)](/pics/lidarr-10.png)

-   Dans "Prowlarr Server", mettez `http://prowlarr:9696`
-   Dans "Lidarr Server", mettez `http://lidarr:8686`
-   Dans "ApiKey", mettez la clé d'API Lidarr que vous avez copié précédemment.

[![lidarr-12](/pics/lidarr-12.png)](/pics/lidarr-12.png)

En bas de la page, vous pouvez cliquer sur "Test" et si tout est bon, vous devriez voir un ✅
[![sonarr-10](/pics/sonarr-10.png)](/pics/sonarr-10.png)
[![sonarr-11](/pics/sonarr-11.png)](/pics/sonarr-11.png)

Si tout fonctionne correctement, cliquez sur "Save". Vous devriez maintenant voir Lidarr dans la liste d'applications !

[![lidarr-13](/pics/lidarr-13.png)](/pics/lidarr-13.png)

**N'oubliez pas d'ajouter des indexeurs pour la musique**. Vous ne serez pas capable de télécharger si aucun indexeur dédié à la musique n'est ajouté à Prowlarr. Pour ajouter un indexeur, allez sur [Configuration des indexeurs via Prowlarr](/config/prowlarr/#indexers).

## Utilisation

Retournez sur Lidarr, allez dans "Library/Add New" et cherchez un groupe de musique. Sélectionnez le pour l'ajouter à Lidarr.

[![lidarr-14](/pics/lidarr-14.png)](/pics/lidarr-14.png)

Depuis la fenêtre de dialogue "Add new Artist", choisissez un profil de qualité ("Quality Profile"), cliquez sur "Start search for missing albums" et appuyez enfin sur "Add".

[![lidarr-15](/pics/lidarr-15.png)](/pics/lidarr-15.png)

Et voilà ! Vous devriez voir l'ajout du votre groupe de musique. Le téléchargement devrait commencer rapidement.

[![lidarr-16](/pics/lidarr-16.png)](/pics/lidarr-16.png)
