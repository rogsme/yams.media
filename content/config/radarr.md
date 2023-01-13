---
title: "Radarr"
date: 2023-01-10T19:06:46-03:00
draft: false
weight: 4
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

### Indexers

Here, you'll add all the indexers you want to use to get your movies. This is where you'll tie in Radarr with [Jackett](/config/jackett).

In "Settings", go to "Indexers" and click on the ➕ button.

[![radarr-6](/pics/radarr-6.png)](/pics/radarr-6.png)

On the "Add Indexer" screen, click on "Torznab".

[![radarr-7](/pics/radarr-7.png)](/pics/radarr-7.png)

For this step, you'll need to go back to Jackett and click on the "Copy Torznab Feed" button of your desired indexer. Since on [Jackett](/config/jackett) I configured "YTS", I'll be grabbing its Torznab Feed link.

[![radarr-9](/pics/radarr-9.png)](/pics/radarr-9.png)

Then back at Radarr, add all the information to the "Add Indexer" screen. 

- On "Name", add the name of your indexer (in this case, "YTS").
- On "URL", paste the Torznab Feed URL for your indexer. Notice how I'm replacing [http://{your-ip-address}:9117]() with [http://jackett:9117](). This is so Radarr makes use of the internal docker network instead of the outside bridge. You should make this change too.
- On "API Key", paste your Jackett API key (Remember how I told you that [you'll need it later](/config/jackett/#dont-forget-to-grab-your-api-key)? Well, this is the moment hehe).

[![radarr-8](/pics/radarr-8.png)](/pics/radarr-8.png)

At the bottom, you can click on "Test" and if everything is OK you should see a ✅.

[![radarr-10](/pics/radarr-10.png)](/pics/radarr-10.png)
[![radarr-11](/pics/radarr-11.png)](/pics/radarr-11.png)

If everything is fine, click on "Save". You should see your indexer added to the "Indexers" page now!

[![radarr-12](/pics/radarr-12.png)](/pics/radarr-12.png)

#### How many indexers can I have?

As many as you want! Just repeat the steps to add new indexers in [Jackett](/config/jackett) and then follow this instructions again to add them to Radarr. The more indexers you have, the better!

### Download Clients

Here, you'll add the download clients for Radarr. That's where you'll tie in Radarr with [qBittorrent](/config/qbittorrent).

In "Settings", go to "Download Clients" and click on the ➕ button.

[![radarr-13](/pics/radarr-13.png)](/pics/radarr-13.png)

On the "Add Download Client" screen, scroll down and click on "qBittorrent".

[![radarr-14](/pics/radarr-14.png)](/pics/radarr-14.png)

- In Name, add the name of your download client (qBittorrent).
- On Host, add `qbittorrent`.
- On Username, add `admin`.
- On Password, add `adminadmin`.

[![radarr-15](/pics/radarr-15.png)](/pics/radarr-15.png)

At the bottom, you can click on "Test" and if everything is OK you should see a ✅ 
[![radarr-10](/pics/radarr-10.png)](/pics/radarr-10.png)
[![radarr-11](/pics/radarr-11.png)](/pics/radarr-11.png)

If everything is fine, click on "Save". You should see your download client added to the "Download Clients" page now!

[![radarr-16](/pics/radarr-16.png)](/pics/radarr-16.png)

### Checking if everything worked

To check If everything is working corrently, In "System" go to "Status". In "Health", you should see "No issues with configuration". If you don't see that message, go back in the tutorial and try to fix it!

[![radarr-17](/pics/radarr-17.png)](/pics/radarr-17.png)

## Moving forward!

Looking good! Now we can continue with [Sonarr](/config/sonarr).
