---
title: Installation
date: 2023-01-10T15:23:20-03:00
weight: 2
summary: First steps to install YAMS on your server
---

## Dependencies

This script only depends on:

- Debian 11 (recommended) or Ubuntu 22.04.
- [docker](https://www.docker.com/).
- [docker-compose](https://docs.docker.com/compose/).

If you haven’t installed `docker` and `docker-compose`, don’t worry! The script will attempt to run both installations (it only works in Debian and Ubuntu!)

## Before running
Before installing, make sure you have:

- **An installation location:** The script is going to ask you for an install location, but it will default to `/opt/yams`. Just make sure your current user has permissions to write on the selected directory.
- **A media folder:** This is the folder where all your files are going to be downloaded and categorized. For example, if you choose `/srv/media`, the script is going to create the following folders:
  + `/srv/media/tv`: For your TV shows.
  + `/srv/media/movies`: For your movies.
  + `/srv/media/downloads`: For your torrent downloads.
  + `/srv/media/blackhole`: For your torrents blackhole.
- **A regular user to run and own the media files:** You shouldn’t use `root` for this user, but I’m not your father, nothing is going to stop you lol.
- **A VPN service (optional but STRONGLY recommended):** If you can, choose one from [this list](/advanced/vpn#official-supported-vpns). The VPN I always recommend is [Mullvad](https://mullvad.net/en/) for reasons I will explain later in the installation process.

## To install

### Setup your install location (location is optional, you can choose any other location)

The location `/opt/yams` is **recommended**, but you can use whatever you like if your current user has permissions on the directory.

```bash
sudo mkdir -p /opt/yams
sudo chown -R $USER:$USER /opt/yams
```

### If you already have docker and docker-compose installed...

Make sure you can run `docker` **without** `sudo`!

If you run `docker` with `sudo` and another user other than `root` you'll encounter multiple permission errors. You can find instructions on how to run `docker` without `sudo` here: https://docs.docker.com/engine/install/linux-postinstall/#manage-docker-as-a-non-root-user.

If you can run `docker run hello-world` without `sudo`, you can continue. If you encounter any other `docker` issue, go to the [FAQs](/faqs/), there's a section on "Common `docker` permission errors".

### Inspecting the `install` script by yourself (optional).

Its always a good practice to verify and study the scripts you run on your machine. You can always inspect `install.sh` on the Gitlab repo here: https://gitlab.com/rogs/yams/-/blob/master/docs.org. You don't have to be a complete expert in `bash` (I'm definitely not lol), but if you have any experience with the Linux terminal you should be able to at understand what's happening.

### Cloning from Gitlab
```bash
git clone https://gitlab.com/rogs/yams.git
cd yams
```

### Installing YAMS
```bash
bash install.sh
```

You'll see the following prompt:

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
Instalation process should be really quick
We just need you to answer some questions
====================================================

Checking prerequisites...
 ⚠️ docker not found! ⚠️
Do you want YAMS to install docker and docker-compose? IT ONLY WORKS ON DEBIAN AND UBUNTU! [y/N]: y
```
You can choose `y` to install `docker` and `docker-compose` with YAMS or `n` to exit the script.

When docker finishes the installation OR if you already had `docker` and `docker-compose` installed, you should see the following message at the bottom:

```bash
Checking prerequisites...
docker exists ✅
docker-compose exists ✅
Where do you want to install the docker-compose file? [/opt/yams]:
```

You should choose the path where you want YAMS to be installed. Like I said before, the `/opt/yams` directory **is recommended**, but you can use whatever you like if your current user has permissions on the directory. Type the path you'll like to use and press `[ENTER]` to continue.

```bash
What's the user that is going to own the media server files? [your_current_user]:
```

Now, you have to choose the user that is going to own your media files. **I strongly suggest you don't use `root` for this user**, but you can do whatever you want. The script is going to default to the current `$USER` running the script. Type the user you want to own the files and press `[ENTER]` to continue.

```bash
Please, input your media directory [/srv/media]:
```

My suggestion is to use something like `/srv/media`, but you _might_ want to use an external hard drive or a different partition on your machine. Just type the full path of the directory you want to use and press `[ENTER]` to continue. If it doesn't exist, the script is going to try to create it.

```bash
Are you sure your media directory is "/srv/media"? [y/N]:
```

Select `y` or `n` if you are happy with the folder you selected. Press `[ENTER]` to continue.

#### Media service
```bash
Time to choose your media service.
Your media service is responsible for serving your files to your network.
By default, YAMS supports 3 media services:
- jellyfin (recommended, easier)
- emby
- plex (advanced, always online)
Choose your media service [jellyfin]:
```
It's time to configure the media service!

By default, YAMS supports 3 big media services:
- [Jellyfin](https://jellyfin.org) (recommended): In my opinion, Jellyfin is the best one. It's fast, easy to configure and Open Source.
- [Emby](https://emby.media): Emby its the one I use on my local config. It's very similar to Jellyfin (Jellyfin is a fork of Emby), and it has almost the same funtionalities. The reason I'm not recommending it is because it has a paid plan and it's closed source.
- [Plex](https://plex.tv): I only recommend Plex to advanced users or people who need all the extra stuff it provides, because the interface and all the services might be a little overwhelming if this is your first time with a home server. I don’t like it that much because it’s always online, and it has more functionalities than I need. Also, at least in YAMS, it’s the hardest to configure. But if you want to share your media server with other people easily, Plex is the way to go! Jellyfin and Emby can share media outside your network, but they are a little more complicated to configure.

Type one from the list and press [ENTER]. If you don't choose anything, the installer is going to default to Jellyfin.

#### VPN
```bash
Time to set up the VPN.
You can check the supported VPN list here: https://yams.media/advanced/vpn.
Do you want to configure a VPN? [Y/n]:
```

Now it's time to configure the VPN. The automatic installer supports all the VPNs on [this list](/advanced/vpn#official-supported-vpns), but **I strongly recommend using Mullvad**. Why?:
- They don't require your email or information to create a new account.
- It's simple to configure.
- They only have monthly subscriptions, so you can leave them whenever you want.
- You can pay with crypto.

If want to configure a VPN, select `Y` and continue with these instructions. If you don't have a VPN or don't want to use a VPN, choose `N` and move to [finishing the installation](#finishing-the-installation). You can set your VPN later in the [qBittorrent configuration](/config/qbittorrent). **You should always use a VPN when downloading torrents!**

```bash
What's your VPN service? (with spaces) [mullvad]:
```

First, select your VPN provider. You can go to [this list](/advanced/vpn#official-supported-vpns) and verify the name of your VPN.

```bash
You should read mullvad's documentation in case it has different configurations for username and password.
The documentation for mullvad is here: https://github.com/qdm12/gluetun-wiki/blob/main/setup/providers/mullvad.md
What's your VPN username? (without spaces):
```
Now, just enter your VPN username. If it has spaces, delete them.

```bash
What's your VPN password? (if you are using mullvad, just enter your username again):
```
Then, enter your VPN password. The script is going to output `*` characters to hide your password, so don't worry about leaking your password on the screen.

### Finishing the installation

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

...

...

...
```

If you get a `docker` permission error, go [here](/faqs/) to fix it.

After a lot of docker installing, you'll get a message like this at the end:
```bash
We need your sudo password to install the YAMS CLI and configure permissions...
```

In this step, YAMS needs your `sudo` password to configure the `yams` helper.

```bash
YAMS CLI installed successfully ✅
Media directory ownership and permissions set successfully ✅
Install directory ownership and permissions set successfully ✅
Configuration folder "/opt/yams/config" exists ✅
Configuration folder ownership and permissions set successfully ✅
```

And the installer ends like this:

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
All done!✅ Enjoy YAMS!
You can check the installation on /opt/yams
========================================================
Everything should be running now! To check everything running, go to:

Service URLs:
qBittorrent: http://your.ip.address:8080/
Radarr: http://your.ip.address:7878/
Sonarr: http://your.ip.address:8989/
Lidarr: http://your.ip.address:8686/
Readarr: http://your.ip.address:8787/
Prowlarr: http://your.ip.address:9696/
Bazarr: http://your.ip.address:6767/
jellyfin: http://your.ip.address:8096/
Portainer: http://your.ip.address:9000/


You might need to wait for a couple of minutes while everything gets up and running

All the services location are also saved in ~/yams_services.txt
========================================================

To configure YAMS, check the documentation at
https://yams.media/config

========================================================
```

And that's it!

In your browser, you can visit each of the sites to check that they are running correctly. If one of them doesn't show up, you might need to wait a couple of minutes for docker to finish the full installation.
