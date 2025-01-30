---
title: "Bazarr"
date: 2025-01-29T13:25:21+02:00
draft: false
weight: 6
summary: Bazarr est une application compagnon pour Sonarr et Radarr qui gère et télécharge les sous-titres en fonction de vos besoins.
---

# Qu'est-ce que Bazarr ?

Selon leur [site web](https://www.bazarr.media/):

> Bazarr est une application compagnon pour Sonarr et Radarr qui gère et télécharge les sous-titres en fonction de vos besoins.

Dans YAMS, Bazarr est votre superstar des sous-titres ! 🌟 Il va télécharger les sous-titres dans toutes les langues que vous choisissez, les trier et les placer là où Emby/Jellyfin/Plex peut les trouver. Plus besoin de chercher les sous-titres manuellement !

## Configuration initiale

Depuis votre navigateur, allez à l'adresse [http://{votre-adresse-ip}:6767/]() et vous verrez les paramètres de Bazarr.

[![bazarr-1](/pics/bazarr-1.png)](/pics/bazarr-1.png)

Les paramètres par défaut sont bons, pas besoin de les modifier pour l'instant !

### Langues

Dans le menu de gauche, cliquez sur "Langues". C'est là que le plaisir commence ! 🎬

Dans le champ "Filtre de langues", sélectionnez toutes les langues pour lesquelles vous voulez des sous-titres. Pour ce tutoriel, j'ai choisi :

-   `English` (because why not?)
-   `Spanish` (¿por qué no?)
-   `Latin American Spanish` (saveur différente, même bon goût !)

Après avoir choisi vos langues, cliquez sur "Add New Profile"

[![bazarr-2](/pics/bazarr-2.png)](/pics/bazarr-2.png)

Dans la fenêtre de dialogue "Edit Languages Profile" :

1. Nommez votre profil (ce que vous voulez !)
2. Cliquez sur "Add Language"
3. **Important :** Cliquez sur "Add Language" une fois pour CHAQUE langue que vous avez choisi pécédemment !

Vu que j'ai choisi 3 langues plus tôt, je dois cliquer 3 fois sur "Add Language". Mathématiques !🧮

Lorsque vous avez fini, cliquez sur "Save" en bas de la fenêtre.

[![bazarr-3](/pics/bazarr-3.png)](/pics/bazarr-3.png)

De retour sur la page "Langues", définissez votre nouveau profile par défaut, tant pour les films que séries TV.

[![bazarr-4](/pics/bazarr-4.png)](/pics/bazarr-4.png)

Vous devriez obtenir quelque chose comme ça :

[![bazarr-5](/pics/bazarr-5.png)](/pics/bazarr-5.png)

Satisfait de la configuration ? Cliquez sur "Save" en haut de la page !

[![bazarr-6](/pics/bazarr-6.png)](/pics/bazarr-6.png)

### Fournisseurs

Il est temps d'indiquer à Bazarr où trouver ces sous-titres ! Cliquez sur "Fournisseurs" dans le menu de gauche, puis cliquez sur le grand bouton ➕.

[![bazarr-7](/pics/bazarr-7.png)](/pics/bazarr-7.png)

Vous verrez une ÉNORME liste de fournisseurs et même des descriptions ! Vraiment prévenant ! 📚

[![bazarr-8](/pics/bazarr-8.png)](/pics/bazarr-8.png)

Pour ce tutoriel, nous n'ajouterons que [OpenSubtitles.org](https://www.opensubtitles.org/en/search/subs), mais n'hésitez pas à en ajouter d'autres par la suite ! Plus vous avez de fournisseurs, plus vous avez de chances de trouver des sous-titres parfaits.

Certains fournisseurs (dont OpenSubtitles.org) ont besoin d'un nom d'utilisateur et d'un mot de passe. Si vous n'avez pas encore de compte, allez-y et créez-en un, je vous attends ! ⏳

Vous avez vos informations de connexion ? C'est génial ! Saisissez-les et cliquez sur "Save"

[![bazarr-9](/pics/bazarr-9.png)](/pics/bazarr-9.png)

Vous verrez maintenant OpenSubtitles.org dans votre liste de fournisseurs ! Cliquez sur "Save" en haut de la page si vous êtes satisfait des changements.

[![bazarr-10](/pics/bazarr-10.png)](/pics/bazarr-10.png)

### Sous-titres

Cliquez sur "Subtitles" dans le menu de gauche et descendez jusqu'à "Performance / Optimization".

Première chose à faire : Désactiver l'option "Use Embedded Subtitles". Nous voulons des sous-titres en liberté, pas en cage ! 🐓

Un peu plus bas, vous trouverez la section "Post-Processing". Activez ces options :

-   "Encode Subtitles to UTF8" (permet de garder le tout lisible)
-   "Hearing Impaired" (enlève l'audiodescription [GRINCEMENT DE PORTE])
-   "Remove Tags" (nettoie le formatage)
-   "OCR Fixes" (corrige les anomalies de numérisation courantes)
-   "Common Fixes" (corrige... les erreurs courantes 😅)
-   "Fix Uppercase" (FINI DE CRIER DANS LES SOUS-TIRES)

[![bazarr-11](/pics/bazarr-11.png)](/pics/bazarr-11.png)

Maintenant, descendez touuuuuut en bas et activez la fonctionnalité :

-   "Automatic Subtitles Synchronization"
-   Définissez "Series Score Threshold" et "Movies Score Threshold" à 50

Pourquoi 50 ? J'ai trouvé que c'était un bon équilibre : Bazarr peut encore trouver de bons sous-titres mais n'en utilisera pas de mauvais. N'hésitez pas à ajuster ce chiffre si vous voulez être plus ou moins pointilleux !

[![bazarr-12](/pics/bazarr-12.png)](/pics/bazarr-12.png)

Satisfait de votre configuration ? Cliquez sur "Save" tout en haut de la page !

[![bazarr-13](/pics/bazarr-13.png)](/pics/bazarr-13.png)

### Connexion à Sonarr

Il est temps de connecter Bazarr à [Sonarr](/config/sonarr) ! Nous allons avoir besoin de la clé API de Sonarr.

Allez sur [http://{votre-adresse-ip}:8989/settings/general]() et vous trouverez la clé API dans la section "Security".

[![bazarr-14](/pics/bazarr-14.png)](/pics/bazarr-14.png)

Copiez cette clé API et gardez-là sous la main !

De retour dans Bazarr, cliquez sur "Sonarr" dans le menu latéral gauche.

Par défaut, Sonarr est désactivé. Corrigeons ça ! Activez Sonarr et vous verrez de nombreuses nouvelles options. Pas de panique, il suffit d'en modifier quelques-unes :

-   Dans "Address", mettez `sonarr`
-   Dans "API Key", collez votre clé API Sonarr
-   Cliquez sur "Test"

Si tout fonctionne, vous verrez la version de Sonarr apparaître sur le bouton ! 🎉

[![bazarr-15](/pics/bazarr-15.png)](/pics/bazarr-15.png)

Cliquez sur "Save" tout en haut de la page pour terminer.

[![bazarr-16](/pics/bazarr-16.png)](/pics/bazarr-16.png)

C'est l'heure de la magie ! La section "Series" devrait apparaître dans votre menu latéral gauche ! ✨

[![bazarr-19](/pics/bazarr-19.png)](/pics/bazarr-19.png)

### Connexion à Radarr

Connectons-nous maintenant à[Radarr](/config/radarr) ! Première étape : récupérer la clé API.

Allez sur [http://{votre-adresse-ip}:7878/settings/general]() et vous trouverez la clé API dans la section "Security".

[![bazarr-17](/pics/bazarr-17.png)](/pics/bazarr-17.png)

Copiez cette clé API et gardez-là sous la main !

De retour dans Bazarr, cliquez sur "Radarr" dans le menu latéral gauche.

De la même manière que Sonarr, Radarr est désactivé par défaut. Activez-le et remplissez les champs suivants :

-   Dans "Address", mettez `radarr`
-   Dans "API Key", collez votre clé API Radarr
-   Cliquez sur "Test"

Si tout fonctionne, vous verrez la version de Sonarr apparaître sur le bouton ! 🎯

[![bazarr-18](/pics/bazarr-18.png)](/pics/bazarr-18.png)

Cliquez sur "Save" tout en haut de la page pour terminer.

[![bazarr-20](/pics/bazarr-20.png)](/pics/bazarr-20.png)

Encore plus de magie ! La section "Movies" apparait dans votre menu latéral gauche ! ✨

[![bazarr-21](/pics/bazarr-21.png)](/pics/bazarr-21.png)

### Nous y sommes presques ! 🏃‍♂️

Une dernière étape ! Il est maintenant temps de configurer votre service de streaming. Choisissez votre chemin :

-   [Jellyfin](/config/jellyfin)
-   [Emby](/config/emby)
-   [Plex](/config/plex)

## Vous voulez devenir un maître des sous-titres ? 🎓

Si vous souhaitez explorer plus en détail les fonctionnalités de Bazarr, consultez le [Guide TRaSH pour Bazarr](https://trash-guides.info/Bazarr/). Ils y présentent des configurations avancées impressionantes !
