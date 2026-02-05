---
title: "Seeding With Qui"
date: 2025-11-14T15:34:20+11:00
draft: false
weight: 120
---


In general, it is good practice to seed any torrents you download. Seeding is the act of sharing a media file you have downloaded with other users, helping with their downloads.

Many private trackers also require maintenance of a 'ratio'. This ratio is calculating by the amount seeded over the amount downloaded, and must be maintained above a limit to ensure you are contributing to a tracker community.

> Check out [implemeting Autobrr](/advanced/autobrr) into YAMS to further help your seeding!

Within a default YAMS setup, [seeding is essentially not enabled](https://yams.media/config/qbittorrent/#is-this-a-dick-move) once you have downloaded the file. However, if you already have the file downloaded, you might as well seed it to others right?

This is a guide on how to automate a flexible seeding setup within your media server:
- Once movies and shows are downloaded, they will be automatically seeded whilst the media remains within your server
- When media is watched from your streaming platform, it is deleted from within Radarr and Sonarr
- These now 'loose' torrents are ensured to meet any minumum seeding requirements for your tracker, and then seamlessly deleted, freeing up your storage space!

But what is meant by a 'loose' torrent? Let's explore the concept of hardlinking.

# Hardlinking 🔗

Hardlinking is enabled in YAMS by default, **and required for this guide to work, with no exceptions.** To verify if hardlinking is enabled in your setup, ensure "Use Hardlinks instead of Copy" is enabled in Radarr's *Settings > Media Management (Show Advanced settings at the top left of the page) > Importing.*

## What is a Hardlink?

When you download a torrent, the file is downloaded into your YAMS torrent folder. Without hardlinking, when Radarr/Sonarr import this file, it would **copy** it to your server's media directory - meaning you'd have two copies taking up double the storage space.

A **hardlink** is different, and it's purpose is in the name: 'link'. Instead of copying the file, it creates a second reference to the same data on your disk. Think of there being two 'links' on your disk, one in your torrents folder and one in your media folder, both pointing to the same data on disk.

This allows the file to essentially exist in two places in your media server, all whilst only taking up the storage space of one copy.

## Why is this helpful?

With hardlinks enabled:
- qBitTorrent can continue seeding the torrent from the downloads folder
- Jellyfin/Plex can stream the same file from the library folder

Not only this, each 'link' has equal ownership over the data on disk. This means that data will persist on the disk until ALL references to it are deleted, regardless of their order of creation.

In this guide, the deletion flow will be setup like this:
- After download, each media file should have 2 hardlinks. One for qBitTorrent (the original one!), and one for Radarr/Sonarr.
- qBitTorrent's hardlink will be seeded indefinitely.
- After watching the media in Jellyfin/Plex, it will be deleted.
- Qui will detect the torrent file has no hardlink (only 1 reference to the file exits), and remove the torrent from qBitTorrent.


This allows maximum seeding whilst the media remains within your setup, but as soon as you are done watching, it cleans right up!

Lets get started into actually creating this setup.

# Creating the Stack

## Using a Deletion Tool
To set up this stack, a deletion tool should be used. This refers to any tool that deletes unwanted media from your Jellyfin/Plex libray.

I am using the Jellyfin plugin [Media Cleaner](https://github.com/shemanaev/jellyfin-plugin-media-cleaner) which deletes watched movies/shows in Jellyfin after a specified amount of time. If you are using Jellyfin, this is a good option that doesn't require running a seperate container.

If you wish to use another service, maybe to delete *unwatched media* too, please do. Do some research on the many Plex and Jellyfin tools available to clean up your libraries. Any tools that delete media will work, as long as they *don't mess with your torrents*.

## Setting up Qui 🛠️
[Qui](https://getqui.com/) is an extremely handy web UI for qBitTorrent, but it also has powerful automation features. We will be using its automation features to monitor our torrents, and delete them when they are no longer needed.

Be sure to refer to Qui's [documentation](https://getqui.com/docs/getting-started/installation) if you want to explore further!

### Docker Compose Entry

Add the following entry in your `docker-compose.custom.yml` file, below the `services:` parent item.
```yaml
  qui:
    image: ghcr.io/autobrr/qui:latest
    container_name: qui
    restart: unless-stopped
    ports:
      - "7476:7476"
    environment:
      - PUID=${PUID}
      - PGID=${PGID}
      - TZ=${TZ}
    volumes:
      - ${INSTALL_DIRECTORY}/config/qui:/config
      # optional, but required for filesystem-enabled features like hardlink detection
      - ${MEDIA_DIRECTORY}/downloads/torrents:/data/downloads/torrents
```

Then, run `yams start qui` in your terminal to get it up and running! Access the web UI at `http://your-server-ip:7476`.

---

## Connecting Qui to qBitTorrent 🔗

First, open up the Qui web UI, and create an new account. Make sure to save your login details!

>Now, before we get started, lets make qBitTorrent allow connections from Qui by ***optionally*** bypassing authentication within the YAMS network. Jump over the this section from the [YAMS docs](qbittorrent/#configuring-web-ui-settings) and ensure *in addition* to your local IP, you also add a new line with the YAMS subnet: `172.60.0.0/24`. Make sure to save, and then say goodbye to the qBitTorrent web UI - you might not need it again!

You should see a 'Dashboard' page. From here, click on the 'Add Instance' button in the center.

Enter the following details:
- A name for the instance, e.g. 'Server'
- Your qBitTorrent URL. If you are running qBitTorrent behind your vpn, its URL will be `http://gluetun:8081`. Otherwise, it will be `http://qbittorrent:8081`.
- Turn on 'Local Filesystem Access' - this is required for hardlink detection to work.
- If you added the YAMS subnet to qBitTorrent's web UI settings, you can turn off authentication by toggling 'Bypass Authentication'. If not, enter your qBitTorrent username and password.

[![qui-1](/pics/qui-1.png)](/pics/qui-1.png)

Then, hit 'Add Instance'! In the sidebar, you should now see your qBitTorrent instance listed. Click on it to connect, and you should see your torrents load up.

This is your main Qui interface, equivalent to the qBitTorrent web UI. Save this URL for later if you ever want quick access!

## Setting up Automations ⚙️

Now, navigate to the 'Automations' tab in the sidebar.

[![qui-2](/pics/qui-2.png)](/pics/qui-2.png)

Workflows in Qui have three main sections:
- **Trackers**: What trackers' torrents the automation will apply to
- **Conditions**: What conditions must be met for the automation to run
- **Actions**: What actions to perform when the conditions are met



*Thanks to [not-first](https://github.com/not-first) on Github for contributing to this guide!*
