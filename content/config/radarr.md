---
title: "Radarr"
date: 2025-01-29T13:25:21+02:00
draft: false
weight: 3
summary: Radarr est un outil de gestion de collections de films pour les utilisateurs d'Usenet et de BitTorrent. Il surveille plusieurs flux RSS pour trouver des nouveaux films, puis les télécharge, les renomme et les classe. Il peut également améliorer automatiquement la qualité des fichiers existants si une meilleure version devient disponible.
---

# Qu'est-ce que Radarr ?

Selon leur [wiki](https://wiki.servarr.com/radarr) :

> Radarr est un outil de gestion de collections de films pour les utilisateurs d'Usenet et de BitTorrent. Il surveille plusieurs flux RSS pour trouver des nouveaux films, puis les télécharge et les renomme et les classe. Il peut également améliorer automatiquement la qualité des fichiers existants si une meilleure version devient disponible.

Dans YAMS, Radarr va gérer tous nos films : les télécharger, les trier et tout organiser. C'est comme si vous aviez un majordome personnel pour vos films ! 🎬

## Configuration initiale

Depuis votre navigateur, allez à l'adresse [http://{votre-adresse-ip}:7878/](). Tout d'abord, nous devons mettre en place quelques mesures de sécurité élémentaires.

-   Sélectionnez "Forms (Login Page)" comme méthode d'authentication
-   Dans "Authentication Required" sélectionnez "Disabled for Local Addresses" (vous n'aurez pas besoin de vous connecter lorsque vous êtes chez vous)

Remplissez avec votre nom d'utilisateur et votre mot de passe, puis cliquez sur enregistrer :

[![radarr-18](/pics/radarr-18.png)](/pics/radarr-18.png)

Vous allez arriver sur une page vide avec notamment 3 messages sur l'onglet "System". Pas d'inquiétude, on s'en occupera juste après !

[![radarr-1](/pics/radarr-1.png)](/pics/radarr-1.png)

### Gestion des médias

Tout d'abord, indiquons à Radarr comment gérer nos films. Allez dans "Settings" puis "Media management". Sur cet écran :

-   Cliquez sur "Show Advanced" (rassurez-vous, nous allons faire simple !)
-   Cochez l'option "Rename Movies"
-   Remplacez "Standard Movie Format" par `{Movie Title} ({Release Year})`

[![radarr-2](/pics/radarr-2.png)](/pics/radarr-2.png)

En bas de la même page, descendez jusqu'à "Root folders" et cliquez sur "Add Root Folder".

[![radarr-3](/pics/radarr-3.png)](/pics/radarr-3.png)

Ajoutez maintenant le dossier `/data/movies/` :

[![radarr-4](/pics/radarr-4.png)](/pics/radarr-4.png)

**Note :** Ce n'est pas réellement l'emplacement sur votre système ! Le dossier `/data/movies/` existe dans l'environnement docker et correspond au dossier `/mediafolder/media/movies/` de votre serveur. Magique ! ✨

Enfin, cliquez sur "Save Changes".

[![radarr-5](/pics/radarr-5.png)](/pics/radarr-5.png)

### Clients de téléchargement

Il est temps de connecter Radarr à nos clients téléchargement ! C'est ici que nous allons relier [qBittorrent](/config/qbittorrent) et [SABnzbd](/config/sabnzbd) à Radarr.

#### Configuration de qBittorrent

Dans l'onglet "Settings", allez sur "Download Clients" puis cliquez sur le bouton ➕.

[![radarr-13](/pics/radarr-13.png)](/pics/radarr-13.png)

Sur l'écran "Add Download Client", descendez puis cliquez sur "qBittorrent".

[![radarr-14](/pics/radarr-14.png)](/pics/radarr-14.png)

-   Dans "Name", mettez le nom de votre client de téléchargement (qBittorrent).
-   Dans "Host", mettez l'adresse IP de votre serveur (`192.168.0.190` par exemple).
-   Dans "Username", mettez `admin`.
-   Dans "Password", mettez votre mot de passe qBittorrent.

[![radarr-15](/pics/radarr-15.png)](/pics/radarr-15.png)

En bas de la page, vous pouvez cliquer sur "Test" et si tout est bon, vous devriez voir un ✅ !
[![radarr-10](/pics/radarr-10.png)](/pics/radarr-10.png)
[![radarr-11](/pics/radarr-11.png)](/pics/radarr-11.png)

Si tout fonctionne correctement, cliquez sur "Save". Votre client de téléchargement devrait maintenant apparaître sur la page "Download Clients" !

[![radarr-16](/pics/radarr-16.png)](/pics/radarr-16.png)

#### Configuration de SABnzbd

De retour sur la page "Download Clients", cliquez sur le bouton ➕ à nouveau.

[![radarr-13](/pics/radarr-13.png)](/pics/radarr-13.png)

Cette fois, descendez et choisissez "SABnzbd".

[![radarr-19](/pics/radarr-19.png)](/pics/radarr-19.png)

-   Dans "Name", mettez `SABnzbd`.
-   Dans "Host", mettez l'adresse IP de votre serveur (`192.168.0.190` par exemple).
-   Dans "Port", mettez `8080`.
-   Dans "API Key", mettez votre clé API SABnzbd.

Si vous n'avez pas votre clé API SABnzbd sous la main, pas de soucis ! Vous pouvez la trouver ici : [Obtenir votre clé API pour Sonarr et Radarr](/config/sabnzbd/#obtenir-votre-clé-api-pour-sonarr-et-radarr)

[![radarr-20](/pics/radarr-20.png)](/pics/radarr-20.png)

Il est temps de refaire un test ! Cliquez sur le bouton "Test", en espérant que vous verrez un nouveau ✅ !
[![radarr-10](/pics/radarr-10.png)](/pics/radarr-10.png)
[![radarr-11](/pics/radarr-11.png)](/pics/radarr-11.png)

Si le test a fonctionné, cliquez sur "Save". Vous devriez maintenant voir vos deux clients de téléchargement sur la page :

[![radarr-21](/pics/radarr-21.png)](/pics/radarr-21.png)

## Avançons ! 🚀

Ça commence à prendre forme ! On peut maintenant continuer avec [Sonarr](/config/sonarr). On se rapproche de votre Netflix personnel !

## Envie d'un peu de fantaisie ?

Si vous souhaitez aller plus loin dans la configuration de Radarr, je vous recommande grandement de consulter le [Guide TRaSH pour Radarr](https://trash-guides.info/Radarr/). Il y a des options avancées vraiment cool dedans ! 🔧
