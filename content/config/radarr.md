---
title: "Radarr"
date: 2023-01-10T19:06:46-03:00
draft: false
weight: 3
summary: Radarr is a movie collection manager for Usenet and BitTorrent users. It can monitor multiple RSS feeds for new movies and will interface with clients and indexers to grab, sort, and rename them. It can also be configured to automatically upgrade the quality of existing files in the library when a better quality format becomes available.
---

# What is Radarr?

From their [wiki](https://wiki.servarr.com/radarr):

> Radarr is a movie collection manager for Usenet and BitTorrent users. It can monitor multiple RSS feeds for new movies and will interface with clients and indexers to grab, sort, and rename them. It can also be configured to automatically upgrade the quality of existing files in the library when a better quality format becomes available.

In YAMS, Radarr is going to manage all our movies, download them, sort them, etc.

## Initial configuration

In your browser, go to [http://{your-ip-address}:7878/]() and you'll see Radarr's empty page. You'll also notice you have 3 messages on the system tab, but we'll deal with them later.

[![radarr-1](/pics/radarr-1.png)](/pics/radarr-1.png)

### Media management

First, go to "Settings" and then "Media management". On this screen: 
- Click on "Show Advanced".
- Check the "Rename Movies" box.
- Change "Standard Movie Format" to `{Movie Title} ({Release Year})`.

[![radarr-2](/pics/radarr-2.png)](/pics/radarr-2.png)

At the bottom of the same screen, go to "Root folders" and click on "Add Root Folder".

[![radarr-3](/pics/radarr-3.png)](/pics/radarr-3.png)

And add the `/movies/` folder

[![radarr-4](/pics/radarr-4.png)](/pics/radarr-4.png)

**Note:** This is NOT on your filesystem! The `/movies/` folder exists inside the `docker` environment and maps to your server `/mediafolder/movies/` folder!

Finally, click on "Save Changes".

[![radarr-5](/pics/radarr-5.png)](/pics/radarr-5.png)

### Download Clients

Here, you'll add the download clients for Radarr. That's where you'll tie in Radarr with [qBittorrent](/config/qbittorrent).

In "Settings", go to "Download Clients" and click on the ➕ button.

[![radarr-13](/pics/radarr-13.png)](/pics/radarr-13.png)

On the "Add Download Client" screen, scroll down and click on "qBittorrent".

[![radarr-14](/pics/radarr-14.png)](/pics/radarr-14.png)

- In Name, add the name of your download client (qBittorrent).
- On Host, add your server IP address (in my case, `192.168.0.169`).
- On Username, add `admin`.
- On Password, add `adminadmin`.

[![radarr-15](/pics/radarr-15.png)](/pics/radarr-15.png)

At the bottom, you can click on "Test" and if everything is OK you should see a ✅ 
[![radarr-10](/pics/radarr-10.png)](/pics/radarr-10.png)
[![radarr-11](/pics/radarr-11.png)](/pics/radarr-11.png)

If everything is fine, click on "Save". You should see your download client added to the "Download Clients" page now!

[![radarr-16](/pics/radarr-16.png)](/pics/radarr-16.png)

## Moving forward!

Looking good! Now we can continue with [Sonarr](/config/sonarr).
