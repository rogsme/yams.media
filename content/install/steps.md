---
title: Installation
date: 2025-01-17T09:27:14+02:00
weight: 2
summary: Les premières étapes pour installer YAMS sur votre serveur
---

## Dépendances

YAMS n'a besoin que de quelques éléments pour fonctionner :

-   Debian 12 (recommandé) ou Ubuntu 24.04. Si vous n'avez pas encore de système d'exploitation installé, vous pouvez consulter ces guides :
    -   https://www.digitalocean.com/community/tutorials/initial-server-setup-with-debian-11 (Celui-ci est pour Debian 11, mais c'est relativement similaire pour Debian 12).
    -   https://www.digitalocean.com/community/tutorials/initial-server-setup-with-ubuntu-22-04 (De même, le guide est pour Ubuntu 22 mais les étapes sont similaires pour Ubuntu 24).
-   Votre système d'exploitation doit être configuré correctement. Ça inclut que :
    -   Vous devez avoir un utilisateur qui n'est pas `root` (parce que nous sommes des adultes responsables 😎)
    -   Vous devez être capable de lancer les commandes `sudo apt update` et `sudo apt upgrade` sans erreurs
    -   Si vous utilisez Ubuntu, **assurez-vous de NE PAS utilisez la version snap de Docker !** La version snap fonctionne dans un environnement restreint qui ne répond pas à nos besoins. Vous pouvez vérifier votre version Docker avec la commande `which docker`. Si vous voyez :
    ```
    $ which docker
    /snap/bin/docker
    ```
    Vous **ne pourrez pas** installer YAMS. ⚠️

Ne vous inquiétez pas si vous n'avez pas encore installé `docker` et `docker compose`. Le script s'occupe de tout sur Debian et Ubuntu !

## Avant de commencer

Avant d'entrer dans le vif du sujet, assurez-vous d'avoir :

- **Git installé :** Vous en aurez besoin pour cloner le dépôt YAMS. Vérifiez s'il est installé avec :
    ```bash
    git --version
    ```
    Si vous ne l'avez pas encore, vous pouvez l'installer facilement :
    ```bash
    # Pour Debian/Ubuntu
    sudo apt update
    sudo apt install git
    ```

- **Un emplacement d'installation :** Le script utilise par défaut `/opt/yams` mais c'est à vous de choisir ! Assurez-vous simplement que votre utilisateur ait les permissions d'écriture à cet endroit.

- **Un dossier multimédia :** C'est ici que tout votre contenu sera placé. Par exemple, si vous choisissez `/srv/media`, le script créera :
    +   `/srv/media/tv`: Pour vos séries
    +   `/srv/media/movies`: Pour vos films
    +   `/srv/media/music`: Pour votre bibliothèque musicale
    +   `/srv/media/books`: Pour votre bibiliothèque e-book
    +   `/srv/media/downloads`: Pour vos téléchargements
    +   `/srv/media/blackhole`: Pour votre dossier "trou noir" pour vos torrents

- **Un utilisateur standard pour exécuter YAMS :** N'utilisez pas `root` (Vraiment ! 😅)

