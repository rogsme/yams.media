---
title: "Sonarr"
date: 2025-01-29T13:25:21+02:00
draft: false
weight: 4
summary: Sonarr est un outil de gestion de collections de séries TV pour les utilisateurs de Usenet et de BitTorrent. Il surveille plusieurs flux RSS pour trouver de nouveaux épisodes de séries, puis les télécharge, les renomme et les classe. Il peut également améliorer automatiquement la qualité des fichiers existants si une meilleure version devient disponible.
---

# Qu'est-ce que Sonarr ?

Selon leur [wiki](https://wiki.servarr.com/sonarr) :

> Sonarr est un outil de gestion de collections de séries TV pour les utilisateurs de Usenet et de BitTorrent. Il surveille plusieurs flux RSS pour trouver de nouveaux épisodes de séries, puis les télécharge, les renomme et les classe. Il peut également améliorer automatiquement la qualité des fichiers existants si une meilleure version devient disponible.

Dans YAMS, Sonarr va gérer toutes nos séries TV : les télécharger, les trier et tout organiser. C'est comme si vous aviez un majordome personnel pour vos séries TV ! 📺

## Configuration initiale

Depuis votre navigateur, allez à l'adresse [http://{votre-adresse-ip}:8989/](). Comme avec Radarr, on va commencer avec quelques réglages de sécurité élémentaires.

-   Sélectionnez "Forms (Login Page)" comme méthode d'authentication
-   Dans "Authentication Required" sélectionnez "Disabled for Local Addresses" (vous n'aurez pas besoin de vous connecter lorsque vous êtes chez vous)

Créez votre nom d'utilisateur et votre mot de passe, puis cliquez sur enregistrer :

[![sonarr-18](/pics/sonarr-18.png)](/pics/sonarr-18.png)

Vous allez arriver sur une page vide avec notamment 3 messages sur l'onglet "System". Pas d'inquiétude, on s'en occupera juste après !

[![sonarr-1](/pics/sonarr-1.png)](/pics/sonarr-1.png)

### Gestion des médias

Tout d'abord, indiquons à Sonarr comment gérer nos séries TV. Allez dans "Settings" puis "Media management". Sur cet écran :

-   Cliquez sur "Show Advanced" (rassurez-vous, nous allons faire simple !)
-   Cochez l'option "Rename Episodes"
-   Entrez les formats de noms suivants :
    -   "Standard Episode Format": `{Series Title} - S{season:00}E{episode:00} - {Episode Title}`
    -   "Daily Episode Format": `{Series Title} - {Air-Date} - {Episode Title}`
    -   "Anime Episode Format": `{Series Title} - S{season:00}E{episode:00} - {Episode Title}`
    -   "Series Folder Format": `{Series TitleYear}`

[![sonarr-2](/pics/sonarr-2.png)](/pics/sonarr-2.png)

En bas de la même page, descendez jusqu'à "Root folders" et cliquez sur "Add Root Folder".

[![sonarr-3](/pics/sonarr-3.png)](/pics/sonarr-3.png)

Ajoutez le dossier `/data/tvshows/` :

[![sonarr-4](/pics/sonarr-4.png)](/pics/sonarr-4.png)

**Note :** Comme avec Radarr, le dossier `/data/tvshows/` existe dans l'environnement docker et correspond au dossier `/mediafolder/media/tvshows/` de votre serveur. La magie de Docker à l'œuvre ! ✨

Enfin, cliquez sur "Save Changes".

[![sonarr-5](/pics/sonarr-5.png)](/pics/sonarr-5.png)

### Clients de téléchargement

Il est temps de connecter Sonarr à nos clients téléchargement ! C'est ici que nous allons relier [qBittorrent](/config/qbittorrent) et [SABnzbd](/config/sabnzbd) à Sonarr.

#### Configuration de qBittorrent

Dans l'onglet "Settings", allez sur "Download Clients" puis cliquez sur le bouton ➕.

[![sonarr-13](/pics/sonarr-13.png)](/pics/sonarr-13.png)

Trouvez puis cliquez sur "qBittorrent" dans la liste.

[![sonarr-14](/pics/sonarr-14.png)](/pics/sonarr-14.png)

Remplissez les informations suivantes :

-   Dans "Name", mettez "qBittorrent" (ou le nom que vous souhaitez !).
-   Dans "Host", mettez l'adresse IP de votre serveur (`192.168.0.190` par exemple).
-   Dans "Port", mettez `8081`
-   Dans "Username", mettez `admin`.
-   Dans "Password", mettez votre mot de passe qBittorrent.

[![sonarr-15](/pics/sonarr-15.png)](/pics/sonarr-15.png)

Cliquez sur le bouton "Test", si tout fonctionne correctement, vous verrez un ✅ !
[![sonarr-10](/pics/sonarr-10.png)](/pics/sonarr-10.png)
[![sonarr-11](/pics/sonarr-11.png)](/pics/sonarr-11.png)

Tout est bon ? Cliquez sur "Save". Votre client de téléchargement devrait maintenant apparaître sur la page :

[![sonarr-16](/pics/sonarr-16.png)](/pics/sonarr-16.png)

#### Configuration de SABnzbd

De retour sur la page "Download Clients", cliquez sur le bouton ➕ à nouveau.

[![sonarr-13](/pics/sonarr-13.png)](/pics/sonarr-13.png)

Cette fois, descendez et choisissez "SABnzbd".

[![sonarr-19](/pics/sonarr-19.png)](/pics/sonarr-19.png)

-   Dans "Name", mettez `SABnzbd` (ou quelque chose de plus marrant)
-   Dans "Host", mettez l'adresse IP de votre serveur (`192.168.0.190` par exemple).
-   Dans "Port", mettez `8080`.
-   Dans "API Key", mettez votre clé API SABnzbd.

Si vous n'avez pas votre clé API SABnzbd sous la main, pas de soucis ! Vous pouvez la trouver ici : [Obtenir votre clé API pour Sonarr et Radarr](/config/sabnzbd/#obtenir-votre-clé-api-pour-sonarr-et-radarr)

[![sonarr-20](/pics/sonarr-20.png)](/pics/sonarr-20.png)

Il est temps de refaire un test ! Cliquez sur le bouton "Test", en espérant que vous verrez un nouveau ✅ !
[![sonarr-10](/pics/sonarr-10.png)](/pics/sonarr-10.png)
[![sonarr-11](/pics/sonarr-11.png)](/pics/sonarr-11.png)

Si le test a fonctionné, cliquez sur "Save". Vous devriez maintenant voir vos deux clients de téléchargement fonctionnels sur la page :

[![sonarr-21](/pics/sonarr-21.png)](/pics/sonarr-21.png)

## Avançons ! 🚀

Et voilà ! On peut maintenant avancer sur [Prowlarr](/config/prowlarr). Nous sommes sur le point d'obtenir votre propre service de streaming !

## Vous souhaitez devenir un utilisateur expérimenté de Sonarr ?

Si vous souhaitez explorer un peu plus en profondeur ce que Sonarr peut faire, consultez le [Guide TRaSH pour Sonarr](https://trash-guides.info/Sonarr/). Ils ont des conseils et des astuces incroyables ! 🔧
