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

So basically, we're going to use Prowlarr to **search for torrents**, and then it will pass those on to [qBittorrent](/config/qbittorrent) or [SABnzbd](/config/sabnzbd) to download. Think of it as your personal search engine! 🔍

## Initial configuration

In your browser, go to [http://{your-ip-address}:9696/]() and you'll see the "Authentication required" screen. Let's set up some basic security:
- Select "Forms (Login Page)" as the "Authentication Method"
- In "Authentication Required" select "Disabled for Local Addresses" (so you can browse freely on your home network)

[![prowlarr-1](/pics/prowlarr-1.png)](/pics/prowlarr-1.png)

### Understanding Indexers

Before we dive in, let's talk about the two types of indexers you can use with Prowlarr:

#### Usenet Indexers 📰
Most good Usenet indexers are paid services, but they're usually pretty affordable and worth checking out! A couple of popular ones are:
- [DrunkenSlug](https://drunkenslug.com) (invite only!)
- [NZBGeek](https://nzbgeek.info)

Remember, if you want to use Usenet indexers, you'll also need a Usenet provider configured in [SABnzbd](/config/sabnzbd)!

#### Torrent Indexers 🧲
For this tutorial, we'll focus on free torrent indexers since they're easier to get started with. Just remember to always use a VPN when torrenting!

### Adding Indexers

On the homepage, click on "Add Next Indexer" - time to teach Prowlarr where to look for content!

[![prowlarr-2](/pics/prowlarr-2.png)](/pics/prowlarr-2.png)

For this tutorial, I'll add two popular indexers: YTS (great for movies) and eztv (perfect for TV shows). But you can add whatever indexers you like! 

Find your indexer and click on it:

[![prowlarr-3](/pics/prowlarr-3.png)](/pics/prowlarr-3.png)

You'll see a new modal called "Add Indexer - Cardigann (your indexer)". All you need to do here is pick a URL from the "Base Url" list. Easy peasy! 

[![prowlarr-4](/pics/prowlarr-4.png)](/pics/prowlarr-4.png)

Hit that "Test" button at the bottom - if everything's working, you'll see a happy green checkmark! ✅ 
[![sonarr-10](/pics/sonarr-10.png)](/pics/sonarr-10.png)
[![sonarr-11](/pics/sonarr-11.png)](/pics/sonarr-11.png)

Looking good? Click "Save" and you'll be back at the "Add Indexer" modal.

#### How many indexers should I add? 🤔

As many as you want! Just repeat those steps for each new indexer in Prowlarr. The more indexers you have, the better chance of finding what you're looking for! It's like having more libraries to check for books. 📚

When you're done adding indexers, close the modal and you'll see all your indexers on the main page:

[![prowlarr-5](/pics/prowlarr-5.png)](/pics/prowlarr-5.png)

### Connecting to Radarr and Sonarr

Now comes the fun part - connecting Prowlarr to Radarr and Sonarr! This is where everything starts working together. ✨

#### Radarr Connection

First, we need your Radarr API Key. Head over to Radarr's settings at [http://{your-ip-address}:7878/settings/general]() and look for the API Key under "Security".

[![bazarr-17](/pics/bazarr-17.png)](/pics/bazarr-17.png)

Copy that API key and keep it handy!

In Prowlarr, go to "Settings", click "Apps" and hit the ➕ button.

[![prowlarr-6](/pics/prowlarr-6.png)](/pics/prowlarr-6.png)

Click on "Radarr":

[![prowlarr-7](/pics/prowlarr-7.png)](/pics/prowlarr-7.png)

Fill in these details:
- Prowlarr Server: `http://prowlarr:9696`
- Radarr Server: `http://radarr:7878`
- API Key: paste your Radarr API key here

[![prowlarr-8](/pics/prowlarr-8.png)](/pics/prowlarr-8.png)

Test time! Click that "Test" button - hopefully you'll see a green checkmark! ✅ 
[![sonarr-10](/pics/sonarr-10.png)](/pics/sonarr-10.png)
[![sonarr-11](/pics/sonarr-11.png)](/pics/sonarr-11.png)

If the test passed, click "Save". You should see Radarr in your Apps list:

[![prowlarr-9](/pics/prowlarr-9.png)](/pics/prowlarr-9.png)

#### Sonarr Connection

Time for Sonarr! First, grab your Sonarr API Key from [http://{your-ip-address}:8989/settings/general]() - it's under "Security" just like in Radarr.

[![bazarr-14](/pics/bazarr-14.png)](/pics/bazarr-14.png)

Copy that API key for safekeeping!

Back in Prowlarr, go to "Settings", "Apps" and click that ➕ button again.

[![prowlarr-10](/pics/prowlarr-10.png)](/pics/prowlarr-10.png)

This time click on "Sonarr":

[![prowlarr-11](/pics/prowlarr-11.png)](/pics/prowlarr-11.png)

Fill in these details:
- Prowlarr Server: `http://prowlarr:9696`
- Sonarr Server: `http://sonarr:8989`
- API Key: paste your Sonarr API key here

[![prowlarr-12](/pics/prowlarr-12.png)](/pics/prowlarr-12.png)

One more test! Click "Test" - green checkmark time! ✅ 
[![sonarr-10](/pics/sonarr-10.png)](/pics/sonarr-10.png)
[![sonarr-11](/pics/sonarr-11.png)](/pics/sonarr-11.png)

All good? Hit "Save". You should now see both Radarr and Sonarr in your Apps list:

[![prowlarr-13](/pics/prowlarr-13.png)](/pics/prowlarr-13.png)

Finally, click on "Sync App Indexers" - this is where the magic happens! 🎩

[![prowlarr-14](/pics/prowlarr-14.png)](/pics/prowlarr-14.png)

Want to see something cool? Go check Sonarr and Radarr's "Indexer" settings - your indexers have been automatically added! No copy-pasting needed! 

[![prowlarr-15](/pics/prowlarr-15.png)](/pics/prowlarr-15.png)

[![prowlarr-16](/pics/prowlarr-16.png)](/pics/prowlarr-16.png)

## Moving forward! 🚀

Now we can move on to [Bazarr](/config/bazarr) - it's going to handle all your subtitle needs! 

## Want to become a Prowlarr pro?

If you want to really dive into what Prowlarr can do, check out the [TRaSH Guide for Prowlarr](https://trash-guides.info/Prowlarr/). They've got some amazing tips for power users! 🔧
