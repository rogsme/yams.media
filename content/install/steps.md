---
title: Installation
date: 2023-01-10T15:23:20-03:00
weight: 2
summary: First steps to install YAMS on your server
---

## Dependencies

YAMS only needs a few things to get going:

- Debian 12 (recommended) or Ubuntu 22.04. If your OS isn't ready yet, check out these guides:
  + https://www.digitalocean.com/community/tutorials/initial-server-setup-with-debian-11
  + https://www.digitalocean.com/community/tutorials/initial-server-setup-with-ubuntu
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

- **An installation location:** The script defaults to `/opt/yams` but hey, you do you! Just make sure your user can write to wherever you choose.
- **A media folder:** This is where all your stuff will live. For example, if you pick `/srv/media`, the script will create:
  + `/srv/media/tv`: For your TV shows
  + `/srv/media/movies`: For your movies
  + `/srv/media/music`: For your tunes
  + `/srv/media/books`: For your books
  + `/srv/media/downloads`: For your downloads
  + `/srv/media/blackhole`: For your torrent blackhole
- **A regular user to run and own the media files:** Don't use `root` (I mean, I can't stop you, but come on! 😅)
- **A VPN service (optional but STRONGLY recommended):** Choose one from [this list](/advanced/vpn#official-supported-vpns). I always recommend [ProtonVPN](https://protonvpn.com/) because it's super easy to set up!

## Installation Steps

### 1. Setup your install location

The `/opt/yams` location is **recommended**, but you can be a rebel and use whatever you like if your user has permissions:

```bash
sudo mkdir -p /opt/yams
sudo chown -R $USER:$USER /opt/yams
```

### 2. If you already have docker installed...

Make sure you can run `docker` **without** `sudo`! Try this:

```bash
docker run hello-world
```

If it fails, you might need to add your user to the docker group. Check out [Docker's post-installation steps](https://docs.docker.com/engine/install/linux-postinstall/#manage-docker-as-a-non-root-user) or look at our [Common docker permission errors](/faqs/common-errors/#common-docker-permission-errors) page.

### 3. Get YAMS on your system

Clone the installer to a temporary spot (let's keep things tidy!):

```bash
git clone --depth=1 https://gitlab.com/rogs/yams.git /tmp/yams
cd /tmp/yams
```

### 4. Fire up the installer

```bash
bash install.sh
```

Now comes the fun part! The installer will walk you through everything:

#### Docker Setup (if needed)
```
Checking prerequisites...
⚠️ Docker/Docker Compose not found! ⚠️
Install Docker and Docker Compose? Only works on Debian/Ubuntu (y/N) [Default = n]:
```
Choose `y` if you want YAMS to handle the Docker installation.

#### Pick Your User
```bash
User to own the media server files? [current-user]:
```
This is where you pick who's going to own all the media files. It defaults to your current user (which is usually what you want 👍).

#### Choose Your Directories
```bash
Installation directory? [/opt/yams]:
Media directory? [/srv/media]:
Are you sure your media directory is "/srv/media"? (y/N) [Default = n]:
```
The script will create these if they don't exist - how thoughtful! 🎉

#### Pick Your Media Service
```bash
Time to choose your media service.
Your media service is responsible for serving your files to your network.
Supported media services:
- jellyfin (recommended, easier)
- emby
- plex (advanced, always online)

Choose your media service [jellyfin]:
```
Jellyfin is great for beginners - it's what I recommend! But hey, they're all good choices.

#### VPN Setup
```bash
Time to set up the VPN.
Supported VPN providers: https://yams.media/advanced/vpn

Configure VPN? (Y/n) [Default = y]:
VPN service? (with spaces) [protonvpn]:

If you are using ProtonVPN, remember to suffix '+pmp' to your username

VPN username (without spaces):
VPN password:
```
This is where the magic happens to keep your downloads private and secure! 🔒

### 5. Let it rip!

The script will now:
1. Copy all the files where they need to go
2. Start up all the YAMS services
3. Install a handy CLI tool
4. Set up all the permissions just right

When it's done, you'll get a nice success message and all your service URLs:

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

Don't worry - these URLs are saved in `~/yams_services.txt` so you don't have to memorize them! 😉

## What's Next?

Head over to the [configuration docs](/config) to get your media server set up just the way you like it!

Running into trouble? We've got your back!
- Check out the [Common Issues](/faqs/common-errors/) page
- Visit the [YAMS Forum](https://forum.yams.media)
- Join our [Discord](https://discord.gg/Gwae3tNMST) or [Matrix](https://matrix.to/#/#yams-space:rogs.me) chat - we're a friendly bunch! 🙋‍♂️
