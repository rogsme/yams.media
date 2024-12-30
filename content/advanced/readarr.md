---
title: "Readarr"
date: 2023-01-31T13:52:34-03:00
draft: false
weight: 9
summary: Readarr is a ebook collection manager for Usenet and BitTorrent users. It can monitor multiple RSS feeds for new books from your favorite authors and will interface with clients and indexers to grab, sort, and rename them.

---

# What is Readarr?

From their [wiki](https://readarr.com/):

> Readarr is a ebook collection manager for Usenet and BitTorrent users. It can monitor multiple RSS feeds for new books from your favorite authors and will interface with clients and indexers to grab, sort, and rename them.

In YAMS, Readarr is going to manage all our books: download, sort, etc.

## Initial configuration

In your browser, go to [http://{your-ip-address}:8787/]() and you'll see Readarr's empty page. You'll also notice you have 3 messages on the system tab, but we'll deal with them later.

[![readarr-1](/pics/readarr-1.png)](/pics/readarr-1.png)

### Media management

First, go to "Settings" and then "Media management". On this screen, click on the big ➕ sign.

[![readarr-2](/pics/readarr-2.png)](/pics/readarr-2.png)

On the "Add root folder" modal, add the following information:

- On "Name", set it to "Books"
- On "Path", set it to "/books/"

Finally, click on "Save".

[![readarr-3](/pics/readarr-3.png)](/pics/readarr-3.png)

You should see your new "Books" root folder.

[![readarr-4](/pics/readarr-4.png)](/pics/readarr-4.png)

### Download Clients

Here, you'll add the download clients for Readarr. That's where you'll tie in Readarr with [qBittorrent](/config/qbittorrent).

In "Settings", go to "Download Clients" and click on the ➕ button.

[![readarr-5](/pics/readarr-5.png)](/pics/readarr-5.png)

On the "Add Download Client" screen, scroll down and click on "qBittorrent".

[![readarr-6](/pics/readarr-6.png)](/pics/readarr-6.png)

- In Name, add the name of your download client (qBittorrent).
- On Host, add your server IP address (in my case, `192.168.0.169`).
- On Username, add `admin`.
- On Password, add `adminadmin`.

[![readarr-7](/pics/readarr-7.png)](/pics/readarr-7.png)

At the bottom, you can click on "Test" and if everything is OK you should see a ✅ 
[![radarr-10](/pics/radarr-10.png)](/pics/radarr-10.png)
[![radarr-11](/pics/radarr-11.png)](/pics/radarr-11.png)

If everything is fine, click on "Save". You should see your download client added to the "Download Clients" page now!

[![readarr-8](/pics/readarr-8.png)](/pics/readarr-8.png)

### Prowlarr config

First, you are going to need your Readarr API Key.

You can get your Readarr API Key in Readarr. Go to [http://{your-ip-address}:8787/settings/general]() to open Readarr's settings, and you'll find the API Key under the "Security" section.

[![readarr-9](/pics/readarr-9.png)](/pics/readarr-9.png)

For now, just copy it and keep it in a safe location.

In "Settings", go to "Apps" and click on the ➕ button.

[![readarr-10](/pics/readarr-10.png)](/pics/readarr-10.png)

On the "Add Application" modal, click on "Readarr"

[![readarr-11](/pics/readarr-11.png)](/pics/readarr-11.png)

- In "Prowlarr Server", add `http://prowlarr:9696`
- In "Readarr Server", add `http://readarr:8787`
- In "ApiKey", add your Readarr API key.

[![readarr-12](/pics/readarr-12.png)](/pics/readarr-12.png)

At the bottom, you can click on "Test" and if everything is OK you should see a ✅ 
[![sonarr-10](/pics/sonarr-10.png)](/pics/sonarr-10.png)
[![sonarr-11](/pics/sonarr-11.png)](/pics/sonarr-11.png)

To finish, click on "Save". You should see Readarr added to the "Apps" list!

[![readarr-13](/pics/readarr-13.png)](/pics/readarr-13.png)

**Remeber to add Books indexers!**. You won't be able to download if you don't add Books indexers in Prowlarr. To add indexers, go to [Prowlarr's Indexer configuration](/config/prowlarr/#indexers).

## Usage

Back in Readarr, go to "Library/Add New" and search for an author. Select it to add it to Readarr.

[![readarr-14](/pics/readarr-14.png)](/pics/readarr-14.png)

On the "Add new Author" modal, click on "Start search for missing books" anf finally, click on "Add".

[![readarr-15](/pics/readarr-15.png)](/pics/readarr-15.png)

And that should be it! You should see your author added and it will start downloading soon.

[![readarr-16](/pics/readarr-16.png)](/pics/readarr-16.png)
