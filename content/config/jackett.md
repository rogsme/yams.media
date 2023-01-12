---
title: "Jackett"
date: 2023-01-10T18:02:06-03:00
draft: false
weight: 1
summary: Jackett works as a proxy server. It translates queries from apps (Sonarr, Radarr, SickRage, CouchPotato, Mylar3, Lidarr, DuckieTV, qBittorrent, Nefarious etc.) into tracker-site-specific http queries, parses the html or json response, and then sends results back to the requesting software. This allows for getting recent uploads (like RSS) and performing searches. Jackett is a single repository of maintained indexer scraping & translation logic - removing the burden from other apps.
---

## What is Jackett?

From their [Github repo](https://github.com/Jackett/Jackett):

> Jackett works as a proxy server: it translates queries from apps (Sonarr, Radarr, SickRage, CouchPotato, Mylar3, Lidarr, DuckieTV, qBittorrent, Nefarious etc.) into tracker-site-specific http queries, parses the html or json response, and then sends results back to the requesting software. This allows for getting recent uploads (like RSS) and performing searches. Jackett is a single repository of maintained indexer scraping & translation logic - removing the burden from other apps.

So basically, we are going to use Jackett to **search for torrents**, so we can add them to [qBittorrent](/config/qbittorrent) later on.

## Initial configuration

In your browser, go to [http://{your-ip-address}:9117/]() and you'll see the empty Jackett screen.

[![jackett-1](/pics/jackett-1.png)](/pics/jackett-1.png)

Here, you can add as many indexers as you need. To add indexers, click on "Add indexer":

[![jackett-2](/pics/jackett-2.png)](/pics/jackett-2.png)

For this example, I'm going to add 2 indexers: YTS (for movies) and eztv (for tv shows). To look for an indexer, just type its name on the search box and click on the big ➕ sign 

[![jackett-3](/pics/jackett-3.png)](/pics/jackett-3.png)

In the end, you should have a screen like this:

[![jackett-4](/pics/jackett-4.png)](/pics/jackett-4.png)

## Don't forget to grab your API Key!

You'll need the API Key later. You can grab it from here:

[![jackett-5](/pics/jackett-5.png)](/pics/jackett-5.png)

For now, just keep it handy. You'll need it for [Sonarr](/config/sonarr) and [Radarr](/config/radarr).

## Move forward

Now you can move with the configuration. [qBittorrent](/config/qbittorrent) is next!
