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

In YAMS, Radarr is going to manage all our movies: download them, sort them, and keep everything organized. It's like having your own personal movie butler! 🎬

## Initial configuration

In your browser, go to [http://{your-ip-address}:7878/](). First up, we need to set up some basic security.

- Select "Forms (Login Page)" as the "Authentication Method"
- In "Authentication Required" select "Disabled for Local Addresses" (this way you won't need to login when you're at home)

Fill in your username and password, then click on save:

[![radarr-18](/pics/radarr-18.png)](/pics/radarr-18.png)

You'll see Radarr's empty page. Don't worry about those 3 messages in the system tab - we'll deal with them soon!

[![radarr-1](/pics/radarr-1.png)](/pics/radarr-1.png)

### Media management

First things first - let's tell Radarr how to handle our movies. Go to "Settings" and then "Media management". On this screen:
- Click on "Show Advanced" (don't worry, we'll keep it simple!)
- Check the "Rename Movies" box
- Change "Standard Movie Format" to `{Movie Title} ({Release Year})`

[![radarr-2](/pics/radarr-2.png)](/pics/radarr-2.png)

At the bottom of the same screen, go to "Root folders" and click on "Add Root Folder".

[![radarr-3](/pics/radarr-3.png)](/pics/radarr-3.png)

Now add the `/data/movies/` folder:

[![radarr-4](/pics/radarr-4.png)](/pics/radarr-4.png)

**Note:** This isn't actually on your filesystem! The `/data/movies/` folder exists inside the docker environment and maps to your server's `/mediafolder/media/movies/` folder. Magic! ✨

Finally, click on "Save Changes".

[![radarr-5](/pics/radarr-5.png)](/pics/radarr-5.png)

### Download Clients

Time to connect Radarr to our download tools! This is where we'll link up with [qBittorrent](/config/qbittorrent) and [SABnzbd](/config/sabnzbd).

#### qBittorrent Setup

In "Settings", go to "Download Clients" and click on the ➕ button.

[![radarr-13](/pics/radarr-13.png)](/pics/radarr-13.png)

On the "Add Download Client" screen, scroll down and click on "qBittorrent".

[![radarr-14](/pics/radarr-14.png)](/pics/radarr-14.png)

Fill in these details:
- Name: qBittorrent (or whatever you want to call it!)
- Host: your server IP address (like `192.168.0.190`)
- Port: 8081
- Username: `admin`
- Password: your qBittorrent password

[![radarr-15](/pics/radarr-15.png)](/pics/radarr-15.png)

Click that "Test" button at the bottom - if everything's good, you'll see a nice green checkmark! ✅
[![radarr-10](/pics/radarr-10.png)](/pics/radarr-10.png)
[![radarr-11](/pics/radarr-11.png)](/pics/radarr-11.png)

If the test passed, click "Save". Your download client should now show up on the page:

[![radarr-16](/pics/radarr-16.png)](/pics/radarr-16.png)

#### SABnzbd Setup

Back in "Download Clients", click that ➕ button again.

[![radarr-13](/pics/radarr-13.png)](/pics/radarr-13.png)

This time, scroll down and pick "SABnzbd".

[![radarr-19](/pics/radarr-19.png)](/pics/radarr-19.png)

Fill in these details:
- Name: SABnzbd (or any name you like)
- Host: your server IP address (like `192.168.0.190`)
- Port: 8080
- API Key: your SABnzbd API key

Don't have your SABnzbd API key handy? No worries! You can find it here: [Getting your API key for Sonarr and Radarr](/config/sabnzbd/#getting-your-api-key-for-sonarr-and-radarr)

[![radarr-20](/pics/radarr-20.png)](/pics/radarr-20.png)

Time for another test! Click that "Test" button - hopefully you'll see another green checkmark! ✅
[![radarr-10](/pics/radarr-10.png)](/pics/radarr-10.png)
[![radarr-11](/pics/radarr-11.png)](/pics/radarr-11.png)

If the test worked, hit "Save". You should now see both download clients on the page:

[![radarr-21](/pics/radarr-21.png)](/pics/radarr-21.png)

## Moving forward! 🚀

Looking good! Now we can continue with [Sonarr](/config/sonarr). We're getting closer to having your own personal Netflix!

## Want to get really fancy?

If you want to dive deeper into Radarr's configuration, I highly recommend checking out the [TRaSH Guide for Radarr](https://trash-guides.info/Radarr/). They've got some really cool advanced settings in there! 🔧
