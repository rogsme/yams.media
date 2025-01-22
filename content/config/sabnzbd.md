---
title: "SABnzbd"
date: 2025-01-22T14:03:31+02:00
weight: 2
draft: false
summary: SABnzbd est un programme qui permet de télécharger des fichiers à partir de serveurs Usenet. De nombreuses personnes publient toutes sortes de contenus intéressants sur Usenet et vous avez besoin d'un programme spécial pour obtenir ces contenus avec un minimum d'effort.
---

## Qu'est-ce que SABnzbd ?

Depuis leur [site web](https://sabnzbd.org/) :

> SABnzbd est un programme qui permet de télécharger des fichiers à partir de serveurs Usenet. De nombreuses personnes publient toutes sortes de contenus intéressants sur Usenet et vous avez besoin d'un programme spécial pour obtenir ces contenus avec un minimum d'effort.

En gros, SABnzbd va nous aider à télécharger des trucs sur les serveurs Usenet. Plutôt sympa ! 😎

## Configuration initiale

Depuis votre navigateur, allez à l'adresse [http://{votre-adresse-ip}:8080/](). Vous arriverez sur la page d'installation de SABnzbd.

Avant de choisir votre langue, veuillez noter que ce guide est rédigé en français, mais que les étapes et illustrations suivantes sont basées sur le choix de langue anglais.

Une fois votre choix effectué, cliquez sur "Start Wizard" :

[![sabnzbd-1](/pics/sabnzbd-1.png)](/pics/sabnzbd-1.png)

Ensuite, vous allez devoir choisir un serveur Usenet. [Newshosting](https://www.newshosting.com/) propose généralement des bons plans, mais vous pouvez utiliser le serveur que vous préférez !

Une fois que vous avez obtenu les détails de votre serveur, saisissez-les dans les champs correspondants et cliquez sur "Next".

[![sabnzbd-2](/pics/sabnzbd-2.png)](/pics/sabnzbd-2.png)

Vous devriez maintenant voir la page finale de l'assistant d'installation. Félicitations ! 🎉

Vous remarquerez que les dossiers de téléchargement "Completed" et "Uncompleted" ne sont pas tout à fait à leur place. Ne vous inquiétez pas, nous allons y remédier dans une minute !

Pour l'instant, cliquez sur "Go to SABnzbd".

[![sabnzbd-3](/pics/sabnzbd-3.png)](/pics/sabnzbd-3.png)

Rendez-vous sur la page des paramètres en cliquant sur l'icône d'engrenage en haut à droite.

[![sabnzbd-4](/pics/sabnzbd-4.png)](/pics/sabnzbd-4.png)

Sur la page des paramètres, cliquez sur "Folders" et indiquez les bons dossiers :

-   Entrez `/data/downloads/usenet/incomplete` dans "Temporary Download Folder"
-   Entrez `/data/downloads/usenet/complete` dans "Completed Download Folder"
-   Cliquez sur "Save Changes"

[![sabnzbd-5](/pics/sabnzbd-5.png)](/pics/sabnzbd-5.png)

## Obtenir votre clé API pour Sonarr et Radarr

Vous aurez besoin de cette clé API plus tard lorsque nous configurerons Radarr et Sonarr. N'hésitez pas à sauter cette section pour l'instant, vous pourrez toujours y revenir !

Pour obtenir votre clé API :

Retournez d'abord dans les paramètres.

[![sabnzbd-4](/pics/sabnzbd-4.png)](/pics/sabnzbd-4.png)

Puis allez dans "General" et descendez jusqu'à la section "Security". Vous y trouverez votre clé API !

[![sabnzbd-6](/pics/sabnzbd-6.png)](/pics/sabnzbd-6.png)

## Et voilà ! 🎉

Excellent ! Nous pouvons maintenant continuer avec [Radarr](/config/radarr). Préparez-vous, c'est là que les choses deviennent vraiment amusantes ! 😄
