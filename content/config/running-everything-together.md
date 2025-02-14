---
title: "Passer à l'action"
date: 2025-01-30T11:35:44+02:00
draft: false
weight: 10
summary: Vous avez enfin réussi à faire fonctionner YAMS ? Ajoutons quelques films et voyons comment tout fonctionne ensemble !
---

## Tout d'abord, je tiens à vous féliciter 🎉

Vous avez réussi ! Vous avez installé et configuré YAMS ! Félicitez-vous, vous l'avez bien mérité ! 🙇‍♂️

[![party](/pics/party.gif)](/pics/party.gif)

Maintenant vient la partie la plus amusante : Ajouter vos séries/films et voir le tout fonctionner tel une machine bien huilée ! 😎

## Radarr & Sonarr

Ces instructions sont applicables aussi bien à Radarr qu'à Sonarr. Pour simplifier les choses, je vous montrerai Radarr, mais le processus est très similaire pour les séries TV !

Ouvrez Radarr à l'adresse [http://{votre-adresse-ip}:7878/]() et cliquez sur "Add New" dans le menu de gauche. Pour cette démo, j'utiliserai "Le Parrain" (parce que c'est un classique !), mais vous pouvez rechercher n'importe quel film.

Astuce : Pour votre premier test, choisissez quelque chose de populaire, ce sera plus facile à trouver !

[![running-everything-together-1](/pics/running-everything-together-1.png)](/pics/running-everything-together-1.png)

Cliquez sur le film que vous souhaitez télécharger :

[![running-everything-together-2](/pics/running-everything-together-2.png)](/pics/running-everything-together-2.png)

Vous pouvez maintenant choisir vos préférences en matière de qualité. Si votre film fait partie d'une collection (comme Le Parrain), vous pouvez choisir de télécharger toute la série dans la case "Monitor". J'opte pour la trilogie complète parce que, eh bien, pourquoi pas ?

Enfin, cliquez sur "Add Movie" !

[![running-everything-together-3](/pics/running-everything-together-3.png)](/pics/running-everything-together-3.png)

Retournez à "Movies" et vous verrez vos sélections :

[![running-everything-together-4](/pics/running-everything-together-4.png)](/pics/running-everything-together-4.png)

Cliquez sur "Activity" pour voir la magie opérer : vous pouvez voir que tout est téléchargé en temps réel ! 🪄

[![running-everything-together-5](/pics/running-everything-together-5.png)](/pics/running-everything-together-5.png)

## qBittorrent

Vous voulez voir ce qui se passe sous le capot ? Ouvrez qBittorrent à l'adresse [http://{votre-adresse-ip}:8081/]() et vous verrez vos films se télécharger !

Cela confirme que tout fonctionne parfaitement ! Lorsque les téléchargements sont terminés, Radarr les range automatiquement dans les bons dossiers.

[![running-everything-together-6](/pics/running-everything-together-6.png)](/pics/running-everything-together-6.png)

## Service multimédia

Une fois les téléchargements terminés, rendez-vous sur votre service multimédia et... ta-da ! 🎉 Vos films sont là et vous attendent !

Jellyfin:
[![running-everything-together-12](/pics/running-everything-together-12.png)](/pics/running-everything-together-12.png)

Emby:
[![running-everything-together-7](/pics/running-everything-together-7.png)](/pics/running-everything-together-7.png)

Plex:
[![running-everything-together-11](/pics/running-everything-together-11.png)](/pics/running-everything-together-11.png)

Ouvrez un film et regardez, les sous-titres sont déjà là ! C'est [Bazarr](/config/bazarr) qui fait son travail ! 🎯

[![running-everything-together-8](/pics/running-everything-together-8.png)](/pics/running-everything-together-8.png)

[![running-everything-together-9](/pics/running-everything-together-9.png)](/pics/running-everything-together-9.png)

Vous pouvez même commencer à regarder directement le film depuis votre navigateur, avec les sous-titres et tout le reste :
[![running-everything-together-10](/pics/running-everything-together-10.png)](/pics/running-everything-together-10.png)

## Votre système de fichiers

Curieux de savoir comment tout est organisé ? Jetez un coup d'œil à votre dossier `/mediafolder/media/movies` :

```sh
roger@debian:/srv/media/movies$ tree .
.
├── The Godfather (1972)
│   ├── The Godfather (1972).en.srt
│   ├── The Godfather (1972).es.srt
│   └── The Godfather (1972).mp4
├── The Godfather Part II (1974)
│   ├── The Godfather Part II (1974).en.srt
│   ├── The Godfather Part II (1974).es.srt
│   └── The Godfather Part II (1974).mp4
└── The Godfather Part III (1990)
    ├── The Godfather Part III (1990).en.srt
    ├── The Godfather Part III (1990).es.srt
    └── The Godfather Part III (1990).mp4

3 directories, 9 files
```

Pas fan de la façon dont les choses sont nommées ? Pas de problème ! Vous pouvez toujours changer le format de nommage dans la page de [Gestion des médias](/config/radarr/#gestion-des-médias) de Radarr ou [les paramètres de Sonarr](/config/sonarr/#gestion-des-médias).

# Dernière étape et conclusions

Vous l'avez fait ! 🎉 Vous avez mis en place votre propre serveur multimédia et vous le faites fonctionner ! C'est un grand pas en avant pour vous affranchir des services à abonnements comme Netflix ou Amazon Prime.

Et devinez quoi ? Il y a encore beaucoup de choses que vous pouvez faire pour améliorer votre installation ! Rendez-vous sur la page [Recommandations](/config/recommendations) pour trouver des idées intéressantes.

🙌 Merci d'avoir suivi ce tutoriel ! J'espère que vous apprécierez votre nouveau serveur multimédia : vous l'avez bien mérité ! 😎
