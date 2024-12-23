---
title: "Running everything together"
date: 2023-01-12T18:06:44-03:00
draft: false
weight: 10
summary: So you finally got YAMS running? Let's add some movies and seeing everything working together!
---

## First, I want to congratulate you 🎉

You did it! You installed and configured YAMS! Give yourself a good pat on your back 🙇🏻

[![party](/pics/party.gif)](/pics/party.gif)

Now comes the fun part: Adding your shows/movies and seeing everything working together 😎

## Radarr & Sonarr

These instructions will apply to both Radarr and Sonarr. To keep the tutorial brief, I will only test Radarr.

Open Radarr at [http://{your-ip-address}:7878/]() and on the left menu click on "Add New". In this tutorial I'll use "The Godfather", but you can search for the movie you want!

My recommendation is that you go for a famous movie first, just to confirm everything is working as expected.

[![running-everything-together-1](/pics/running-everything-together-1.png)](/pics/running-everything-together-1.png)

Click on the movie you want to download.

[![running-everything-together-2](/pics/running-everything-together-2.png)](/pics/running-everything-together-2.png)

On the modal, select the quality you want the movie to be downloaded. If your movie is part of a collection, you can choose to download the entire collection in the "Monitor" box. For this case, I want to download the entire Godfather collection, so I'll choose that on the modal.

Finally, click on "Add Movie"

[![running-everything-together-3](/pics/running-everything-together-3.png)](/pics/running-everything-together-3.png)

Now, if you go back to "Movies", you'll see the movie(s) you added.

[![running-everything-together-4](/pics/running-everything-together-4.png)](/pics/running-everything-together-4.png)

If you go to "Activity", you'll see their download status.

[![running-everything-together-5](/pics/running-everything-together-5.png)](/pics/running-everything-together-5.png)

## qBittorrent

If you open qBittorrent in [http://{your-ip-address}:8081/](), you'll see your movie(s) downloading!

This means it is working as expected. When they finish downloading, Radarr is going to pick them up and put them in the right folder.

[![running-everything-together-6](/pics/running-everything-together-6.png)](/pics/running-everything-together-6.png)

## Media service

After your movies have downloaded, if you go to your Media service (Jellyfin, Emby or Plex), you'll see your movies right there, waiting for you.

Jellyfin:

[![running-everything-together-12](/pics/running-everything-together-12.png)](/pics/running-everything-together-12.png)

Emby:

[![running-everything-together-7](/pics/running-everything-together-7.png)](/pics/running-everything-together-7.png)

Plex:

[![running-everything-together-11](/pics/running-everything-together-11.png)](/pics/running-everything-together-11.png)

If you open the movie, you'll see it even has subtitles! This means [Bazarr](/config/bazarr) is working as well!

[![running-everything-together-8](/pics/running-everything-together-8.png)](/pics/running-everything-together-8.png)

[![running-everything-together-9](/pics/running-everything-together-9.png)](/pics/running-everything-together-9.png)

You can play the movie right from your browser, with subtitles included:
[![running-everything-together-10](/pics/running-everything-together-10.png)](/pics/running-everything-together-10.png)

## Your filesystem

If you visit your `/mediafolder/movies` folder, you can check how Radarr is managing your library.

```sh
roger@debian:/srv/media/movies$ tree .
.
├── The Godfather (1972)
│   ├── The Godfather (1972).en.srt
│   ├── The Godfather (1972).es.srt
│   └── The Godfather (1972).mp4
├── The Godfather Part II (1974)
│   ├── The Godfather Part II (1974).en.srt
│   ├── The Godfather Part II (1974).es.srt
│   └── The Godfather Part II (1974).mp4
└── The Godfather Part III (1990)
    ├── The Godfather Part III (1990).en.srt
    ├── The Godfather Part III (1990).es.srt
    └── The Godfather Part III (1990).mp4

3 directories, 9 files
```

If you don't like the way the folders/movies are named, you can always change it on [Radarr's media management page](/config/radarr#media-management). The same applies to [Sonarr](/config/sonarr#media-management).

# Final step and conclusions

You should have your first media server up and running now! That's a big step forward in dropping your dependency on big services like Netflix or Amazon Prime.

There are still A LOT of things you can do to make your experience even better! You can go to the [Recommendations](/config/recommendations) page now and finish the tutorial.

 🙌 Thank you for being here and for following the tutorial! Enjoy the fruit of your labor. You are awesome! 😎
