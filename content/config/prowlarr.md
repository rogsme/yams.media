---
title: "Prowlarr"
date: 2025-01-29T13:25:21+02:00
draft: false
weight: 5
summary: Prowlarr est un gestionnaire d'indexeur/proxy construit sur la populaire stack *arr en .net/reactjs, s'intégrant à vos différentes applications de gestion de collections. Prowlarr prend en charge la gestion des trackers Torrent et des indexeurs Usenet. Il s'intègre parfaitement avec Lidarr, Mylar3, Radarr, Readarr et Sonarr, offrant une gestion complète de vos indexeurs sans  tour reconfigurer sur chaque application (nous nous occupons de tout).
---

## Qu'est-ce que Prowlarr ?

Selon leur [dépôt Github](https://github.com/Prowlarr/Prowlarr/) :

> Prowlarr est un gestionnaire d'indexeur/proxy construit sur la populaire stack \*arr en .net/reactjs, s'intégrant à vos différentes applications de gestion de collections. Prowlarr prend en charge la gestion des trackers Torrent et des indexeurs Usenet. Il s'intègre parfaitement avec Lidarr, Mylar3, Radarr, Readarr et Sonarr, offrant une gestion complète de vos indexeurs sans tour reconfigurer sur chaque application (nous nous occupons de tout).

En gros, nous allons utiliser Prowlarr pour **rechercher des torrents** et les envoyer à [qBittorrent](/config/qbittorrent) ou [SABnzbd](/config/sabnzbd) pour le téléchargement. Considérez-le comme votre moteur de recherche personnel ! 🔍

## Configuration initiale

Depuis votre navigateur, allez à l'adresse [http://{votre-adresse-ip}:9696/](). Ajoutons quelques réglages de sécurité basique :

-   Sélectionnez "Forms (Login Page)" comme méthode d'authentication
-   Dans "Authentication Required" sélectionnez "Disabled for Local Addresses" (vous n'aurez pas besoin de vous connecter lorsque vous êtes chez vous)

[![prowlarr-1](/pics/prowlarr-1.png)](/pics/prowlarr-1.png)

### Comprendre les indexeurs

Avant d'entrer dans le vif du sujet, parlons des deux types d'indexeurs que vous pouvez utiliser avec Prowlarr :

#### Indexeurs Usenet 📰

La plupart des bons indexeurs Usenet sont des services payants, mais ils sont généralement assez abordables et valent la peine d'être étudiés ! Quelques-uns des plus populaires sont :

-   [DrunkenSlug](https://drunkenslug.com) (sur invitation seulement !)
-   [NZBGeek](https://nzbgeek.info)

N'oubliez pas que si vous souhaitez utiliser des indexeurs Usenet, vous aurez également besoin d'un fournisseur Usenet configuré dans [SABnzbd](/config/sabnzbd)!

#### Indexeurs de torrents 🧲

Pour ce tutoriel, nous nous concentrerons sur les indexeurs de torrents gratuits car ils sont plus faciles à utiliser. N'oubliez pas de toujours utiliser un VPN lorsque vous faites du torrent !

### Ajouter des indexeurs

Sur la page d'accueil, cliquez sur "Add Next Indexer". Il est temps d'apprendre à Prowlarr où chercher du contenu !

[![prowlarr-2](/pics/prowlarr-2.png)](/pics/prowlarr-2.png)

Pour ce tutoriel, j'ajouterai deux indexeurs populaires : YTS (idéal pour les films) et eztv (parfait pour les séries télévisées). Mais vous pouvez ajouter tous les indexeurs que vous souhaitez !

Trouvez votre indexeur et cliquez dessus :

[![prowlarr-3](/pics/prowlarr-3.png)](/pics/prowlarr-3.png)

Vous allez voir une fenêtre de dialogue nommée "Add Indexer - Cardigann (votre indexeur)". Tout ce que vous devez faire est de choisir une URL depuis la liste "Base Url". Easy peasy !

[![prowlarr-4](/pics/prowlarr-4.png)](/pics/prowlarr-4.png)

Cliquez sur le bouton "Test", si tout fonctionne correctement, vous verrez un ✅ !
[![sonarr-10](/pics/sonarr-10.png)](/pics/sonarr-10.png)
[![sonarr-11](/pics/sonarr-11.png)](/pics/sonarr-11.png)

Tout est bon ? Cliquez sur "Save" et vous serez renvoyé sur la fenêtre "Add Indexer".

#### Combien d'indexeurs devrais-je ajouter ? 🤔

Autant que vous le souhaitez ! Il suffit de répéter ces étapes pour chaque nouvel indexeur dans Prowlarr. Plus vous avez d'indexeurs, plus vous avez de chances de trouver ce que vous cherchez ! C'est comme avoir plus de bibliothèques à consulter pour trouver des livres. 📚

Lorsque vous avez fini d'ajouter des indexeurs, fermez la fenêtre de dialogue et vous verrez tous vos indexeurs sur la page principale :

[![prowlarr-5](/pics/prowlarr-5.png)](/pics/prowlarr-5.png)

### Connexion à Radarr et Sonarr

Maintenant vient la partie la plus amusante : relier Prowlarr à Radarr et Sonarr ! C'est là que tout commence à fonctionner ensemble. ✨

#### Connexion à Radarr

Vous allez d'abord avoir besoin de la clé API de votre instance Radarr. Vous pouvez l'obtenir via Radarr. Allez sur [http://{votre-adresse-ip}:7878/settings/general](), dans l'onglet "Settings", puis dans la section "Security".

[![bazarr-17](/pics/bazarr-17.png)](/pics/bazarr-17.png)

Copiez cette clé API et gardez-là sous la main !

Dans Prowlarr, allez dans "Settings", allez sur "Apps" et cliquez sur le bouton ➕.

[![prowlarr-6](/pics/prowlarr-6.png)](/pics/prowlarr-6.png)

Cliquez sur "Radarr" :

[![prowlarr-7](/pics/prowlarr-7.png)](/pics/prowlarr-7.png)

Remplissez les champs suivants :

-   Dans "Prowlarr Server", mettez `http://prowlarr:9696`
-   Dans "Radarr Server", mettez `http://radarr:7878`
-   Dans "ApiKey", mettez la clé d'API Radarr que vous avez copié précédemment.

[![prowlarr-8](/pics/prowlarr-8.png)](/pics/prowlarr-8.png)

En bas de la page, vous pouvez cliquer sur "Test" et si tout est bon, vous devriez voir un ✅
[![sonarr-10](/pics/sonarr-10.png)](/pics/sonarr-10.png)
[![sonarr-11](/pics/sonarr-11.png)](/pics/sonarr-11.png)

Si tout fonctionne correctement, cliquez sur "Save". Vous devriez maintenant voir Radarr dans la liste d'applications !

[![prowlarr-9](/pics/prowlarr-9.png)](/pics/prowlarr-9.png)

#### Connexion à Sonarr

C'est maintenant le tour de Sonarr ! Récupérez votre clé API Sonarr depuis [http://{votre-adresse-ip}:8989/settings/general](), dans la section "Security", comme dans Radarr.

[![bazarr-14](/pics/bazarr-14.png)](/pics/bazarr-14.png)

Copiez cette clé API et gardez-là sous la main !

De retour dans Prowlarr, allez dans "Settings", allez sur "Apps" et cliquez à nouveau sur le bouton ➕.

[![prowlarr-10](/pics/prowlarr-10.png)](/pics/prowlarr-10.png)

Cette fois, cliquez sur "Sonarr" :

[![prowlarr-11](/pics/prowlarr-11.png)](/pics/prowlarr-11.png)

Remplissez les champs suivants :

-   Dans "Prowlarr Server", mettez `http://prowlarr:9696`
-   Dans "Sonarr Server", mettez `http://sonarr:8989`
-   Dans "ApiKey", mettez la clé d'API Sonarr que vous avez copié précédemment.

[![prowlarr-12](/pics/prowlarr-12.png)](/pics/prowlarr-12.png)

Encore un test ! Cliquez sur "Test" en espérant que vous verrez un nouveau ✅ !
[![sonarr-10](/pics/sonarr-10.png)](/pics/sonarr-10.png)
[![sonarr-11](/pics/sonarr-11.png)](/pics/sonarr-11.png)

Tout est bon ? Cliquez sur "Save". Vous devriez maintenant voir Radarr et Sonarr dans la liste des applications :

[![prowlarr-13](/pics/prowlarr-13.png)](/pics/prowlarr-13.png)

Enfin, cliquez sur "Sync App indexers", c'est là que la magie opère ! 🎩

[![prowlarr-14](/pics/prowlarr-14.png)](/pics/prowlarr-14.png)

Vous voulez voir quelque chose de cool ? Allez vérifier les paramètres "Indexer" de Sonarr et Radarr : vos indexeurs ont été automatiquement ajoutés ! Pas besoin de copier-coller !

[![prowlarr-15](/pics/prowlarr-15.png)](/pics/prowlarr-15.png)

[![prowlarr-16](/pics/prowlarr-16.png)](/pics/prowlarr-16.png)

## Avançons ! 🚀

On peut maintenant avancer sur [Bazarr](/config/bazarr), il va répondre à tous vos besoins en sous-titres !

## Vous voulez devenir un expert de Prowlarr ?

Si vous souhaitez explorer plus en profondeur ce que Prowlarr peut faire, consultez le [Guide TRaSH pour Prowlarr](https://trash-guides.info/Prowlarr/). Ils ont des conseils incroyables pour les utilisateurs expérimentés ! 🔧
