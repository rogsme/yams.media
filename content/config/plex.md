---
title: "Plex"
date: 2025-01-29T13:25:21+02:00
draft: false
weight: 9
summary: Plex est une plateforme de streaming multimédia qui organise votre bibliothèque multimédia personnelle et vous permet de la diffuser n'importe où, ainsi que d'accéder à la télévision en direct, à des films et à des émissions.
---

# Qu'est-ce que Plex ?

Selon leur [site web](https://www.plex.tv/) :

> Avec notre application gratuite, vous pouvez ajouter, accéder et partager tous les divertissements qui comptent pour vous, sur presque tous les appareils, y compris votre propre collection de médias. Cela fait probablement de nous l'application qui travaille le plus dur dans le monde du divertissement.

Dans les YAMS, Plex sera votre service de diffusion en continu hors pair ! 🌟 C'est comme avoir son propre Netflix, mais avec beaucoup plus de contrôle. De plus, le partage avec les amis et la famille est très facile !

## Premières étapes

Avant d'attaquer, nous devons procéder à quelques réglages pour permettre à Plex d'exercer sa magie. Tout d'abord, arrêtez YAMS :

```bash
$ yams stop
```

Maintenant, autorisons votre plage d'IP à accéder à Plex. Allez dans votre dossier de configuration Plex (je considère que votre emplacement d'installation est `/opt/yams`. Ajustez si vous avez utilisé un chemin différent) :

```bash
$ cd /opt/yams/config/plex/Library/Application\ Support/Plex\ Media\ Server/
```

Dans ce dossier, nous devons éditer `Preferences.xml` :

```bash
$ vim Preferences.xml
```

(Ne vous inquiétez pas si vous n'êtes pas un fan de vim, `nano` fonctionne très bien aussi ! 😉)

Ajoutez cette ligne juste après la partie `<Preferences` :

```xml
<Preferences allowedNetworks="<votre_sous_réseau_IP>/255.255.255.0" ...
```

Le `...` signifie qu'on ne change pas la suite du fichier. Nous ajoutons juste le champ `allowedNetworks`.

### Comment trouver l'IP de votre sous-réseau ? 🤔

Elle suit généralement les schémas suivants :

-   Si l'IP de votre serveur est `192.168.0.100`, votre sous-réseau est `192.168.0.0`
-   Si l'IP de votre serveur est `10.0.0.25`, votre sous-réseau est `10.0.0.0`

Il est temps de redémarrer YAMS :

```bash
$ yams restart
```

Vérifions que tout fonctionne :

```bash
$ docker logs plex
```

Si vous voyez quelque chose comme :

```bash
Failed to load preferences at /config/Library/Application Support/Plex Media Server/Preferences.xml
Failed to load preferences at /config/Library/Application Support/Plex Media Server/Preferences.xml
```

Cela signifie que votre fichier `Preferences.xml` a besoin d'être corrigé : vérifiez à nouveau le format et réessayez !

**Note :** Vous voulez en savoir plus sur cette configuration ? Consultez ce [fil de discussion de la communauté TrueNAS](https://www.truenas.com/community/threads/plex-not-authorized-you-do-not-have-access-to-this-server.96858/).

## Configuration initiale

Dans votre navigateur, allez à [http://{votre-adresse-ip}:32400/web]() et vous verrez la page d'installation de Plex. Cliquez sur "Got it!" pour commencer.

[![plex-1](/pics/plex-1.png)](/pics/plex-1.png)

Après vous être connecté, vous verrez une fenêtre de dialogue "Plex Pass". Vous pouvez la fermer pour l'instant, nous allons passer aux choses sérieuses !

[![plex-2](/pics/plex-2.png)](/pics/plex-2.png)

Donnez un nom à votre serveur et cliquez sur "Next".

[![plex-3](/pics/plex-3.png)](/pics/plex-3.png)

Pour "Sync Your Watch State and Ratings", gardons les choses simples et cliquez juste sur "No"

[![plex-4](/pics/plex-4.png)](/pics/plex-4.png)

Il est temps d'ajouter nos médias ! Cliquez sur "Add Library" depuis la page "Media Library".

[![plex-5](/pics/plex-5.png)](/pics/plex-5.png)

### Ajouter des films

Choisissez "Movies" en tant que type de bibliothèque et cliquez sur "Next".

[![plex-6](/pics/plex-6.png)](/pics/plex-6.png)

Cliquez sur "Browse For Media Folder".

[![plex-7](/pics/plex-7.png)](/pics/plex-7.png)

Choisissez le dossier (`/data/movies`) et cliquez sur "Add".

[![plex-8](/pics/plex-8.png)](/pics/plex-8.png)

Votre page devrait ressembler à cela. Cliquez sur "Add Library" pour finir !

[![plex-9](/pics/plex-9.png)](/pics/plex-9.png)

### Ajouter des séries TV

De retour dans "Media Library", cliquez à nouveau sur "Add Library".

[![plex-10](/pics/plex-10.png)](/pics/plex-10.png)

Cette fois, sélectionnez "TV Shows" et cliquez sur "Next".

[![plex-11](/pics/plex-11.png)](/pics/plex-11.png)

Cliquez sur "Browse For Media Folder" à nouveau.

[![plex-7](/pics/plex-7.png)](/pics/plex-7.png)

Choisissez le chemin vers le dossier de vos séries TV (`/data/tvshows`) et cliquez sur "Add".

[![plex-12](/pics/plex-12.png)](/pics/plex-12.png)

Si ça vous semble bon, cliquez sur "Add Library" !

[![plex-13](/pics/plex-13.png)](/pics/plex-13.png)

Votre page "Media Library" devrait maintenant afficher vos deux bibliothèques. Cliquez sur "Next" pour continuer.

[![plex-14](/pics/plex-14.png)](/pics/plex-14.png)

## Finalisation

On y est presque ! Cliquez sur "Done" sur la page de fin.

[![plex-15](/pics/plex-15.png)](/pics/plex-15.png)

Bienvenue sur le tableau de bord de Plex ! 🎉 Cliquez sur "More" dans le panneau latéral gauche.

[![plex-16](/pics/plex-16.png)](/pics/plex-16.png)

Et voilà : vos bibliothèques locales "Movies" & "TV Shows"
There they are - your local "Movies" and "TV Shows" libraries!

[![plex-17](/pics/plex-17.png)](/pics/plex-17.png)

## C'est tout ! 🎬

YAMS est maintenant entièrement opérationnel ! Prêt à ajouter du contenu ? [Passez à l'action](/config/running-everything-together) pour voir comment tous ces services fonctionnent ensemble !

## Vous voulez devenir un super utilisateur de Plex ? 💪

Si vous souhaitez explorer plus en détail les fonctionnalitésde Plex, consultez le [Guide TRaSH pour Plex](https://trash-guides.info/Plex/). Ils y présentent des configurations avancées impressionantes !
