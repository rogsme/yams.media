---
title: "Jellyfin"
date: 2023-01-23T11:58:49-03:00
draft: false
weight: 7
summary: Jellyfin is the volunteer-built media solution that puts you in control of your media. Stream to any device from your own server, with no strings attached. Your media, your server, your way.
---

# What is Jellyfin?

From their [website](https://jellyfin.org/):

> Jellyfin is the volunteer-built media solution that puts you in control of your media. Stream to any device from your own server, with no strings attached. Your media, your server, your way.

In YAMS, Jellyfin is going to be your personal Netflix! 🍿 It's 100% open source and lets you stream your TV shows and movies to any device. Best part? No monthly fees! 

## Initial configuration

In your browser, go to [http://{your-ip-address}:8096/]() and you'll see Jellyfin's setup page.

First things first - pick your display language and click "Next".

[![jellyfin-1](/pics/jellyfin-1.png)](/pics/jellyfin-1.png)

Time to create your first user! This will be your admin account, so make it secure. When you're done, click "Next".

[![jellyfin-2](/pics/jellyfin-2.png)](/pics/jellyfin-2.png)

Now we're at the "Setup Media Libraries" page. Click on "New Library" - let's tell Jellyfin where to find all your media! 📚

[![jellyfin-3](/pics/jellyfin-3.png)](/pics/jellyfin-3.png)

### Setting up your TV Shows library

On the "New Library" modal, pick "Shows" as your Content type and click the big ➕ sign next to "Folders".

[![jellyfin-4](/pics/jellyfin-4.png)](/pics/jellyfin-4.png)

In "Select Path", choose the `/data/tvshows` folder and click "Ok"

[![jellyfin-5](/pics/jellyfin-5.png)](/pics/jellyfin-5.png)

**Magic Container Note:** 🎩 The `/data/tvshows/` folder isn't actually on your filesystem - it's a special path inside the docker environment that maps to your server's `/mediafolder/tv/` folder!

You should see your new folder all ready to go in the modal:

[![jellyfin-6](/pics/jellyfin-6.png)](/pics/jellyfin-6.png)

Now set your preferred metadata language. The other default settings are fine, but feel free to tweak them if you want to get fancy!

Your setup should look something like this:

[![jellyfin-7](/pics/jellyfin-7.png)](/pics/jellyfin-7.png)

Happy with the settings? Click "Ok". Your TV Shows library is now added! 📺

[![jellyfin-8](/pics/jellyfin-8.png)](/pics/jellyfin-8.png)

### Setting up your Movies library

Time for round two! Click that "New Library" button again.

This time, pick "Movies" as your Content type and click the ➕ next to "Folders".

[![jellyfin-9](/pics/jellyfin-9.png)](/pics/jellyfin-9.png)

Choose the `/data/movies` folder and click "Ok"

[![jellyfin-10](/pics/jellyfin-10.png)](/pics/jellyfin-10.png)

**More Container Magic:** 🎩✨ Just like before, `/data/movies/` is a special docker path that maps to your server's `/mediafolder/movies/` folder!

You should see your movies folder ready to go:

[![jellyfin-11](/pics/jellyfin-11.png)](/pics/jellyfin-11.png)

Set your preferred metadata language again. Default settings are still your friend here!

Your setup should look like this:

[![jellyfin-12](/pics/jellyfin-12.png)](/pics/jellyfin-12.png)

Looking good? Click "Ok". Your Movies library is now added! 🎬

[![jellyfin-13](/pics/jellyfin-13.png)](/pics/jellyfin-13.png)

Time to move forward - click that "Next" button!

[![jellyfin-14](/pics/jellyfin-14.png)](/pics/jellyfin-14.png)

### Final Setup Steps

On the "Preferred Metadata Language" page, pick your favorite language and country. Then click "Next".

[![jellyfin-15](/pics/jellyfin-15.png)](/pics/jellyfin-15.png)

For the "Set up Remote Access" page, let's keep things simple - disable "Allow remote connections to this server" and click "Next".

[![jellyfin-16](/pics/jellyfin-16.png)](/pics/jellyfin-16.png)

You're done! Click "Finish" to head to your shiny new Jellyfin dashboard. 🎉
[![jellyfin-17](/pics/jellyfin-17.png)](/pics/jellyfin-17.png)

### Logging in to Jellyfin

Time to test drive your new setup! On the login screen, use the username and password you created earlier.

[![jellyfin-18](/pics/jellyfin-18.png)](/pics/jellyfin-18.png)

And there it is! Your very own streaming service homepage! 🌟

[![jellyfin-19](/pics/jellyfin-19.png)](/pics/jellyfin-19.png)

## That's all folks! 🎬

YAMS is now fully up and running! Ready to add some content? Move on to [Running everything together](/config/running-everything-together) to see how all these pieces work together!
