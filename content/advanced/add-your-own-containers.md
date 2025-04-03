---
title: "Ajouter vos propres conteneurs à YAMS"
date: 2025-01-15T11:50:16+02:00
draft: false
weight: 20
summary: Un guide complet pour enrichir YAMS avec vos propres conteneurs Docker
---

# Appropriez-vous YAMS 🚀

Vous souhaitez ajouter d'autres services à votre installation YAMS ? Peut-être une nouvelle application sympa que vous avez trouvée, ou quelque chose de spécifique à vos besoins ? Pas de problème ! YAMS permet d'étendre facilement votre serveur multimédia avec des conteneurs personnalisés.

## Les bases 📚

Lors de son installation, YAMS créé deux fichiers importants :

-   `docker-compose.yaml`: C'est le cœur de YAMS ! Il ne faut pas modifier directement ce fichier.
-   `docker-compose.custom.yaml`: C'est votre terrain de jeu ! Vous pouvez ajoutez vos conteneurs ici.

## Démarrage 🎯

Tout d'abord, trouvons votre installation YAMS. Je vais utiliser `/opt/yams` dans ces exemples, mais remplacez-le par l'emplacement d'installation que vous avez choisi :

```bash
cd /opt/yams
```

## Les variables magiques ✨

YAMS fournit quelques variables d'environnement pratiques que vous pouvez utiliser dans vos conteneurs personnalisés :

```yaml
PUID: Votre ID d'utilisateur
PGID: Votre ID de groupe
MEDIA_DIRECTORY: Emplacement du répertoire multimédia
INSTALL_DIRECTORY: Emplacement d'installation de YAMS
```

Ces varaiables permettent à vos conteneurs personnalisés de fonctionner facilement avec YAMS !

## Ajout d'un conteneur ! 🎮

Prenons comme exemple [Overseerr](https://overseerr.dev/), une fantastique application de gestion de requêtes pour votre serveur multimédia.

1. Ouvrez d'abord `docker-compose.custom.yaml`:

```bash
nano docker-compose.custom.yaml
```

2. S'il s'agit de votre premier conteneur personnalisé, vous devrez d'abord décommenter la ligne `services:`. Pour décommenter, vous devez supprimer le symbole `#` et l'espace qui suit. Votre fichier devrait commencer comme suit :

```yaml
services: # Assurez-vous que la ligne est bien décommentée et qu'il n'y a pas d'espaces avant !
```

3. Ajoutons maintenant Overseerr en utilisant toutes les fonctionnalités de YAMS :

```yaml
overseerr:
    image: lscr.io/linuxserver/overseerr:latest
    container_name: overseerr
    environment:
        - PUID=${PUID} # Variable ID utilisateur de YAMS
        - PGID=${PGID} # Variable ID de groupe de YAMS
    volumes:
        - ${INSTALL_DIRECTORY}/config/overseer:/config # On utilise le dossier de configuration fourni par Yams
    ports:
        - 5055:5055
    restart: unless-stopped
```

4. Il est temps de démarrer votre nouveau conteneur :

```bash
yams restart
```

Vous devriez voir quelque chose similaire à ça :

```bash
 ⠙ overseerr Pulling                                                                     5.2s
[...]
```

C'est tout bon ! Votre nouveau service est installé et lancé ! 🎉

## Astuces 🎓

### 1. Découvrir de nouveaux services

Vous cherchez des services cools à ajouter à YAMS ? Jetez un coup d'œil à ceux-ci :

-   [linuxserver.io fleet](https://fleet.linuxserver.io/) (fortement recommandé)
-   [Docker Hub](https://hub.docker.com/)

### 2. Réseau magique 🌐

Tous les conteneurs dans votre `docker-compose.custom.yaml` rejoignent automatiquement le réseau de YAMS ! Ça permet à l'ensemble des services de communiquer entre eux en utilisant le noms de leurs conteneurs en tant que noms d'hôtes.

Par exemple, si vous avez besoin de connecter Radarr à un conteneur personnalisé, vous pouvez utiliser `http://radarr:7878` en tant qu'URL.

### 3. Accès VPN 🔒

Vous souhaitez que votre conteneur personnalisé utilise le VPN de YAMS ? Il suffit d'ajouter ceci à la configuration de ce dernier :

```yaml
network_mode: "service:gluetun"
```

Consultez le guide [Lancer Prowlarr derrière le VPN](/advanced/prowlarr-behind-vpn) pour voir un exemple détaillé !

### 4. La force des variables 💪

Vous pouvez accéder à n'importe quelle variable depuis le fichier `.env` de YAMS pour les utiliser dans vos conteneurs personnalisés. Il suffit d'utiliser la syntaxe `${NOM_DE_LA_VARIABLE}` !

## Problèmes courants 🚨

1. **Erreurs de formatage YAML** : YAML est très sensible à l'espacement et à l'indentation. Même un simple espace mal placé peut casser votre configuration ! Nous recommandons fortement l'utilisation d'un validateur YAML comme [yamllint.com](https://www.yamllint.com/) pour vérifier votre syntaxe avant d'appliquer les changements.
2. **Nom des conteneurs** : Assurez-vous que le nom de vos conteneurs n'entre pas en conflit avec ceux de YAMS.
3. **Conflit de ports** : Vérifiez bien que vos nouveaux conteneurs n'essayent pas d'accéder à des ports déjà utilisés.
4. **Permissions** : Si votre conteneur à besoin d'accéder aux fichiers multimédias, pensez à utiliser `PUID` et `PGID`!

## Besoin d'idées ? 💡

Voici quelques services populaires qui fonctionnent bien avec YAMS :

1. **[Overseerr](https://overseerr.dev/)** ou **[Petio](https://petio.tv/)** : Permet aux utilisateurs de demander des films et séries
2. **[Tautulli](https://tautulli.com/)** : Gestion et statistiques avancées pour Plex
3. **[Organizr](https://organizr.app/)** : Créé une interface élégante pour tous vos services

## Besoin d'aide ? 🆘

Si vous avez rencontré un problème :

1. Visitez notre page [Problèmes courants](/faqs/common-errors/)
2. Visitez le [Forum YAMS](https://forum.yams.media)
3. Rejoignez notre serveur [Discord](https://discord.gg/Gwae3tNMST) ou [Matrix](https://matrix.to/#/#yams-space:rogs.me)

N'oubliez pas : L'objectif de YAMS est de créer VOTRE serveur multimédia personnalisé. N'hésitez pas à expérimenter et à le personnaliser à votre guise ! 😎
