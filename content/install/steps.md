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

- **An installation location:** The script is going to ask you for a install location, but it will default to `/opt/yams`. Just make sure your current user has permissions to write on the selected directory.
- **A media folder:** This is the folder where all your files are going to be downloaded and categorized. For example, if you choose `/srv/media`, the script is going to create the following folders:
  + `/srv/media/tv`: For your TV shows.
  + `/srv/media/movies`: For your movies.
  + `/srv/media/downloads`: For your torrent downloads.
  + `/srv/media/blackhole`: For your torrents blackhole.
- **A regular user to run and own the media files:** You shouldn’t use `root` for this user, but I’m not your father, nothing is going to stop you lol

## To install

### Setup your install location (location is optional, you can choose any other location)

The location `/opt/yams` is **recommended**, but you can use whatever you like if your current user has permissions on the directory.

```bash
sudo mkdir -p /opt/yams 
sudo chown -R $USER:$USER /opt/yams
```

### Cloning from Gitlab
```bash
git clone https://gitlab.com/rogs/yams.git
cd yams
```

### Installing YAMS
```bash
./install.sh
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
Please, input your media folder:
```

My suggestion is to use something like `/srv/media`, but you _might_ want to use an external hard drive or a different partition on your machine. Just type the full path of the directory you want to use and press `[ENTER]` to continue. If it doesn't exist, the script is going to try to create it.

```bash
Are you sure your media folder is /srv/media? [y/N]:
```

Select `y` or `n` if you are happy with the folder you selected. Press `[ENTER]` to continue.

```bash
Copying /opt/yams/docker-compose.yaml...
Everything installed correctly! 🎉
...

...

...
```

If you get a `docker` permission error, go [here](/faqs/) to fix it.

After a lot of docker installing, you'll get a message like this at the end:

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
Everythins should be running now! To check everything running, go to:

Jackett: http://192.168.0.169:9117/
qBittorrent: http://192.168.0.169:8080/
Radarr: http://192.168.0.169:7878/
Sonarr: http://192.168.0.169:8989/
Bazarr: http://192.168.0.169:6767/
Emby: http://192.168.0.169:8096/


You might need to wait for a couple of minutes while everything gets up and running

All the services location are also saved in ~/yams_services.txt
========================================================

To configure YAMS, check the documentation at
https://yams.media/config

========================================================
```

And that's it!

In your browser, you can visit each of the sites to check that they are running correctly. If one of them don't show up, you might need to wait a couple of minutes for docker to finish the full installation.
