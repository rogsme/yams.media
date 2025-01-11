---
title: Installation
date: 2023-01-10T15:23:20-03:00
weight: 2
summary: First steps to install YAMS on your server
---

## Dependencies

YAMS only needs a few things to get started:

- Debian 12 (recommended) or Ubuntu 22.04. If your OS isn't ready yet, check out these guides:
  + https://www.digitalocean.com/community/tutorials/initial-server-setup-with-debian-11 (this one is for Debian 11, but it should be the same).
  + https://www.digitalocean.com/community/tutorials/initial-server-setup-with-ubuntu-22-04.
- Your OS needs to be properly configured. That means:
  + You have a user that is not `root` (because we're responsible adults 😎)
  + You can run `sudo apt update` and `sudo apt upgrade` without errors
  + If you're using Ubuntu, **make sure you are NOT using the snap version of docker!** The snap version runs in a sandbox and can't access what it needs. You can check by running `which docker`. If you see:
  ```
  $ which docker
  /snap/bin/docker
  ```
  You **won't** be able to install YAMS. ⚠️ 

Don't worry if you don't have `docker` and `docker-compose` installed - the script can handle that for you on Debian and Ubuntu! 

## Before running

Before we dive in, make sure you have:

### An installation location
The script defaults to `/opt/yams` but you can use any location as long as your user has write permissions. If you want to use the default location (recommended), set it up like this:

```bash
sudo mkdir -p /opt/yams
sudo chown -R $USER:$USER /opt/yams
```

### A media folder
This is where all your content will live. For example, if you pick `/srv/media`, the script will create:
+ `/srv/media/tvshows`: For your TV shows
+ `/srv/media/movies`: For your movies
+ `/srv/media/music`: For your music library
+ `/srv/media/books`: For your ebook collection
+ `/srv/media/downloads`: For your downloads
+ `/srv/media/blackhole`: For your torrent blackhole directory

### A regular user to run YAMS
+ Don't use `root` (I mean it! 😅)
+ This user will own all the media files
+ Must have sudo privileges for the initial setup

### A VPN service (optional but STRONGLY recommended)
+ Choose one from [this list](/advanced/vpn#official-supported-vpns)
+ We recommend ProtonVPN because:
  - Easy to configure
  - Built-in port forwarding support
  - Privacy-focused
  - Reasonable pricing

### If you already have Docker installed...

Make sure you can run `docker` **without** `sudo`! Try this:

```bash
docker run hello-world
```

If it fails, you might need to add your user to the docker group. Follow [Docker's post-installation steps](https://docs.docker.com/engine/install/linux-postinstall/#manage-docker-as-a-non-root-user) or check our [Common docker permission errors](/faqs/common-errors/#common-docker-permission-errors) page.

## Installation Steps

### 1. Get YAMS on your system

First, let's grab a fresh copy of YAMS and put it in a temporary location (we like to keep things tidy!):

```bash
git clone --depth=1 https://gitlab.com/rogs/yams.git /tmp/yams
cd /tmp/yams
```

### 2. Start the installer

```bash
bash install.sh
```

You'll see this welcome screen:
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

### 3. Docker Installation (if needed)

The installer will first check for Docker:
```bash
Checking prerequisites...
⚠️ Docker not found! ⚠️
Do you want YAMS to install docker and docker-compose? IT ONLY WORKS ON DEBIAN AND UBUNTU! [y/N]: y
```

- If you don't have Docker installed:
  + Type `y` and press Enter to let YAMS handle the Docker installation
  + The script will install both Docker and Docker Compose
  + This only works on Debian and Ubuntu!

- If you already have Docker:
  + You'll see "docker exists ✅" instead
  + The installer will move to the next step

### 4. Choose Installation Location

```bash
Where do you want to install the docker-compose file? [/opt/yams]:
```

- Press Enter to use the default `/opt/yams` (recommended)
- Or type a different path if you want to install somewhere else
- Make sure your user has write permissions to this location!

### 5. Select User

```bash
What's the user that is going to own the media server files? [your_current_user]:
```

- Press Enter to use your current user (recommended)
- Or type a different username
- Remember: Don't use `root`!
- The user must exist and have sudo privileges

### 6. Set Media Directory

```bash
Please, input your media directory [/srv/media]:
```

- Press Enter to use the default `/srv/media`
- Or type the path where you want your media stored. This path can also be a SMB/NFS mount in your host OS
- This can be an external drive or different partition

Then confirm your choice:
```bash
Are you sure your media directory is "/srv/media"? [y/N]:
```

- Type `y` and press Enter if the path is correct
- Type `n` or press Enter to go back and change it

### 7. Choose Media Service

```bash
Time to choose your media service.
Your media service is responsible for serving your files to your network.
Supported media services:
- jellyfin (recommended, easier)
- emby
- plex (advanced, always online)

Choose your media service [jellyfin]:
```

Pick your streaming service:
- Press Enter for Jellyfin (recommended for beginners)
- Type `emby` for Emby
- Type `plex` for Plex

Each service has its strengths:
- **Jellyfin**: Free, open-source, easy to set up
- **Emby**: Similar to Jellyfin but with premium features
- **Plex**: Most polished, but requires online account and is more complex to configure

### 8. VPN Configuration

```bash
Time to set up the VPN.
Supported VPN providers: https://yams.media/advanced/vpn

Configure VPN? (Y/n) [Default = y]:
```

If you want to use a VPN (strongly recommended):
1. Press Enter or type `y` to configure VPN
2. Enter your VPN provider:
   ```bash
   VPN service? (with spaces) [protonvpn]:
   ```
   - Press Enter for ProtonVPN (recommended)
   - Or type your VPN provider's name

   The installer will show you where to find the setup documentation:
   ```bash
   Please check protonvpn's documentation for specific configuration:
   https://github.com/qdm12/gluetun-wiki/blob/main/setup/providers/protonvpn.md
   ```
   Make sure to check this documentation - it will help you avoid common setup issues!
   
   If you are using ProtonVPN:
   ```bash
   DO NOT USE YOUR PROTON ACCOUNT USERNAME AND PASSWORD. REFER TO THE DOCUMENTATION ABOVE TO OBTAIN THE CORRECT VPN USERNAME AND PASSWORD.
   ```
   [Don't say you weren't warned](https://github.com/qdm12/gluetun-wiki/blob/main/setup/providers/protonvpn.md#openvpn-only).

3. Configure port forwarding:
   ```bash
   Port forwarding allows for better connectivity in certain applications.
   However, not all VPN providers support this feature.
   Please check your VPN provider's documentation to see if they support port forwarding.
   Enable port forwarding? (y/N) [Default = n]:
   ```

4. Enter your credentials:
   ```bash
   VPN username (without spaces):
   VPN password:
   ```
   
Special notes:
- For ProtonVPN, just enter your username - the script automatically adds `+pmp` for port forwarding
- For Mullvad, it will only ask you for your username, since Mullvad doesn't need a password

If you don't want to configure VPN now:
- Type `n` and press Enter
- You can set it up later, but **always use a VPN when downloading torrents!**

### 9. Installation Process

After you've answered all the questions, you'll see:
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

The installer will now:
1. Copy all necessary configuration files
2. Set up your chosen options
3. Start downloading and configuring Docker containers

You'll then see:
```bash
We need your sudo password to install the YAMS CLI and configure permissions...
```

Enter your sudo password to:
- Install the YAMS command-line tool
- Set proper permissions on your media folders

If everything works, you'll see these success messages:
```bash
YAMS CLI installed successfully ✅
Media directory ownership and permissions set successfully ✅
Install directory ownership and permissions set successfully ✅
Configuration folder "/opt/yams/config" exists ✅
Configuration folder ownership and permissions set successfully ✅
```

### 10. Final Success Screen

When everything's done, you'll see this awesome ASCII art:
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

Following this, you'll get a list of all your service URLs:
```bash
Service URLs:
qBittorrent: http://your.ip.address:8081/
SABnzbd: http://your.ip.address:8080/
Radarr: http://your.ip.address:7878/
Sonarr: http://your.ip.address:8989/
Lidarr: http://your.ip.address:8686/
Readarr: http://your.ip.address:8787/
Prowlarr: http://your.ip.address:9696/
Bazarr: http://your.ip.address:6767/
Media Service: http://your.ip.address:8096/
Portainer: http://your.ip.address:9000/
```

Don't worry about memorizing these - they're saved in `~/yams_services.txt` for easy reference!

### Important Notes:

1. **First Start Time**
   - Services might take a few minutes to fully start
   - Be patient on first launch!

2. **VPN Check**
   If you configured a VPN, verify it's working:
   ```bash
   yams check-vpn
   ```
   You should see different IPs for your system and qBittorrent.

## What's Next?

Time to configure your new media server! Head over to [Configuration](/config) and follow these guides in order:
1. [qBittorrent](/config/qbittorrent)
2. [SABnzbd](/config/sabnzbd)
3. [Radarr](/config/radarr)
4. [Sonarr](/config/sonarr)
5. [Prowlarr](/config/prowlarr)
6. [Bazarr](/config/bazarr)
7. Your chosen media service:
   - [Jellyfin](/config/jellyfin)
   - [Emby](/config/emby)
   - [Plex](/config/plex)

Need help? We've got your back!
- Check our [Common Issues](/faqs/common-errors/) page
- Visit the [YAMS Forum](https://forum.yams.media)
- Join our [Discord](https://discord.gg/Gwae3tNMST) or [Matrix](https://matrix.to/#/#yams-space:rogs.me) chat
