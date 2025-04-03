---
title: "Readarr"
date: 2025-01-16T08:51:14+02:00
draft: false
weight: 110
summary: Readarr est un gestionnaire de bibliothèque d'ebooks pour les utilisateurs d'Usenet et de BitTorrent. Il peut surveiller plusieurs flux RSS pour détecter les nouveaux livres de vos auteurs préférés et s'interfacer avec les clients et les indexeurs pour les téclécharger, les trier et les renommer.
---

# Qu'est-ce que Readarr ?

Selon leur [wiki](https://readarr.com/):

> Readarr est un gestionnaire de bibliothèque d'ebooks pour les utilisateurs d'Usenet et de BitTorrent. Il peut surveiller plusieurs flux RSS pour détecter les nouveaux livres de vos auteurs préférés et s'interfacer avec les clients et les indexeurs pour les téclécharger, les trier et les renommer.

Dans YAMS, Readarr va s'occuper de gérer tous nos livres : téléchargement, tri, etc.

## Configuration initiale

Dans votre navigateur, allez sur [http://{votre-adresse-ip}:8787/](). Vous allez arriver sur une page vide avec notamment 3 messages sur l'onglet "System".

[![readarr-1](/pics/readarr-1.png)](/pics/readarr-1.png)

### Gestion des médias

Dans un premier temps, allez dans "Settings", puis "Media management". Sur cette page, cliquez sur le gros bouton ➕.

[![readarr-2](/pics/readarr-2.png)](/pics/readarr-2.png)

Depuis la fenêtre de dialogue "Add root folder", remplissez les informations suivantes :

-   Dans "Name", mettez "Books"
-   Dans "Path", mettez "/books/"

Enfin, cliquez sur "Save".

[![readarr-3](/pics/readarr-3.png)](/pics/readarr-3.png)

Vous devriez maintenant voir votre dossier "Books" dans la section "Root folder".

[![readarr-4](/pics/readarr-4.png)](/pics/readarr-4.png)

### Clients de téléchargement

Ici, vous allez ajouter les clients de téléchargement pour Readarr. C'est là que Readarr va se connecter à [qBittorrent](/config/qbittorrent).

Dans "Settings", allez sur "Download Clients" puis cliquez sur le bouton ➕.

[![readarr-5](/pics/readarr-5.png)](/pics/readarr-5.png)

Sur l'écran "Add Download Client", descendez puis cliquez sur "qBittorrent".

[![readarr-6](/pics/readarr-6.png)](/pics/readarr-6.png)

-   Dans "Name", mettez le nom de votre client de téléchargement (qBittorrent).
-   Dans "Host", mettez l'adresse IP de votre serveur (dans mon cas, `192.168.0.169`).
-   Dans "Username", mettez `admin`.
-   Dans "Password", mettez `adminadmin`.

[![readarr-7](/pics/readarr-7.png)](/pics/readarr-7.png)

En bas de la page, vous pouvez cliquer sur "Test" et si tout est bon, vous devriez voir un ✅
[![radarr-10](/pics/radarr-10.png)](/pics/radarr-10.png)
[![radarr-11](/pics/radarr-11.png)](/pics/radarr-11.png)

Si tout fonctionne correctement, cliquez sur "Save". Votre client de téléchargement devrait maintenant apparaître sur la page "Download Clients" !

[![readarr-8](/pics/readarr-8.png)](/pics/readarr-8.png)

### Configuration de Prowlarr

Vous allez d'abord avoir besoin de la clé API de votre instance Readarr.

Vous pouvez l'obtenir via Readarr. Allez sur [http://{votre-adresse-ip}:8787/settings/general](), dans l'onglet "Settings", puis dans la section "Security".

[![readarr-9](/pics/readarr-9.png)](/pics/readarr-9.png)

Pour l'instant, copiez juste la clé et gardez là dans un endroit sûr.

Dans "Settings", allez sur "Apps" et cliquez sur le bouton ➕.

[![readarr-10](/pics/readarr-10.png)](/pics/readarr-10.png)

Depuis la fenêtre de dialogue "Add Application", cliquez sur "Readarr"

[![readarr-11](/pics/readarr-11.png)](/pics/readarr-11.png)

-   Dans "Prowlarr Server", mettez `http://prowlarr:9696`
-   Dans "Readarr Server", mettez `http://readarr:8787`
-   Dans "ApiKey", mettez la clé d'API Readarr que vous avez copié précédemment.

[![readarr-12](/pics/readarr-12.png)](/pics/readarr-12.png)

En bas de la page, vous pouvez cliquer sur "Test" et si tout est bon, vous devriez voir un ✅
[![sonarr-10](/pics/sonarr-10.png)](/pics/sonarr-10.png)
[![sonarr-11](/pics/sonarr-11.png)](/pics/sonarr-11.png)

Si tout fonctionne correctement, cliquez sur "Save". Vous devriez maintenant voir Readarr dans la liste d'applications !

[![readarr-13](/pics/readarr-13.png)](/pics/readarr-13.png)

**N'oubliez pas d'ajouter des indexeurs pour les livres**. Vous ne serez pas capable de télécharger si aucun indexeur dédié aux livres n'est ajouté à Prowlarr. Pour ajouter un indexeur, allez sur [Configuration des indexeurs via Prowlarr](/config/prowlarr/#indexers).

## Utilisation

Retournez sur Readarr, allez dans "Library/Add New" et cherchez un auteur. Sélectionnez le pour l'ajouter à Readarr.

[![readarr-14](/pics/readarr-14.png)](/pics/readarr-14.png)

Depuis la fenêtre de dialogue "Add new Author", cliquez sur "Start search for missing books" et appuyez enfin sur "Add".

[![readarr-15](/pics/readarr-15.png)](/pics/readarr-15.png)

Et voilà ! Vous devriez voir l'ajout de l'auteur. Le téléchargement devrait commencer rapidement.

[![readarr-16](/pics/readarr-16.png)](/pics/readarr-16.png)
