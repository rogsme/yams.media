---
title: "Jellyfin"
date: 2025-01-29T13:25:21+02:00
draft: false
weight: 7
summary: Jellyfin est la solution multimédia construite par des bénévoles qui vous met aux commandes de vos médias. Diffusez sur n'importe quel appareil à partir de votre propre serveur, sans aucune contrainte. Vos médias, votre serveur, votre façon de faire.
---

# Qu'est-ce que Jellyfin ?

Selon leur [site web](https://jellyfin.org/) :

> Jellyfin est la solution multimédia construite par des bénévoles qui vous met aux commandes de vos médias. Diffusez sur n'importe quel appareil à partir de votre propre serveur, sans aucune contrainte. Vos médias, votre serveur, votre façon de faire.

Dans YAMS, Jellyfin sera votre Netflix personnel ! 🍿 Il est 100% open source et vous permet de diffuser vos séries TV et vos films sur n'importe quel appareil. Le meilleur ? Pas de frais mensuels !

## Configuration initiale

Dans votre navigateur, allez sur [http://{votre-adresse-ip}:8096/]() et vous verrez la page d'installation de Jellyfin.

Avant de choisir votre langue, veuillez noter que ce guide est rédigé en français, mais que les étapes et illustrations suivantes sont basées sur le choix de langue anglais.

Tout d'abord, choisissez votre langue d'affichage et cliquez sur "Next".

[![jellyfin-1](/pics/jellyfin-1.png)](/pics/jellyfin-1.png)

Il est temps de créer votre premier utilisateur ! Il s'agira de votre compte d'administrateur, alors assurez-vous qu'il soit sécurisé. Lorsque vous avez terminé, cliquez sur "Next".

[![jellyfin-2](/pics/jellyfin-2.png)](/pics/jellyfin-2.png)

Nous sommes maintenant à la page "Setup Media Libraries". Cliquez sur "New Library". Indiquons à Jellyfin où trouver tous nos médias ! 📚

[![jellyfin-3](/pics/jellyfin-3.png)](/pics/jellyfin-3.png)

### Configuration de votre bibliothèque de séries TV

Sur la fenêtre de dialogue "New Library", choisissez "Shows" comme type de contenu et cliquez sur le gros bouton ➕ à côté de "Folders".

[![jellyfin-4](/pics/jellyfin-4.png)](/pics/jellyfin-4.png)

Dans "Select Path", choisissez le dossier `/data/tvshows` et cliquez sur "Ok"

[![jellyfin-5](/pics/jellyfin-5.png)](/pics/jellyfin-5.png)

**Note sur la magie des conteneurs :** 🎩 Le chemin `/data/tvshows/` n'est pas réellement l'emplacement sur votre système ! C'est un chemin spécial au sein de votre environnement Docker qui pointe vers le dossier `/mediafolder/media/tvshows/` de votre serveur !

Vous devriez voir votre nouveau dossier dans la fenêtre de dialogue :

[![jellyfin-6](/pics/jellyfin-6.png)](/pics/jellyfin-6.png)

Définissez maintenant votre langue de métadonnées préférée. Les autres paramètres par défaut sont déjà bons, mais n'hésitez pas à les modifier si vous souhaitez faire personnaliser un peu plus votre service !

Votre configuration devrait ressembler à ceci :

[![jellyfin-7](/pics/jellyfin-7.png)](/pics/jellyfin-7.png)

Satisfait de la configuration ? Cliquez sur "Ok". Votre bibliothèque de séries TV est maintenant ajoutée ! 📺

[![jellyfin-8](/pics/jellyfin-8.png)](/pics/jellyfin-8.png)

### Configuration de votre bibliothèque de films

C'est parti pour le deuxième round ! Cliquez à nouveau sur le bouton "New Library".

Cette fois, nous allons choisir "Movies" en tant que type de contenu puis cliquer sur le bouton ➕.

[![jellyfin-9](/pics/jellyfin-9.png)](/pics/jellyfin-9.png)

Choisissez le dossier `/data/movies` et cliquez sur "Ok"

[![jellyfin-10](/pics/jellyfin-10.png)](/pics/jellyfin-10.png)

**Encore plus de magie :** 🎩✨ Comme vu précédemment, `/data/movies/` est un chemin spécial qui pointe vers le dossier `/mediafolder/media/movies/` de votre serveur !

Vous devriez voir votre dossier films dans la fenêtre de dialogue :

[![jellyfin-11](/pics/jellyfin-11.png)](/pics/jellyfin-11.png)

Définissez à nouveau votre langue de métadonnées préférée. Les paramètres par défaut sont toujours bons !

Votre configuration devrait ressembler à ceci :

[![jellyfin-12](/pics/jellyfin-12.png)](/pics/jellyfin-12.png)

Ça vous semble bon ? Cliquez sur "Ok". Votre bibliothèque de films est maintenant ajoutée ! 🎬

[![jellyfin-13](/pics/jellyfin-13.png)](/pics/jellyfin-13.png)

Il est temps d'avancer, cliquez sur le bouton "Next" !

[![jellyfin-14](/pics/jellyfin-14.png)](/pics/jellyfin-14.png)

### Étapes finales de la configuration

Sur la page "Preferred Metadata Language", choisissez votre langue et votre pays préférés. Cliquez ensuite sur "Next".

[![jellyfin-15](/pics/jellyfin-15.png)](/pics/jellyfin-15.png)

Pour la page "Set up Remote Access" ("Configurer l'accès à distance"), restons simples : désactivez "Allow remote connections to this server" et cliquez sur "Next".

[![jellyfin-16](/pics/jellyfin-16.png)](/pics/jellyfin-16.png)

Vous avez terminé ! Cliquez sur "Finish" pour accéder à votre nouveau tableau de bord Jellyfin. 🎉
[![jellyfin-17](/pics/jellyfin-17.png)](/pics/jellyfin-17.png)

### Se connecter à Jellyfin

Il est temps de tester votre nouvelle installation ! Sur l'écran de connexion, utilisez le nom d'utilisateur et le mot de passe que vous avez créés précédemment.

[![jellyfin-18](/pics/jellyfin-18.png)](/pics/jellyfin-18.png)

Et la voilà ! Votre propre site de streaming ! 🌟

[![jellyfin-19](/pics/jellyfin-19.png)](/pics/jellyfin-19.png)

## C'est tout ! 🎬

YAMS est maintenant entièrement opérationnel ! Prêt à ajouter du contenu ? [Passez à l'action](/config/running-everything-together) pour voir comment tous ces services fonctionnent ensemble !
