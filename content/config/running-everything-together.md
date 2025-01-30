---
title: "Running everything together"
date: 2023-01-12T18:06:44-03:00
draft: false
weight: 10
summary: So you finally got YAMS running? Let's add some movies and see everything working together!
---

## First, I want to congratulate you 🎉

You did it! You installed and configured YAMS! Give yourself a good pat on the back - you've earned it! 🙇‍♂️

[![party](/pics/party.gif)](/pics/party.gif)

Now comes the fun part: Adding your shows/movies and watching everything work together like a well-oiled machine! 😎

## Radarr & Sonarr

These instructions work for both Radarr and Sonarr. To keep things simple, I'll show you with Radarr, but the process is super similar for TV shows!

Open Radarr at [http://{your-ip-address}:7878/]() and click on "Add New" in the left menu. For this demo, I'll use "The Godfather" (because it's a classic!), but you can search for any movie you want.

Pro tip: For your first test, pick something popular - it'll be easier to find! 

[![running-everything-together-1](/pics/running-everything-together-1.png)](/pics/running-everything-together-1.png)

Click on the movie you want to download:

[![running-everything-together-2](/pics/running-everything-together-2.png)](/pics/running-everything-together-2.png)

Now you can pick your quality preferences. If your movie is part of a collection (like The Godfather is), you can choose to download the whole series in the "Monitor" box. I'm going for the whole trilogy because, well, why not? 

Finally, click "Add Movie"!

[![running-everything-together-3](/pics/running-everything-together-3.png)](/pics/running-everything-together-3.png)

Head back to "Movies" and you'll see your selections:

[![running-everything-together-4](/pics/running-everything-together-4.png)](/pics/running-everything-together-4.png)

Click on "Activity" to watch the magic happen - you can see everything downloading in real-time! 🪄

[![running-everything-together-5](/pics/running-everything-together-5.png)](/pics/running-everything-together-5.png)

## qBittorrent

Want to see what's going on under the hood? Open qBittorrent at [http://{your-ip-address}:8081/]() and you'll see your movies downloading!

This means everything is working perfectly! When downloads finish, Radarr will automatically organize them into the right folders.

[![running-everything-together-6](/pics/running-everything-together-6.png)](/pics/running-everything-together-6.png)

## Media service

After your downloads finish, head over to your media service and... ta-da! 🎉 Your movies are right there waiting for you!

Jellyfin:
[![running-everything-together-12](/pics/running-everything-together-12.png)](/pics/running-everything-together-12.png)

Emby:
[![running-everything-together-7](/pics/running-everything-together-7.png)](/pics/running-everything-together-7.png)

Plex:
[![running-everything-together-11](/pics/running-everything-together-11.png)](/pics/running-everything-together-11.png)

Open up a movie and look - subtitles are already there! That's [Bazarr](/config/bazarr) doing its thing! 🎯

[![running-everything-together-8](/pics/running-everything-together-8.png)](/pics/running-everything-together-8.png)

[![running-everything-together-9](/pics/running-everything-together-9.png)](/pics/running-everything-together-9.png)

You can even start watching right from your browser, with subtitles and everything:
[![running-everything-together-10](/pics/running-everything-together-10.png)](/pics/running-everything-together-10.png)

## Your filesystem

Curious about how everything's organized? Check out your `/mediafolder/media/movies` folder:

```sh
roger@debian:/srv/media/movies$ tree .
.
├── The Godfather (1972)
│   ├── The Godfather (1972).en.srt
│   ├── The Godfather (1972).es.srt
│   └── The Godfather (1972).mp4
├── The Godfather Part II (1974)
│   ├── The Godfather Part II (1974).en.srt
│   ├── The Godfather Part II (1974).es.srt
│   └── The Godfather Part II (1974).mp4
└── The Godfather Part III (1990)
    ├── The Godfather Part III (1990).en.srt
    ├── The Godfather Part III (1990).es.srt
    └── The Godfather Part III (1990).mp4

3 directories, 9 files
```

Not a fan of how things are named? No problem! You can always change the naming format in [Radarr's media management page](/config/radarr#media-management) or [Sonarr's settings](/config/sonarr#media-management).

# Final step and conclusions

You did it! 🎉 You've got your very own media server up and running! That's a huge step toward breaking free from subscription services like Netflix or Amazon Prime.

And guess what? There's still so much more you can do to make your setup even better! Head over to the [Recommendations](/config/recommendations) page for some cool ideas on what to try next.

 🙌 Thanks for following along with the tutorial! Hope you enjoy your awesome new media server - you've earned it! 😎
