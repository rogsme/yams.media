---
title: "Emby"
date: 2025-01-29T13:25:21+02:00
draft: false
weight: 8
summary: Emby rassemble vos vidéos personnelles, votre musique, vos photos et la télévision en direct. Emby Server convertit et diffuse automatiquement vos médias personnels à la volée pour les lire sur n'importe quel appareil.
---

# Qu'est-ce que Emby ?

Selon leur [site web](https://emby.media/about.html) :

> Emby rassemble vos vidéos personnelles, votre musique, vos photos et la télévision en direct. Emby Server convertit et diffuse automatiquement vos médias personnels à la volée pour les lire sur n'importe quel appareil.

Dans YAMS, Emby est la superstar des services de streaming ! 🌟 Tout comme Netflix ou Amazon Prime, Emby vous permet de diffuser tous vos médias sur n'importe quel appareil. Le plus beau ? Vous avez le contrôle total !

## Configuration initiale

Dans votre navigateur, allez sur [http://{votre-adresse-ip}:8096/]() et vous verrez la page d'installation d'Emby.

Tout d'abord, choisissez votre langue d'affichage et cliquez sur "Next".

[![emby-1](/pics/emby-1.png)](/pics/emby-1.png)

Il est temps de créer votre premier utilisateur ! Il s'agira de votre compte d'administrateur, alors assurez-vous qu'il soit sécurisé. Lorsque vous avez terminé, cliquez sur "Next".

[![emby-2](/pics/emby-2.png)](/pics/emby-2.png)

Nous sommes maintenant à la page "Setup Media Libraries". Cliquez sur "New Library". Indiquons à Emby où trouver tous nos médias ! 🎬

[![emby-3](/pics/emby-3.png)](/pics/emby-3.png)

### Configuration de votre bibliothèque de séries TV

Sur la fenêtre de dialogue "New Library", choisissez "Shows" comme type de contenu et cliquez sur le gros bouton ➕ à côté de "Folders".

[![emby-4](/pics/emby-4.png)](/pics/emby-4.png)

Dans "Select Path", choisissez le dossier `/data/tvshows` et cliquez sur "Ok"

[![emby-5](/pics/emby-5.png)](/pics/emby-5.png)

**Note sur la magie des conteneurs :** 🎩 Le chemin `/data/tvshows/` n'est pas réellement l'emplacement sur votre système ! C'est un chemin spécial au sein de votre environnement Docker qui pointe vers le dossier `/mediafolder/media/tvshows/` de votre serveur !

Vous devriez voir votre nouveau dossier dans la fenêtre de dialogue :

[![emby-6](/pics/emby-6.png)](/pics/emby-6.png)

Définissez maintenant votre langue de métadonnées préférée. Les autres paramètres par défaut sont déjà bons, mais n'hésitez pas à les modifier si vous souhaitez faire personnaliser un peu plus votre service !

Votre configuration devrait ressembler à ceci :

[![emby-7](/pics/emby-7.png)](/pics/emby-7.png)

Satisfait de la configuration ? Cliquez sur "Ok". Votre bibliothèque de séries TV est maintenant ajoutée ! 📺

[![emby-8](/pics/emby-8.png)](/pics/emby-8.png)

### Configuration de votre bibliothèque de films

C'est parti pour le deuxième round ! Cliquez à nouveau sur le bouton "New Library".

Cette fois, nous allons choisir "Movies" en tant que type de contenu puis cliquer sur le bouton ➕.

[![emby-9](/pics/emby-9.png)](/pics/emby-9.png)

Choisissez le dossier `/data/movies` et cliquez sur "Ok"

[![emby-10](/pics/emby-10.png)](/pics/emby-10.png)

**Encore plus de magie :** 🎩✨ Comme vu précédemment, `/data/movies/` est un chemin spécial qui pointe vers le dossier `/mediafolder/media/movies/` de votre serveur !

Vous devriez voir votre dossier films dans la fenêtre de dialogue :

[![emby-11](/pics/emby-11.png)](/pics/emby-11.png)

Définissez à nouveau votre langue de métadonnées préférée. Les paramètres par défaut sont toujours bons !

Votre configuration devrait ressembler à ceci :

[![emby-12](/pics/emby-12.png)](/pics/emby-12.png)

Ça vous semble bon ? Cliquez sur "Ok". Votre bibliothèque de films est maintenant ajoutée ! 🎬

[![emby-13](/pics/emby-13.png)](/pics/emby-13.png)

Il est temps d'avancer, cliquez sur le bouton "Next" !

[![emby-14](/pics/emby-14.png)](/pics/emby-14.png)

### Étapes finales de la configuration

Sur la page "Preferred Metadata Language", choisissez votre langue et votre pays préférés. Cliquez ensuite sur "Next".

[![emby-15](/pics/emby-15.png)](/pics/emby-15.png)

Pour la page "Configure Remote Access", restons simples et sécurisés :

-   Désactivez "Enable automatic port mapping"
-   Cliquez sur "Next"

[![emby-16](/pics/emby-16.png)](/pics/emby-16.png)

Il est temps d'accepter les conditions d'utilisation (vous les avez lues, n'est-ce pas ? 😉). Cliquez sur "Next".

[![emby-17](/pics/emby-17.png)](/pics/emby-17.png)

Vous avez terminé ! Cliquez sur "Finish" pour accéder à votre nouveau tableau de bord Emby. 🎉
[![emby-18](/pics/emby-18.png)](/pics/emby-18.png)

### Se connecter à Emby

Il est temps de tester votre nouvelle installation ! Sur l'écran de connexion, utilisez le nom d'utilisateur et le mot de passe que vous avez créés précédemment.

[![emby-19](/pics/emby-19.png)](/pics/emby-19.png)

[![emby-20](/pics/emby-20.png)](/pics/emby-20.png)

Et la voilà ! Votre propre site de streaming ! 🌟

[![emby-21](/pics/emby-21.png)](/pics/emby-21.png)

## C'est tout ! 🎬

YAMS est maintenant entièrement opérationnel ! Prêt à ajouter du contenu ? [Passez à l'action](/config/running-everything-together) pour voir comment tous ces services fonctionnent ensemble !

## Astuce ! 💡

Si vous aimez Emby, je vous recommande vivement d'essayer [Emby Premiere](https://emby.media/premiere.html) ! C'est totalement optionnel, mais cela vous donne des fonctionnalités vraiment cool comme :

-   Médias hors ligne pour vos appareils
-   Transcodage matériel (lecture plus fluide !)
-   Conversion automatique de votre contenu
-   Et bien plus encore !

Personnellement, j'ai annulé tous mes services de streaming, j'ai acheté une licence Emby Premiere d'un an et je n'ai jamais regretté mon choix. Je dis ça comme ça ! 😉
