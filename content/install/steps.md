---
title: Installation
date: 2023-01-10T15:23:20-03:00
weight: 2
summary: First steps to install YAMS on your server
---

## Dependencies

This script depends on:

- Debian 12 (recommended) or Ubuntu 22.04. If your OS is not ready, you need to figure that out first. Here are some guides:
  + https://www.digitalocean.com/community/tutorials/initial-server-setup-with-debian-11
  + https://www.digitalocean.com/community/tutorials/initial-server-setup-with-ubuntu
- Your OS must be fully configured. That means:
  + You have a user that is not `root`
  + You can run `sudo apt update` and `sudo apt upgrade` without errors
  + If you are using Ubuntu **make sure you are NOT installing the snap version of docker.** The snap version runs in a sandbox and doesn't have access to the OS.
  If you run `which docker` and get this output:
  ```
  $ which docker
  /snap/bin/docker
  ```
  You **won't** be able to install YAMS. ⚠️
- Required commands: `curl`, `docker`, `sed`, and `awk`
- Docker and Docker Compose (the script can install these for you on Debian/Ubuntu systems)

## Before running

Before installing, make sure you have:

- **An installation location:** The script defaults to `/opt/yams` but you can choose any location where your user has write permissions
- **A media folder:** This is where your files will be downloaded and organized. For example, if you choose `/srv/media`, the script will create:
  + `/srv/media/tv`: For TV shows
  + `/srv/media/movies`: For movies
  + `/srv/media/music`: For music
  + `/srv/media/books`: For books
  + `/srv/media/downloads`: For downloads
  + `/srv/media/blackhole`: For torrent blackhole
- **A regular user to run and own the media files:** Avoid using `root`
- **A VPN service (optional but STRONGLY recommended):** Choose from [this list](/advanced/vpn#official-supported-vpns). [ProtonVPN](https://protonvpn.com/) is recommended.

## Installation Steps

### 1. Setup Installation Location

The location `/opt/yams` is **recommended**, but you can use any location where your user has permissions:

```bash
sudo mkdir -p /opt/yams
sudo chown -R $USER:$USER /opt/yams
```

### 2. Check Docker Installation

If you already have Docker installed, ensure you can run it without sudo:

```bash
docker run hello-world
```

If this fails, follow the [Docker post-installation steps](https://docs.docker.com/engine/install/linux-postinstall/#manage-docker-as-a-non-root-user) or check the [Common docker permission errors](/faqs/common-errors/#common-docker-permission-errors).

### 3. Clone YAMS

Clone the installer to a temporary location:

```bash
git clone --depth=1 https://gitlab.com/rogs/yams.git /tmp/yams
cd /tmp/yams
```

### 4. Run the Installer

```bash
bash install.sh
```

The installer will guide you through several configuration steps:

#### Docker Installation (if needed)
If Docker isn't installed, the script will offer to install it:
```
Checking prerequisites...
⚠️ Docker/Docker Compose not found! ⚠️
Install Docker and Docker Compose? Only works on Debian/Ubuntu (y/N) [Default = n]:
```

#### User Configuration
```bash
User to own the media server files? [current-user]:
```
Enter the username that will own the media files. The default is your current user.

#### Directory Configuration
```bash
Installation directory? [/opt/yams]:
Media directory? [/srv/media]:
Are you sure your media directory is "/srv/media"? (y/N) [Default = n]:
```
Confirm your installation and media directories. The script will create them if they don't exist.

#### Media Service Selection
```bash
Time to choose your media service.
Your media service is responsible for serving your files to your network.
Supported media services:
- jellyfin (recommended, easier)
- emby
- plex (advanced, always online)

Choose your media service [jellyfin]:
```
Select your preferred media service. Jellyfin is recommended for beginners.

#### VPN Configuration
```bash
Time to set up the VPN.
Supported VPN providers: https://yams.media/advanced/vpn

Configure VPN? (Y/n) [Default = y]:
VPN service? (with spaces) [protonvpn]:
VPN username (without spaces):
VPN password:
```
Configure your VPN settings if desired. The script supports all VPNs listed at `/advanced/vpn#official-supported-vpns`.

### 5. Final Installation

The script will:
1. Copy and configure all necessary files
2. Start the YAMS services
3. Install the YAMS CLI tool
4. Set appropriate permissions

When complete, you'll see a success message and URLs for all services:

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

These URLs are also saved to `~/yams_services.txt` for future reference.

## Next Steps

After installation completes, proceed to the [configuration documentation](https://yams.media/config) to set up your media server.

If you encounter any issues:
- Check the [Common Issues](/faqs/common-errors/) page
- Visit the [YAMS Forum](https://forum.yams.media)
- Join our [Discord](https://discord.gg/Gwae3tNMST) or [Matrix](https://matrix.to/#/#yams-space:rogs.me) chat
