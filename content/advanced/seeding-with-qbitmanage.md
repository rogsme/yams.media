---
title: "Seeding With Qbitmanage"
date: 2025-11-14T15:34:20+11:00
draft: false
weight: 110
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
- Jellyfin/Plex can stream the same media from the library folder

Not only this, each 'link' has equal ownership over the data on disk. This means that data will persist on the disk until ALL references to it are deleted, regardless of their order of creation.

In this guide, the deletion flow will be setup like this:
- After download, each media file should have 2 hardlinks. One for qBitTorrent (the original one!), and one for Radarr/Sonarr.
- qBitTorrent's hardlink will be seeded indefintely.
- After watching the media in Jellyfin/Plex, it will be deleted.
- qBitManage will detect the torrent file has no hardlink (only 1 reference to the file exits), and remove the torrent from qBitManage.


This allows maximum seeding whilst the media remains within your setup, but as soon as you are done watching, it cleans right up!

Lets get started into actually creating this setup.

# Creating the Stack

## Using a Deletion Tool
To set up this stack, a deletion tool should be used. This refers to any tool that deletes unwanted media from your Jellyfin/Plex libray.

I am using the Jellyfin plugin [Media Cleaner](https://github.com/shemanaev/jellyfin-plugin-media-cleaner) which deletes watched movies/shows in Jellyfin after a specified amount of time. If you are using Jellyfin, this is a good option that doesn't require running a seperate container.

If you wish to use another service, maybe to delete *unwatched media* too, please do. Do some research on the many Plex and Jellyfin tools available to clean up your libraries. Any tools that delete media will work, but be careful that they don't mess with your torrents.

## Setting up qBitManage 🛠️
[qBitManage](https://github.com/StuffAnThings/qbit_manage) is an extremely handy tool for creating all kinds of workflows relating to torrents within qBitTorrent.

The power of this app is a double edged sword. It can help you to amazingly automate your media server just how you like, but keep in mind that, if misconfigured, it has the ability to delete downloads and manipulate torrents. Expect to invest some time into learning its decently complicated configuration before reaching your desired state. This guide should assist in avoiding lots of this complication, but is not a direct replacement for learning how the tool works.

### Docker Compose Entry
> This `docker-compose.custom.yml` entry is configured for this guide. If you have other wishes, see [how to set the container up with the defaults](/advanced/add-your-own-containers/#qbitmanage-) ready to be configured for your exact needs.

Add the following entry in your `docker-compose.custom.yml` file, below the `services:` parent item.
```yaml
  qbitmanage:
    container_name: qbitmanage
    image: ghcr.io/stuffanthings/qbit_manage
    volumes:
      - ${MEDIA_DIRECTORY}:/data # give qBitManage access to our torrents
      - ${INSTALL_DIRECTORY}/config/qbitmanage:/config # mount our config file (we will create next) into the container
    environment:
      - QBIT_USER=${QBIT_USER} # allow qBitManage to communicate with qBitTorrent's API
      - QBIT_PASS=${QBIT_PASS}

      - QBT_WEB_SERVER=false # disable the web UI and API. We can manage this with just a config file!
      - QBT_CONFIG_DIR=/config # Ensure qBitManage can find our mounted config file

      # Scheduler Configuration
      - QBT_SCHEDULE=180 # run the process every 180 minutes
      - QBT_STARTUP_DELAY=15 # wait 15 seconds after startup before running, to ensure qBitTorrent is up as well!s

      # Command Flags (this that will happen when run)
      - QBT_TAG_NOHARDLINKS=true # tag files without hardlinks
      - QBT_SHARE_LIMITS=true # apply share limits to files without hardlinks
      - QBT_DRY_RUN=true # don't apply any changes to files (yet)
```
Now, add two new environment variables into your YAMS `.env` file:
- `QBIT_USER=your_qbittorrent_username`
- `QBIT_PASS=your_qbittorrent_password`

### Understanding the Concepts 🤔

**Before starting the application up**, read through the comments in the compose entry to get a brief idea of what each options does. Feel free to keep them there for future references, or delete them if you think you understand.

Let's dive a bit deeper into some concepts:
- A 'tag' is simply a label within qBitTorrent that gets placed on a torrent. qBitManage will use this to label torrents without a hardlink.

- qBitManage is a a container that will always be running, but will only execute a 'run' when configured (once every 180 minutes). A 'run' is where all configured commands will carry out action.
- A 'command' is something that will cause a change from your torrents. For example, by enabling the `QBIT_TAG_NOHARDLINKS` command, we are asking qBitManage to apply the `noHL` tag to all torrents without hardlinks, during a run execution.
- A 'share limit' is a set of seeding requirements connected to a tag (in this case, the `noHL` tag). This will make more sense later, but this is how we enable checks to make sure the torrent has seeded enough, and its eventual deletion.

Ok, great! Let's get configuring

### The qBitManage Config File

Enter your YAMS install directory, inside your `/config` folder. Create a new folder called `qbitmanage` and inside that a `config.yml` file.

Let create this config file bit by bit, examining what each section does. Each section should be pasted into your config file, with each heading at the very base indentation level.

###### 1. First lets ensure qBitManage can connect with our qBitTorrent instance.
```yml
qbt:
  host: http://gluetun:8081
  user: !ENV QBIT_USER
  pass: !ENV QBIT_PASS
```

Since the container will be running in the same network as the rest of YAMS, we can use port 8081 of gluetun to reference qBitTorrent (remember, its behind a VPN)! *Adjust this if it is different for your setup.*

###### 2. Now, lets show qBitManage our YAMS direcory structure, so it can know where torrents are located
```yml
directory:
  root_dir: /data/downloads/torrents

  recycle_bin: /data/downloads/torrents/.RecycleBin
  torrents_dir:
```

The root directory is the main directory where are torrents are located. `torrents_dir` has been left blank, as they are all the root directory!

The `.RecycleBin` doesn't exist yet, but don't worry. That will be a folder created in the future by qBitManage as it deletes your torrents.

###### 3. We have categories inside qBitTorrent already for `radarr` and `sonarr`. Let's add those too.
```yml
cat:
  radarr: /data/downloads/torrents
  sonarr: /data/downloads/torrents
```

Since each category stores torrents in the same root folder, we will set each of the categories' value to the same root directory.

###### 4. Everybody is using different torrent trackers/indexers. We will have to add those, but it will differ a bit between us.

Reference [the documentation](https://github.com/StuffAnThings/qbit_manage/wiki/Config-Setup#tracker) on how to create this section with your trackers.

Here is an example setup for using the tracker TorrentLeech. Any tracker URLS that have the word 'leech' in them are grouped into the `TorrentLeech` tag.
```yml
tracker:
  leech:
    tag: TorrentLeech
```

This functionality isn't actually used in this guide, but it required for qBitManage to function and can greatly assist in more specific tweaking in the future, so make sure to set it up right!

###### 5. Enabling no hardlink tagging.
```yml
nohardlinks:
  radarr:
  sonarr:
```

Although this config sections looks weird because no keys have any values, don't worry! It is telling qBitManage to check for torrents that aren't hardlinked with the `radarr` and `sonarr` tag. In our setup, this covers all our media, and avoids interefering with anything else.

###### 6. Creating a share limit.
```yml
share_limits:
  noHL:
    priority: 1
    include_all_tags:
      - noHL

    max_seeding_time: 8d
    min_last_active: 30m
    cleanup: true

    add_group_to_tag: false
```

This is where all the action happens. Let's learn about what this section is doing. Be sure to reference [the documentation](https://github.com/StuffAnThings/qbit_manage/wiki/Config-Setup#share_limits) if you are unsure or interested in a slightly different setup.

- By using the `noHL` key and adding it as an included tag, we define our share limit to apply only torrents that have the `noHL` tag. And, the only torrents that have this tag will be torrents with no hardlinks, meaning their Radarr/Sonarr hardlink has been deleted.

- `max_seeding_time` should be set to the MINUMUM amount of time your tracker requires you to seed for. Yes, the MINIMUM amount of time required. I have it set to 8d, to allow a bit of leeway with my tracker's 1 week requirement. The naming is a bit confusing, but think about it like this: this is the *maximum* cap of the seeding time range that should be kept, meaning any unhardlinked torrents that go over this maximum value should be deleted. If your tracker has no requirement, this can be removed.

- `min_last_active` is set to 30 minutes, and ensure that any torrents that are ready to be deleted but still active won't be deleted yet. If a torrent has been seeding within the last 30 minutes it will be ignored to allow you to seed just a bit more!

- `cleanup` is set to true. This will delete any torrents that fit the share limit's conditions.

- `add_group_to_tag` simply doesn't apply a qBitTorrent tag to torrents in this share limit, as we don't need it.

###### 7. And finally, the recycle bin!
```yml
recyclebin:
  enabled: true
  empty_after_x_days: 7
  save_torrents: false
  split_by_category: false
```

With this enabled any torrents qBitManage deletes will actually just be moved into a `.RecycleBin` folder, and only truly deleted 7 after it has spent 7 days in here. This allows you to restore it if required.

And that's qBitTorrent setup!!

### Running qBitManage

Lets start up the qBitManage container with `yams start qbitmanage`. Observe the logs on startup.

It should wait 15 seconds, and then go through the process of 'Tagging Torrents with No Hardlinks' and then 'Updating Share Limits for [Group noHL] [Priority 1]' before finally 'Emptying Recycle Bin (Files > 7 days)'.

Remember, we set `QBT_DRY_RUN=true` in our environment variables meaning **qBitManage will not actually touch our torrent files at all.** In this stage, you should simply observe the logs and ensure everything is working well.

For example, pick a torrent you know has no hardlinks. Verify in the qBitManage logs that it corectly idenfied this, and then intended to apply the `noHL` tag. Then, apply the `noHL` tag manually to the torrent via qBitTorrent's web interface. Restart qBitManage again, and observe the logs to ensure it would take expected action.

Once this is done, set `QBT_DRY_RUN=false` in your docker compose. After a restart, qBitManage has the power to modify your torrents, and is fully setup.

---

Good job! You have finished the setup. Now, media will be deleted from your library via the tool you setup earlier. Loose torrents will be tagged by qBitManage, and then deleted!

Seeding time will be maximised across all of your media, and loose media will never be unknowingly taking up your storage.

Be sure to keep checking in on your system every so often to ensure it is working as expected!