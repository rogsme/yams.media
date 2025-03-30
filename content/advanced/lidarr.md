---
title: "Lidarr"
date: 2023-01-31T11:20:14-03:00
draft: false
weight: 100
summary: Lidarr is a music collection manager for Usenet and BitTorrent users. It can monitor multiple RSS feeds for new albums from your favorite artists and will interface with clients and indexers to grab, sort, and rename them. It can also be configured to automatically upgrade the quality of existing files in the library when a better quality format becomes available.

---

# What is Lidarr?

From their [wiki](https://lidarr.audio/):

> Lidarr is a music collection manager for Usenet and BitTorrent users. It can monitor multiple RSS feeds for new albums from your favorite artists and will interface with clients and indexers to grab, sort, and rename them. It can also be configured to automatically upgrade the quality of existing files in the library when a better quality format becomes available.

In YAMS, Lidarr is going to manage all our music: download, sort, etc.

## Initial configuration

In your browser, go to [http://{your-ip-address}:8686/]() and you'll see Lidarr's empty page. You'll also notice you have 3 messages on the system tab, but we'll deal with them later.

[![lidarr-1](/pics/lidarr-1.png)](/pics/lidarr-1.png)

### Media management

First, go to "Settings" and then "Media management". On this screen, click on the big ➕ sign.

[![lidarr-2](/pics/lidarr-2.png)](/pics/lidarr-2.png)

On the "Add root folder" modal, add the following information:

- On "Name", set it to "Music"
- On "Path", set it to "/music/"

Finally, click on "Save".

[![lidarr-3](/pics/lidarr-3.png)](/pics/lidarr-3.png)

You should see your new "Music" root folder.

[![lidarr-4](/pics/lidarr-4.png)](/pics/lidarr-4.png)

### Download Clients

Here, you'll add the download clients for Lidarr. That's where you'll tie in Lidarr with [qBittorrent](/config/qbittorrent).

In "Settings", go to "Download Clients" and click on the ➕ button.

[![lidarr-5](/pics/lidarr-5.png)](/pics/lidarr-5.png)

On the "Add Download Client" screen, scroll down and click on "qBittorrent".

[![lidarr-6](/pics/lidarr-6.png)](/pics/lidarr-6.png)

- In Name, add the name of your download client (qBittorrent).
- On Host, add your server IP address (in my case, `192.168.0.169`).
- On Username, add `admin`.
- On Password, add `adminadmin`.

[![lidarr-7](/pics/lidarr-7.png)](/pics/lidarr-7.png)

At the bottom, you can click on "Test" and if everything is OK you should see a ✅ 
[![radarr-10](/pics/radarr-10.png)](/pics/radarr-10.png)
[![radarr-11](/pics/radarr-11.png)](/pics/radarr-11.png)

If everything is fine, click on "Save". You should see your download client added to the "Download Clients" page now!

[![lidarr-8](/pics/lidarr-8.png)](/pics/lidarr-8.png)

### Prowlarr config

First, you are going to need your Lidarr API Key.

You can get your Lidarr API Key in Lidarr. Go to [http://{your-ip-address}:8686/settings/general]() to open Lidarr's settings, and you'll find the API Key under the "Security" section.

[![lidarr-11](/pics/lidarr-11.png)](/pics/lidarr-11.png)

For now, just copy it and keep it in a safe location.

In "Settings", go to "Apps" and click on the ➕ button.

[![lidarr-9](/pics/lidarr-9.png)](/pics/lidarr-9.png)

On the "Add Application" modal, click on "Lidarr"

[![lidarr-10](/pics/lidarr-10.png)](/pics/lidarr-10.png)

- In "Prowlarr Server", add `http://prowlarr:9696`
- In "Lidarr Server", add `http://lidarr:8686`
- In "ApiKey", add your Lidarr API key.

[![lidarr-12](/pics/lidarr-12.png)](/pics/lidarr-12.png)

At the bottom, you can click on "Test" and if everything is OK you should see a ✅ 
[![sonarr-10](/pics/sonarr-10.png)](/pics/sonarr-10.png)
[![sonarr-11](/pics/sonarr-11.png)](/pics/sonarr-11.png)

To finish, click on "Save". You should see Lidarr added to the "Apps" list!

[![lidarr-13](/pics/lidarr-13.png)](/pics/lidarr-13.png)

**Remeber to add Music indexers!**. You won't be able to download if you don't add Music indexers in Prowlarr. To add indexers, go to [Prowlarr's Indexer configuration](/config/prowlarr/#indexers).

## Usage

Back in Lidarr, go to "Library/Add New" and search for a band. Select it to add it to Lidarr.

[![lidarr-14](/pics/lidarr-14.png)](/pics/lidarr-14.png)

On the "Add new Artist" modal, select the Quality Profile, click on "Start search for missing albums" anf finally, click on "Add".

[![lidarr-15](/pics/lidarr-15.png)](/pics/lidarr-15.png)

And that should be it! You should see your band added and it will start downloading soon.

[![lidarr-16](/pics/lidarr-16.png)](/pics/lidarr-16.png)
