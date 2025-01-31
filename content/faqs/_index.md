---
title: "FAQ"
date: 2025-01-30T11:35:44+02:00
draft: false
weight: 100
---

# Frequently Asked Questions 🤔

## Questions générales

### Pourquoi un autre script pour serveur multimédia ?

YAMS est né d'un objectif simple : créer un serveur multimédia si facile à utiliser que les membres de votre famille non initiés à la technologie pourraient s'en charger ! Bien qu'il existe d'autres solutions, YAMS se concentre sur la simplicité et l'automatisation sans sacrifier la puissance.

### Pourquoi ces choix spécifiques de services ?

YAMS est conçu avec **un parti pris**. Chaque choix a été fait pour offrir une expérience fiable et conviviale. Si vous êtes curieux à propos de certains choix spécifiques :

-   **Sonarr/Radarr** : Les meilleurs pour la gestion automatisée des médias
-   **Prowlarr** : Gestion unifiée des indexeurs
-   **qBittorrent** : Client torrent fiable et open-source
-   **Gluetun** : Gestion robuste de VPN
-   **Jellyfin/Emby/Plex** : Options de streaming multimédia de qualité supérieure.

Vous n'êtes pas d'accord avec nos choix ? Ce n'est pas grave ! Vous pouvez toujours vous inspirer de notre code source pour votre propre configuration. 🔧

## Support des systèmes d'exploitation

### Puis-je exécuter YAMS sur Windows ?

Bien que techniquement possible avec Docker pour Windows, nous ne le supportons pas officiellement. Jetez plutôt un coup d'œil à [WIMPS](https://github.com/Xaque8787/WIMPS) qui s'inspire de YAMS mais est conçu spécifiquement pour Windows ! Bien que le projet ait été archivé, il pourrait constituer un meilleur point de départ que YAMS.

### Et macOS ?

Comme pour Windows, cela peut fonctionner, mais nous nous concentrons sur la prise en charge de Linux pour une meilleure expérience. Si vous utilisez macOS, envisagez d'exécuter YAMS dans une VM Linux.

### Quelles sont les distributions Linux prises en charge ?

-   **Recommendé** : Debian 12
-   **Également supporté** : Ubuntu 24.04
-   D'autres distros peuvent fonctionner mais ne sont pas officiellement supportées.

## Utilisation avancée

### Comment ajouter ses propres conteneurs ?

Facile ! Consultez notre guide [Ajouter vos propres conteneurs à YAMS](/advanced/add-your-own-containers/). Vous pouvez ajouter n'importe quel conteneur Docker pour fonctionner avec YAMS.

### Puis-je modifier les paramètres par défaut de YAMS ?

Absolument ! Bien que YAMS soit doté de valeurs par défaut efficaces, vous pouvez personnaliser :

-   La configurations des conteneurs
-   Les paramètres de téléchargement
-   L'organisation des médias
-   Les paramètres du réseau
-   Et bien d'autres choses encore !

### Besoin d'une configuration plus avancée ?

Consultez les [Guides TRaSH](https://trash-guides.info/) - ils sont fantastiques pour approfondir les réglages de chaque service !

## Réseau & VPN

### Puis-je ajouter d'autres conteneurs derrière le VPN ?

Oui ! Tout est documenté dans le [guide VPN](https://github.com/qdm12/gluetun-wiki/blob/main/setup/connect-a-container-to-gluetun.md). Votre fichier de configuration se trouve dans `/opt/yams/docker-compose.yaml` (ou dans votre emplacement d'installation personnalisé).

### Quels sont les fournisseurs de VPN qui fonctionnent avec YAMS ?

Nous supportons de nombreux fournisseurs populaires ! Consultez notre page [Configuration VPN](/advanced/vpn/#fournisseurs-vpn-supportés-) pour la liste complète.

## Dépannage

### Des erreurs de permission Docker ?

Problème fréquent ! Consultez notre page [Erreurs courantes](/faqs/common-errors/#problèmes-liés-à-docker) pour trouver la solution.

### Les services ne démarrent pas ?

1. Vérifiez les logs : `docker logs nom-du-conteneur`
2. Vérifier les permissions
3. Consultez notre page [Erreurs courantes](/faqs/common-errors/)

## Obtenir de l'aide 🆘

Besoin d'aide ? Nous sommes là pour vous aider !

1. **Documentation**

    - Vérifier les documentations des services concernés
    - Consulter notre page [Erreurs courantes](/faqs/common-errors/)
    - Rechercher les posts existants sur le forum

2. **Communauté**

    - Rejoignez notre serveur [Discord](https://discord.gg/Gwae3tNMST)
    - Visitez notre chat [Matrix](https://matrix.to/#/#yams-space:rogs.me)
    - Postez sur notre [Forum](https://forum.yams.media)

3. **Problèmes et bugs**
    - Consultez nos [Issues GitLab](https://gitlab.com/rogs/yams/-/issues)
    - Recherchez des issues similaires
    - Créez une nouvelle issue si nécessaire

## Contribuer 🤝

Vous voulez contribuer à l'amélioration de YAMS ? Génial !

-   Forkez notre dépôt
-   Effectuez vos modifications
-   Soumettez une pull request
-   Ou aidez-nous à améliorer notre documentation !

N'oubliez pas : YAMS est un projet communautaire, et toutes les contributions sont les bienvenues ! 🌟
