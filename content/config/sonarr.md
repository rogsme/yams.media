---
title: "Sonarr"
date: 2023-01-10T19:06:43-03:00
draft: false
weight: 4
summary: Sonarr is a PVR for Usenet and BitTorrent users. It can monitor multiple RSS feeds for new episodes of your favorite shows and will grab, sort, and rename them. It can also be configured to automatically upgrade the quality of files already downloaded when a better quality format becomes available.
---

# What is Sonarr?

From their [wiki](https://wiki.servarr.com/sonarr):

> Sonarr is a PVR for Usenet and BitTorrent users. It can monitor multiple RSS feeds for new episodes of your favorite shows and will grab, sort and rename them. It can also be configured to automatically upgrade the quality of files already downloaded when a better quality format becomes available.

In YAMS, Sonarr is going to manage all our TV Shows, download them, sort them, etc.

## Initial configuration

In your browser, go to [http://{your-ip-address}:8989/]() and you'll see Sonarr's empty page. You'll also notice you have 3 messages on the system tab, but we'll deal with them later.

[![sonarr-1](/pics/sonarr-1.png)](/pics/sonarr-1.png)

### Media management

First, go to "Settings" and then "Media management". On this screen: 
- Click on "Show Advanced".
- Check the "Rename Episodes" box.
- Change "Standard Episode Format" to `{Series Title} - S{season:00}E{episode:00} - {Episode Title}`
- Change "Daily Episode Format" to `{Series Title} - {Air-Date} - {Episode Title}`
- Change "Anime Episode Format" to `{Series Title} - S{season:00}E{episode:00} - {Episode Title}`
- Change "Series Folder Format" to `{Series TitleYear}`
[![sonarr-2](/pics/sonarr-2.png)](/pics/sonarr-2.png)

At the bottom of the same screen, go to "Root folders" and click on "Add Root Folder".

[![sonarr-3](/pics/sonarr-3.png)](/pics/sonarr-3.png)

And add the `/tv/` folder

[![sonarr-4](/pics/sonarr-4.png)](/pics/sonarr-4.png)

**Note:** This is NOT on your filesystem! The `/tv/` folder exists inside the `docker` environment and maps to your server `/mediafolder/tv/` folder!

Finally, click on "Save Changes".

[![sonarr-5](/pics/sonarr-5.png)](/pics/sonarr-5.png)

### Download Clients

Here, you'll add the download clients for Sonarr. That's where you'll tie in Sonarr with [qBittorrent](/config/qbittorrent).

In "Settings", go to "Download Clients" and click on the ➕ button.

[![sonarr-13](/pics/sonarr-13.png)](/pics/sonarr-13.png)

On the "Add Download Client" screen, click on "qBittorrent".

[![sonarr-14](/pics/sonarr-14.png)](/pics/sonarr-14.png)

- In Name, add the name of your download client (qBittorrent).
- On Host, add your server IP address (in my case, `192.168.0.169`).
- On Username, add `admin`.
- On Password, add `adminadmin`.

[![sonarr-15](/pics/sonarr-15.png)](/pics/sonarr-15.png)

At the bottom, you can click on "Test" and if everything is OK you should see a ✅ 
[![sonarr-10](/pics/sonarr-10.png)](/pics/sonarr-10.png)
[![sonarr-11](/pics/sonarr-11.png)](/pics/sonarr-11.png)

If everything is fine, click on "Save". You should see your download client added to the "Download Clients" page now!

[![sonarr-16](/pics/sonarr-16.png)](/pics/sonarr-16.png)

## Moving forward!

That's it! Now we can continue with [Prowlarr](/config/prowlarr).

## Do you want a more in depth configuration?

If you want a more in depth configuration, I recommend you check the [TRaSH Guide for Sonarr](https://trash-guides.info/Sonarr/).
