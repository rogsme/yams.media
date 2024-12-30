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

In YAMS, Sonarr is your TV show manager - it's going to handle everything from downloads to organizing your episodes. Think of it as your personal TV assistant! 📺

## Initial configuration

In your browser, go to [http://{your-ip-address}:8989/](). Just like with Radarr, we'll start with some basic security settings.

- Select "Forms (Login Page)" as the "Authentication Method"
- In "Authentication Required" select "Disabled for Local Addresses" (so you can browse freely on your home network)

Create your username and password, then click save:

[![sonarr-18](/pics/sonarr-18.png)](/pics/sonarr-18.png)

You'll see Sonarr's empty page. Don't mind those 3 system messages - we'll get to them later! 

[![sonarr-1](/pics/sonarr-1.png)](/pics/sonarr-1.png)

### Media management

Let's tell Sonarr how to handle our TV shows! Go to "Settings" and then "Media management". Here's what we need to do: 
- Click on "Show Advanced" (it sounds scary but we'll keep it simple!)
- Check the "Rename Episodes" box
- Set up these naming formats:
  - "Standard Episode Format": `{Series Title} - S{season:00}E{episode:00} - {Episode Title}`
  - "Daily Episode Format": `{Series Title} - {Air-Date} - {Episode Title}`
  - "Anime Episode Format": `{Series Title} - S{season:00}E{episode:00} - {Episode Title}`
  - "Series Folder Format": `{Series TitleYear}`

[![sonarr-2](/pics/sonarr-2.png)](/pics/sonarr-2.png)

Scroll down to "Root Folders" and click on "Add Root Folder".

[![sonarr-3](/pics/sonarr-3.png)](/pics/sonarr-3.png)

Add the `/data/tvshows/` folder:

[![sonarr-4](/pics/sonarr-4.png)](/pics/sonarr-4.png)

**Note:** Just like with Radarr, this path is inside the docker environment - it maps to your server's `/mediafolder/media/tvshows/` folder. Docker magic at work! ✨

Finally, click on "Save Changes".

[![sonarr-5](/pics/sonarr-5.png)](/pics/sonarr-5.png)

### Download Clients

Time to connect Sonarr to our download tools! We'll link up with [qBittorrent](/config/qbittorrent) and [SABnzbd](/config/sabnzbd).

#### qBittorrent Setup

In "Settings", go to "Download Clients" and click on the ➕ button.

[![sonarr-13](/pics/sonarr-13.png)](/pics/sonarr-13.png)

Find and click on "qBittorrent" in the list.

[![sonarr-14](/pics/sonarr-14.png)](/pics/sonarr-14.png)

Fill in these details:
- Name: qBittorrent (or whatever clever name you come up with!)
- Host: your server IP address (like `192.168.0.190`)
- Port: 8081
- Username: `admin`
- Password: your qBittorrent password

[![sonarr-15](/pics/sonarr-15.png)](/pics/sonarr-15.png)

Hit that "Test" button - if everything's working, you'll see a happy green checkmark! ✅ 
[![sonarr-10](/pics/sonarr-10.png)](/pics/sonarr-10.png)
[![sonarr-11](/pics/sonarr-11.png)](/pics/sonarr-11.png)

All good? Click "Save". Your download client should now appear on the page:

[![sonarr-16](/pics/sonarr-16.png)](/pics/sonarr-16.png)

#### SABnzbd Setup

Back in "Download Clients", click that ➕ button again.

[![sonarr-13](/pics/sonarr-13.png)](/pics/sonarr-13.png)

This time, let's find and click on "SABnzbd".

[![sonarr-19](/pics/sonarr-19.png)](/pics/sonarr-19.png)

Fill in these details:
- Name: SABnzbd (or something fun)
- Host: your server IP address (like `192.168.0.190`)
- Port: 8080
- API Key: your SABnzbd API key

Need to find your SABnzbd API key? No problem! Check here: [Getting your API key for Sonarr and Radarr](/config/sabnzbd/#getting-your-api-key-for-sonarr-and-radarr)

[![sonarr-20](/pics/sonarr-20.png)](/pics/sonarr-20.png)

Another test time! Click "Test" - hopefully another green checkmark! ✅ 
[![sonarr-10](/pics/sonarr-10.png)](/pics/sonarr-10.png)
[![sonarr-11](/pics/sonarr-11.png)](/pics/sonarr-11.png)

If the test passed, hit "Save". You should now see both download clients ready to go:

[![sonarr-21](/pics/sonarr-21.png)](/pics/sonarr-21.png)

## Moving forward! 🚀

That's it! Now we can move on to [Prowlarr](/config/prowlarr). We're getting close to having your own personal streaming service! 

## Want to become a Sonarr power user?

If you want to really dive into what Sonarr can do, check out the [TRaSH Guide for Sonarr](https://trash-guides.info/Sonarr/). They've got some amazing advanced tips and tricks! 🔧
