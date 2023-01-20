---
title: "Prowlarr"
date: 2023-01-10T18:02:06-03:00
draft: false
weight: 5
summary: Prowlarr is an indexer manager/proxy built on the popular *arr .net/reactjs base stack to integrate with your various PVR apps. Prowlarr supports management of both Torrent Trackers and Usenet Indexers. It integrates seamlessly with Lidarr, Mylar3, Radarr, Readarr, and Sonarr offering complete management of your indexers with no per app Indexer setup required (we do it all).
---

## What is Prowlarr?

From their [Github repo](https://github.com/Prowlarr/Prowlarr/):

> Prowlarr is an indexer manager/proxy built on the popular *arr .net/reactjs base stack to integrate with your various PVR apps. Prowlarr supports management of both Torrent Trackers and Usenet Indexers. It integrates seamlessly with Lidarr, Mylar3, Radarr, Readarr, and Sonarr offering complete management of your indexers with no per app Indexer setup required (we do it all).

So basically, we are going to use Prowlarr to **search for torrents**, so we can add them to [qBittorrent](/config/qbittorrent) later on.

## Initial configuration

In your browser, go to [http://{your-ip-address}:9696/]() and you'll see the "Authentication required" screen. For now, set it to "Basic" and enter a username and password for Prowlarr

[![prowlarr-1](/pics/prowlarr-1.png)](/pics/prowlarr-1.png)

### Indexers

On the homepage, click on "Add Nex Indexer"

[![prowlarr-2](/pics/prowlarr-2.png)](/pics/prowlarr-2.png)

Now, select your indexers. For the purposes of this tutorial I'll add 2: YTS (for movies) and eztv (for tv shows).

Look for your indexer and click on it

[![prowlarr-3](/pics/prowlarr-3.png)](/pics/prowlarr-3.png)

You'll get a new modal now, called "Add Indexer - Cardigann (your indexer)". On this screen, just choose a URL from the "Base Url" list.

[![prowlarr-4](/pics/prowlarr-4.png)](/pics/prowlarr-4.png)

At the bottom, you can click on "Test" and if everything is OK you should see a ✅ 
[![sonarr-10](/pics/sonarr-10.png)](/pics/sonarr-10.png)
[![sonarr-11](/pics/sonarr-11.png)](/pics/sonarr-11.png)

If everything is fine, click on "Save", and you'll be back at the "Add Indexer" modal.

You can now add more indexers. Add as many as you like!

#### How many indexers can I have?
As many as you want! Just repeat the steps to add new indexers in Prowlarr. The more indexers you have, the better!

When you finish, close the "Add Indexer" modal and you'll see all your indexers on the main page

[![prowlarr-5](/pics/prowlarr-5.png)](/pics/prowlarr-5.png)

### Connecting to Radarr and Sonarr

Now comes the fun part: Connecting Prowlarr to Radarr and Sonarr!

#### Radarr 

First, you are going to need your Radarr API Key.

You can get your Radarr API Key in Radarr. Go to [http://{your-ip-address}:7878/settings/general]() to open Radarr's settings, and you'll find the API Key under the "Security" section.

[![bazarr-17](/pics/bazarr-17.png)](/pics/bazarr-17.png)

For now, just copy it and keep it in a safe location.

In "Settings", go to "Apps" and click on the ➕ button.

[![prowlarr-6](/pics/prowlarr-6.png)](/pics/prowlarr-6.png)

On the "Add Application" modal, click on "Radarr"

[![prowlarr-7](/pics/prowlarr-7.png)](/pics/prowlarr-7.png)

- In "Prowlarr Server", add `http://prowlarr:9696`
- In "Radarr Server", add `http://radarr:7878`
- In "ApiKey", add your Radarr API key.

[![prowlarr-8](/pics/prowlarr-8.png)](/pics/prowlarr-8.png)

At the bottom, you can click on "Test" and if everything is OK you should see a ✅ 
[![sonarr-10](/pics/sonarr-10.png)](/pics/sonarr-10.png)
[![sonarr-11](/pics/sonarr-11.png)](/pics/sonarr-11.png)

To finish, click on "Save". You should see Radarr added to the "Apps" list!

[![prowlarr-9](/pics/prowlarr-9.png)](/pics/prowlarr-9.png)

#### Sonarr 

First, you are going to need your Sonarr API Key.

You can get your Sonarr API Key in Sonarr. Go to [http://{your-ip-address}:8989/settings/general]() to open Sonarr's settings, and you'll find the API Key under the "Security" section.

[![bazarr-14](/pics/bazarr-14.png)](/pics/bazarr-14.png)

For now, just copy it and keep it in a safe location.

In "Settings", go to "Apps" and click on the ➕ button.

[![prowlarr-10](/pics/prowlarr-10.png)](/pics/prowlarr-10.png)

On the "Add Application" modal, click on "Sonarr"

[![prowlarr-11](/pics/prowlarr-11.png)](/pics/prowlarr-11.png)

- In "Prowlarr Server", add `http://prowlarr:9696`
- In "Sonarr Server", add `http://sonarr:8989`
- In "ApiKey", add your Sonarr API key.

[![prowlarr-12](/pics/prowlarr-12.png)](/pics/prowlarr-12.png)

At the bottom, you can click on "Test" and if everything is OK you should see a ✅ 
[![sonarr-10](/pics/sonarr-10.png)](/pics/sonarr-10.png)
[![sonarr-11](/pics/sonarr-11.png)](/pics/sonarr-11.png)

To finish, click on "Save". You should see Radarr added to the "Apps" list!

[![prowlarr-13](/pics/prowlarr-13.png)](/pics/prowlarr-13.png)

Finally, click on "Sync App Indexers"

[![prowlarr-14](/pics/prowlarr-14.png)](/pics/prowlarr-14.png)

Now, if you go back to Sonarr and Radarr, and check their "Indexer" settings, you'll see your indexers added magically!

[![prowlarr-15](/pics/prowlarr-15.png)](/pics/prowlarr-15.png)
[![prowlarr-16](/pics/prowlarr-16.png)](/pics/prowlarr-16.png)

## Move forward

Now you can move with the configuration. [Bazarr](/config/bazarr) is next!
