---
title: "C'est quoi YAMS ?"
date: 2025-01-16T14:57:14+02:00
draft: false
weight: 1
summary: Tout ce dont vous devez savoir au sujet de YAMS et pourquoi c'est génial
---

# Bienvenue sur YAMS 🎬

YAMS (Yet Another Media Server ou "Encore un autre serveur multimédia") est un serveur multimédia **aux partis pris assumés** qui fonctionne tout simplement. Pas de chichis, pas de complexité, juste une expérience multimédia fluide et automatisée installable en quelques minutes !

## L'histoire derrière YAMS 📖

En 2019, j'avais une mission : Créer un serveur multimédia que copine sans connaissance en informatique pourrait utiliser sans m'appeller à l'aide toutes les 5 minutes. J'ai donc foncé, en combinant quelques projets open-source géniaux et en les intégrant dans des conteneurs Docker.

Aujourd'hui, devinez quoi ? Mission accomplie ! 🎉 Non seulement ma copine l'utilise sans problème, mais même ma mère (qui vit à 5000 km de chez moi !) l'utilise pour regarder ses séries préférées sans aucun problème.

Quand mes amis ont vu à quel point ça fonctionnait bien, ils ont tous voulu en avoir un également. Mais leur expliquer comment tout configurer, c'était comme essayer d'apprendre à un chat à nager. C'est techniquement possible, mais bien plus compliqué que nécessaire.

C'est là que j'ai eu une idée : Pourquoi ne pas créer un script qui ferait tout le travail ? Et c'est comme ça que YAMS est né ! Désormais, tout le monde peut créer son propre serveur multimédia sans avoir besoin d'un doctorat en informatique. 😎

## Qu'est-ce qui rend YAMS si spécial ? ✨

YAMS n'est pas un simple serveur multimédia, c'est votre propre "Netflix Killer" doté de super pouvoirs ! Voici ce qui est possible, dès l'installation :

### 🤖 Entièrement automatisé

-   **Des téléchargement intelligents :** Il suffit de dire les films et séries que vous voulez, YAMS gère la suite
-   **Une organisation parfaite :** Tout est trié et rangé au bon endroit automatiquement
-   **La magie des sous-titres :** Télécharge automatiquement les sous-titres dans la langue que vous voulez (s'ils sont disponibles)

### 📱 Regardez depuis n'importe où

-   Fonctionne sur tous les appareils pouvant lancer Emby/Jellyfin/Plex :
    -   🖥️ Navigateurs internet
    -   📱 Téléphones et tablettes iOS & Android
    -   📺 Smart TVs
    -   🎮 Consoles de jeux
    -   Et plein d'autres !

## Qu'est-ce qu'il y a sous le capot ? 🛠️

YAMS combine certains des meilleurs logiciels open-source de gestion multimédia :

### Les composants principaux :

-   📥 qBittorrent & SABnzbd : Vos bêtes de course du téléchargement
-   🎬 Radarr : Votre chasseur de films attitré
-   📺 Sonarr : Votre traqueur de séries
-   🔍 Prowlarr : Votre expert de la recherche
-   💬 Bazarr : Votre magicien des sous-titres
-   🎮 Jellyfin/Emby/Plex : Votre chef d’orchestre du streaming

### Les fonctionnalités techniques :

-   🚄 **Redirection de port** : Configuration automatique de la redirection de port pour des téléchargements plus rapides
-   🔗 **Hardlinking** : Économise une quantité massive d'espace disque en créant de multiples références sur un même fichier afin d'éviter les duplications
-   ⚡ **Déplacements instantanés** : Assure des transferts de fichiers propres et instantanés sans fichiers incomplets ou corrompus

Vous souhaitez vous plonger dans les meilleures pratiques en matière de gestion de fichiers ? Consultez le guide [TRaSH Guides File and Folder Structure](https://trash-guides.info/File-and-Folder-Structure/) pour en savoir plus !

### Bonus supplémentaires :

-   🔒 gluetun : Garde vos téléchargement privés et sécurisés
-   🎛️ Portainer : Permet de gérer tous vos services en un clin d'œil
-   🎵 Lidarr : Gère votre bibliothèque musicale

Toutes ces pièces s'emboîtent parfaitement pour créer un serveur multimédia à la fois puissant ET simple à utiliser. C'est comme avoir votre propre service de streaming en mieux, parce que VOUS êtes aux manettes !

Prêt à vous lancer ? Commencez avec l'[installation](/install/steps) !
