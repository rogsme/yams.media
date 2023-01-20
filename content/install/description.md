---
title: "What is YAMS?"
date: 2023-01-10T15:23:19-03:00
draft: false
weight: 1
summary: A brief summary on what YAMS is and its features
---

YAMS is a **highly opinionated** media server.

With YAMS you'll be able to automate your media gathering, organization, and consumption.

## First, why?

In 2019 I wanted a setup that my non-technical girlfriend could use without any problems, so I started designing my media server using multiple open source projects and running them on top of docker.

Fast forward two years and I would like to say it works very well 😎 And most importantly, I accomplished my goal: My girlfriend uses it regularly and I've even added my mom, who lives 5000 kms from me.

My friends wanted to have a media server like mine, but it was always hard to explain everything that was involved in building and connecting all the pieces together.

So basically, my friends pushed me to build this script and documentation, so they (and now anyone!) could build it on their own home servers.

## Features

In no particular order:

- **Automatic shows/movies download:** Just add your shows and movies to the watch list and it should automatically download the files as soon as they are available.
- **Automatic classification and organization:** Your media files should be completely organized by default.
- **Automatic subtitles download:** Self-explanatory. Your media server should automatically download subtitles in the languages you choose if they are available.
- **Support for Web, Android, iOS, Android TV, and whatever that can support Emby:** Since we are using Emby, you should be able to watch your favorite media almost anywhere.


## What's installed with YAMS?

- [qBittorrent](https://www.qbittorrent.org/)
- [Radarr](https://radarr.video/)
- [Sonarr](https://sonarr.tv/)
- [Prowlarr](https://github.com/Prowlarr/Prowlarr)
- [Bazarr](https://www.bazarr.media/)
- [Emby](https://emby.media/)
- [gluetun](https://github.com/qdm12/gluetun)

With this combination, you can create a fully functional media server that is going to download, categorize, subtitle, and serve your favorite shows and movies.

