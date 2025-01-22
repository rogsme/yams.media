---
title: "Utiliser l'interface de ligne de commande"
date: 2025-01-16T14:57:14+02:00
draft: false
weight: 3
summary: Maîtrisez la puissante interface de ligne de commande YAMS, votre couteau suisse pour gérer votre serveur multimédia !
---

# L'interface de ligne de commande YAMS : Le meilleur ami de votre serveur multimédia 🛠️

YAMS propose une interface de ligne de commande (CLI) super pratique qui permet de gérer votre serveur multimédia comme un jeu d'enfant ! C'est une sorte de télécommande pour votre serveur, mais en plus cool. 😎

## Démarrage

Pour voir ce que permet le CLI de YAMS, tapez juste dans votre terminal :

```bash
yams --help
```

Vous obtiendrez une vue d'ensemble des différentes commandes disponibles :

```bash
yams - Yet Another Media Server

Usage: yams [command] [options]

Commands:
--help                     displays this help message
restart                    restarts yams services
stop                      stops all yams services
start                     starts yams services
destroy                   destroy yams services so you can start from scratch
check-vpn                 checks if the VPN is working as expected
backup                    backs up yams to the destination location
```

Décortiquons chaque commande et voyons quelle magie elles peuvent accomplir ! ✨

## L'arsenal de commandes 🚀

### `yams start`

Démarre tous vos services YAMS. C'est comme appuyer sur le bouton "ON" de votre serveur multimédia ! Le CLI vous montrera même une jolie barre de progression et vous préviendra quand tout sera lancé.

### `yams stop`

Éteint en douceur tous les services YAMS. C'est comme si vous accordiez une bonne nuit de sommeil à votre serveur. 😴 Tous les téléchargements seront mis en pause et tous les services seront éteints.

### `yams restart`

Vous avez un problème avec l'un de vos services ? Cette commande permet de rafraîchir rapidement votre serveur multimédia ! Elle :

1. Éteint en douceur tous vos services
2. Les fait redémarrer
3. Montre une barre de progression pendant qu'ils démarrent
4. Confirme que tout est à nouveau fonctionnel

### `yams check-vpn`

La gardienne de votre vie privée ! 🛡️ Cette commande s'assure que votre VPN vous protège bien en :

1. Vérifiant votre adresse IP réelle
2. Vérifiant l'adresse IP de qBittorrent
3. Compare ces dernières en s'assurant qu'elles sont différentes
4. Montre dans quel pays sont situées les deux adresses IP

Si quelque chose ne va pas, vous le saurez tout de suite !

### `yams backup [destination]`

Votre filet de sécurité ! 🎯 Sauvegarde l'ensemble de votre configuration YAMS pour garder votre installation sûre. Dites juste à la commande où faire la sauvegarde :

```bash
yams backup ~/my-backups
```

Elle va :

1. Stopper (temporairement) tous les services
2. Créer un fichier de sauvegarde horodaté
3. Relancer tous les services
4. Vous indiquer où la sauvegarde est stockée.

### `yams destroy`

L'arme atomique ! ☢️ cette commande va complètement supprimer tous les services YAMS pour recommencer de zéro. Mais pas d'inquiétude, elle vous demandera d'abord une confirmation ! Nous ne voulons pas d'accidents. 😅

## Astuces 💡

1. **État des services** : Après chaque démarrage ou redémarrage, YAMS vous indiquera l'état de chaque service, pour vous assurer que tout fonctionne correctement.

2. **Sauvegardes régulières** : Prenez l'habitude de lancer régulièrement `yams backup` avant de faire de gros changements. Votre vous du futur vous remercie !

3. **Vérifiez le VPN** : Lancez régulièrement `yams check-vpn` pour vous assurer que votre vie privée est protégée.

## Dépannage 🔧

Si vous avez une erreur de permission `docker` lorsque vous essayer d'utiliser le CLI, pas de panique ! Jetez un coup d'œil à notre guide [Problèmes courants](/faqs/common-errors/).

N'oubliez pas : Le CLI de YAMS est là pour vous faciliter la vie ! Si vous n'êtes pas sûr d'une commande, faites simplement `yams --help` ou revenez ici pour vous rafraîchir la mémoire. Bon visionnage ! 🎬
