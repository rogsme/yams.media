---
title: "Jellyfin"
date: 2023-01-23T11:58:49-03:00
draft: false
weight: 7
summary: Jellyfin is the volunteer-built media solution that puts you in control of your media. Stream to any device from your own server, with no strings attached. Your media, your server, your way.
---

# What is Jellyfin?

From their [website](https://jellyfin.org/)

> Jellyfin is the volunteer-built media solution that puts you in control of your media. Stream to any device from your own server, with no strings attached. Your media, your server, your way.

On YAMS, Jellyfin is one of the most important parts: Jellyfin is going to be your "Netflix", "Hulu" or "Amazon Prime". This means you'll be able to stream your TV shows and movies to any device using Jellyfin. Best part: Is 100% open source!

## Initial configuration

In your browser, go to [http://{your-ip-address}:8096/]() and you'll see Jellyfin's setup page.

Choose your display language and click on "Next".

[![jellyfin-1](/pics/jellyfin-1.png)](/pics/jellyfin-1.png)

Now, create your first user. When you are done, click on "Next".

[![jellyfin-2](/pics/jellyfin-2.png)](/pics/jellyfin-2.png)

Next, on the "Setup Media Libraries" page, click on "New Library".

[![jellyfin-3](/pics/jellyfin-3.png)](/pics/jellyfin-3.png)

### Setting the "TV Shows" library

On the "New Library" modal, select "Shows" as your Content type and click on the big ➕ sign next to "Folders".

[![jellyfin-4](/pics/jellyfin-4.png)](/pics/jellyfin-4.png)

In "Select Path", select the folder `/data/tvshows` and click on "Ok"

[![jellyfin-5](/pics/jellyfin-5.png)](/pics/jellyfin-5.png)

**Note:** This is NOT on your filesystem! The `/data/tvshows/` folder exists inside the `docker` environment and maps to your server `/mediafolder/tv/` folder!


You should see your recently added folder in the "New Library" modal.

[![jellyfin-6](/pics/jellyfin-6.png)](/pics/jellyfin-6.png)

Finally, set your metadata language to your favorite language. All the default settings that follow are fine, but you can change them if you want. 

Your "New Library" screen should look like this:

[![jellyfin-7](/pics/jellyfin-7.png)](/pics/jellyfin-7.png)

If you are okay with the settings, click on "Ok". Your library should be added now!

[![jellyfin-8](/pics/jellyfin-8.png)](/pics/jellyfin-8.png)


### Setting the "Movies" library

Open the "New Library modal" again.

On the "New Library" modal, select "Movies" as your Content type and click on the big ➕ sign next to "Folders".

[![jellyfin-9](/pics/jellyfin-9.png)](/pics/jellyfin-9.png)

In "Select Path", select the folder `/data/movies` and click on "Ok"

[![jellyfin-10](/pics/jellyfin-10.png)](/pics/jellyfin-10.png)

**Note:** This is NOT on your filesystem! The `/data/movies/` folder exists inside the `docker` environment and maps to your server `/mediafolder/movies/` folder!


You should see your recently added folder in the "New Library" modal.

[![jellyfin-11](/pics/jellyfin-11.png)](/pics/jellyfin-11.png)

Finally, set your metadata language to your favorite language. All the default settings that follow are fine, but you can change them if you want. 

Your "New Library" screen should look like this:

[![jellyfin-12](/pics/jellyfin-12.png)](/pics/jellyfin-12.png)

If you are okay with the settings, click on "Ok". Your library should be added now!

[![jellyfin-13](/pics/jellyfin-13.png)](/pics/jellyfin-13.png)

To finish, click on the "Next" button.

[![jellyfin-14](/pics/jellyfin-14.png)](/pics/jellyfin-14.png)

### Continuing the setup

On the "Preferred Metadata Language" page, you can choose the language and country of your metadata. Choose your preferred language and country and click "Next".

[![jellyfin-15](/pics/jellyfin-15.png)](/pics/jellyfin-15.png)

Next, on the "Set up Remote Access" page, disable "Allow remote connections to this server" and click on "Next".

[![jellyfin-16](/pics/jellyfin-16.png)](/pics/jellyfin-16.png)

And you are finally done! Click on "Finish" to go to your Jellyfin dashboard.
[![jellyfin-17](/pics/jellyfin-17.png)](/pics/jellyfin-17.png)

### Logging in to Jellyfin

On the "Please Sign In" screen, log in with the username/password you set in the [Initial configuration](#initial-configuration) step.

[![jellyfin-18](/pics/jellyfin-18.png)](/pics/jellyfin-18.png)

And there it is! Your Jellyfin home page is up and running!

[![jellyfin-19](/pics/jellyfin-19.png)](/pics/jellyfin-19.png)

## That's all!

YAMS is fully up and running! Now, let's add some content. Move on to [Running everything together](/config/running-everything-together).