- **Un VPN (optionnel mais FORTEMENT recommandé) :** Choisissez-en un parmi [cette liste](/advanced/vpn#fournisseurs-vpn-supportés-). Je recommande toujours [ProtonVPN](https://protonvpn.com/) car il est super simple à mettre en place !

## Étapes d'installation

### 1. Définir l'emplacement d'installation

L'emplacement `/opt/yams` est **recommandé**, mais vous pouvez être un rebelle et utiliser celui que vous voulez si votre utilisateur a les permissions :

```bash
sudo mkdir -p /opt/yams
sudo chown -R $USER:$USER /opt/yams
```

### 2. Si Docker est déjà installé…

Assurez-vous de pouvoir lancer `docker` **sans** `sudo` ! Essayez cette commande :

```bash
docker run hello-world
```

Si elle échoue, vous devrez peut-être ajouter votre utilisateur au groupe Docker. Suivez le guide [Étapes post-installation Docker](https://docs.docker.com/engine/install/linux-postinstall/#manage-docker-as-a-non-root-user) ou consultez notre page [Erreurs courantes avec les permissions Docker](/faqs/common-errors/#common-docker-permission-errors).

## Étapes d'installation

### 1. Téléchargez YAMS sur votre système

Tout d'abord, prenons une version récente de YAMS et plaçons-la dans un emplacement temporaire (nous aimons que les choses soient bien rangées !) :

```bash
git clone --depth=1 https://gitlab.com/rogs/yams.git /tmp/yams
cd /tmp/yams
```

### 2. Lancer l'installateur

```bash
bash install.sh
```

Vous verrez ce message de bienvenue :

```bash
====================================================
                 ___           ___           ___
     ___        /  /\         /__/\         /  /\
    /__/|      /  /::\       |  |::\       /  /:/_
   |  |:|     /  /:/\:\      |  |:|:\     /  /:/ /\
   |  |:|    /  /:/~/::\   __|__|:|\:\   /  /:/ /::\
 __|__|:|   /__/:/ /:/\:\ /__/::::| \:\ /__/:/ /:/\:\
/__/::::\   \  \:\/:/__\/ \  \:\~~\__\/ \  \:\/:/~/:/
   ~\~~\:\   \  \::/       \  \:\        \  \::/ /:/
     \  \:\   \  \:\        \  \:\        \__\/ /:/
      \__\/    \  \:\        \  \:\         /__/:/
                \__\/         \__\/         \__\/
====================================================
Welcome to YAMS (Yet Another Media Server)
Installation process should be really quick
We just need you to answer some questions
====================================================
```

### 3. Installation de Docker (si besoin)

L'installateur va d'abord vérifier si vous avez déjà Docker :

```bash
Checking prerequisites...
⚠️ Docker not found! ⚠️
Do you want YAMS to install docker and docker-compose? IT ONLY WORKS ON DEBIAN AND UBUNTU! [y/N]: y
```

-   Si Docker n'est pas encore installé :

    -   Tapez `y` et appuyez sur Entrer pour autoriser YAMS à gérer l'installation de Docker
    -   Le script installera Docker et Docker Compose
    -   Ce script fonctionne uniquement sur Debian et Ubuntu !

-   Si Docker est déjà installé :
    -   Vous verrez alors "docker exists ✅"
    -   L'installateur passera à l'étape suivante

### 4. Choisissez un dossier d'installation

```bash
Where do you want to install the docker-compose file? [/opt/yams]:
```

-   Appuyez sur Entrer pour utiliser le dossier par défaut `/opt/yams` (recommandé)
-   Ou tapez un chemin différent si vous souhaitez l'installer à un autre endroit
-   Assurez vous que votre utilisateur a bien les permissions d'écriture à cet endroit !

### 5. Sélectionnez l'utilisateur

```
What's the user that is going to own the media server files? [your_current_user]:
```

-   Appuyez sur Entrer pour utiliser l'utilisateur actuel (recommandé)
-   Ou saisissez un utilisateur différent
-   Rappel : N'utilisez pas `root`!
-   Cet utilisateur doit exister et avoir les privilèges sudo

### 6. Définissez un dossier multimédia

```bash
Please, input your media directory [/srv/media]:
```

-   Appuyez sur Entrer pour utiliser le dossier par défaut `/srv/media`
-   Ou saisissez le chemin vers l'emplacement souhaité. Ce chemin peut notamment être un montage SMB/NFS sur votre système.
-   Cela peut également être un disque dur externe ou une autre partition

Puis confirmez votre choix :

```bash
Are you sure your media directory is "/srv/media"? [y/N]:
```

-   Tapez `y` et appuyez sur Entrer si le chemin est correct
-   Tapez `n` ou appuyez sur Entrer pour revenir en arrière et le changer

### 7. Choisissez votre service multimédia

```bash
Time to choose your media service.
Your media service is responsible for serving your files to your network.
Supported media services:
- jellyfin (recommended, easier)
- emby
- plex (advanced, always online)

Choose your media service [jellyfin]:
```

Choisissez votre service de streaming :

-   Appuyez sur Entrer pour Jellyfin (recommandé pour les débutants)
-   Tapez `emby` pour Emby
-   Tapez `plex` pour Plex

Chaque service a ses avantages :

-   **Jellyfin** : Gratuit, open-source, simple à configurer
-   **Emby** : Similaire à Jellyfin mais avec des fonctionnalités premium
-   **Plex** : le plus abouti, mais nécessite un compte Plex et plus complexe à configurer. Attention, de [nouvelles limitations](https://www.plex.tv/blog/important-2025-plex-updates) ont été récemment mises en places pour les utilisateurs sans Plex Pass

### 8. Configuration VPN

```bash
Time to set up the VPN.
Supported VPN providers: https://yams.media/advanced/vpn

Configure VPN? (Y/n) [Default = y]:
```

Si vous souhaitez utiliser un VPN (fortement recommandé) :

1. Appuyez sur Entrer ou tapez `y` pour configurer un VPN
2. Entrez votre fournisseur VPN :

    ```bash
    VPN service? (with spaces) [protonvpn]:
    ```

    - Appuyez sur Entrer pour ProtonVPN (recommandé)
    - Ou tapez le nom de votre fournisseur VPN

    L'installateur vous indiquera où trouver la documentation d'installation :

    ```
    Please check protonvpn's documentation for specific configuration:
    https://github.com/qdm12/gluetun-wiki/blob/main/setup/providers/protonvpn.md
    ```

    Assurez-vous de bien lire cette documentation, cela vous aidera à éviter les problèmes d'installation les plus courants !

    Si vous utilisez ProtonVPN :

    ```
    N'UTILISEZ PAS LE NOM D'UTILISATEUR ET LE MOT DE PASSE DE VOTRE COMPTE PROTON. REPORTEZ-VOUS À LA DOCUMENTATION CI-DESSUS POUR OBTENIR LE BON IDENTIFIANT ET MOT DE PASSE.
    ```

    [Ne dites pas que vous n'avez pas été prévenus](https://github.com/qdm12/gluetun-wiki/blob/main/setup/providers/protonvpn.md#openvpn-only).

3. Configurez la redirection de port :

    ```
    Port forwarding allows for better connectivity in certain applications.
    However, not all VPN providers support this feature.
    Please check your VPN provider's documentation to see if they support port forwarding.
    Enable port forwarding? (y/N) [Default = n]:
    ```

4. Entrez vos identifiants :
    ```bash
    VPN username (without spaces):
    VPN password:
    ```

Remarques particulières :

-   Pour ProtonVPN, entrez juste votre nom d'utilisateur, le script ajoute automatiquement `+pmp` pour la redirection de port
-   Pour Mullvad, il vous sera uniquement demandé votre nom d'utilisateur puisque Mullvad n'a pas besoin de mot de passe

Si vous ne souhaitez pas configurer de VPN pour l'instant :

-   Tapez `n`et appuyez sur Entrer
-   Vous pouvez toujours l'installer plus tard, mais **utilisez toujours un VPN lorsque vous téléchargez des torrents !**

### 9. Processus d'installation

Après avoir répondu à toutes les questions, vous verrez :

```bash
Copying docker-compose.example.yaml to /opt/yams/docker-compose.yaml...
docker-compose.example.yaml was copied successfuly! ✅

Copying .env.example to /opt/yams/.env...
.env.example was copied successfuly! ✅

Copying docker-compose.custom.yaml to /opt/yams/docker-compose.custom.yaml...
docker-compose.custom.yaml was copied successfuly! ✅
Everything installed correctly! 🎉
Running the server...
This is going to take a while...
```

L'installateur va maintenant :

1. Copier tous les fichiers de configuration nécessaires
2. Appliquer toutes les options que vous avez choisies
3. Lancer le téléchargement et configurer les conteneurs Docker

Vous verrez alors :

```bash
We need your sudo password to install the YAMS CLI and configure permissions...
```

Entrez votre mot de passe sudo pour :

-   Installer l'interface de ligne de commande (CLI) YAMS
-   Appliquer les bonnes permissions sur vos dossiers multimédia

Si tout fonctionne, vous verrez les messages de confirmation suivants :

```bash
YAMS CLI installed successfully ✅
Media directory ownership and permissions set successfully ✅
Install directory ownership and permissions set successfully ✅
Configuration folder "/opt/yams/config" exists ✅
Configuration folder ownership and permissions set successfully ✅
```

### 10. Écran de confirmation final

Lorsque tout sera terminé, vous verrez ce superbe ASCII art :

```bash
========================================================
     _____          ___           ___           ___
    /  /::\        /  /\         /__/\         /  /\
   /  /:/\:\      /  /::\        \  \:\       /  /:/_
  /  /:/  \:\    /  /:/\:\        \  \:\     /  /:/ /\
 /__/:/ \__\:|  /  /:/  \:\   _____\__\:\   /  /:/ /:/_
 \  \:\ /  /:/ /__/:/ \__\:\ /__/::::::::\ /__/:/ /:/ /\
  \  \:\  /:/  \  \:\ /  /:/ \  \:\~~\~~\/ \  \:\/:/ /:/
   \  \:\/:/    \  \:\  /:/   \  \:\  ~~~   \  \::/ /:/
    \  \::/      \  \:\/:/     \  \:\        \  \:\/:/
     \__\/        \  \::/       \  \:\        \  \::/
                   \__\/         \__\/         \__\/
========================================================
```

Vous obtiendrez ensuite une liste de tous les URL de vos services :

```bash
Service URLs:
qBittorrent: http://your.ip.address:8081/
SABnzbd: http://your.ip.address:8080/
Radarr: http://your.ip.address:7878/
Sonarr: http://your.ip.address:8989/
Lidarr: http://your.ip.address:8686/
Prowlarr: http://your.ip.address:9696/
Bazarr: http://your.ip.address:6767/
Media Service: http://your.ip.address:8096/
Portainer: http://your.ip.address:9000/
```

Ne vous efforcez pas de les retenir, ils sont sauvegardés dans `~/yams_services.txt` pour que vous puissiez les retrouver facilement !

### Remarques importantes :

1. **Premier démarrage**

    - Les services peuvent prendre quelques minutes pour être pleinement opérationnels
    - Soyez patient pendant le premier démarrage !

2. **Vérifier si le VPN fonctionne**

Si vous avez configuré un VPN, assurez-vous qu'il fonctionne :

```bash
yams check-vpn
```

Vous devriez voir deux adresses IP différentes entre votre système et qBittorrent.

## Et ensuite ?

Il est temps de configurer votre nouveau serveur multimédia ! Dirigez-vous vers [Configuration](/config) puis suivez les guides dans cet ordre :

1. [qBittorrent](/config/qbittorrent)
2. [SABnzbd](/config/sabnzbd)
3. [Radarr](/config/radarr)
4. [Sonarr](/config/sonarr)
5. [Prowlarr](/config/prowlarr)
6. [Bazarr](/config/bazarr)
7. Votre service multimédia choisi :
    - [Jellyfin](/config/jellyfin)
    - [Emby](/config/emby)
    - [Plex](/config/plex)

Besoin d'aide ? Nous sommes là pour vous aider !

-   Visitez notre page [Problèmes courants](/faqs/common-errors/)
-   Visitez le [Forum YAMS](https://forum.yams.media)
-   Rejoignez notre serveur [Discord](https://discord.gg/Gwae3tNMST) ou [Matrix](https://matrix.to/#/#yams-space:rogs.me)
