---
title: "Emby"
date: 2023-01-10T19:07:29-03:00
draft: false
weight: 8
summary: Emby brings together your personal videos, music, photos, and live television. Emby Server automatically converts and streams your personal media on the fly to play on any device.

---

# What is Emby?

From their [website](https://emby.media/about.html)

> Emby brings together your personal videos, music, photos, and live television. (...) Emby Server automatically converts and streams your personal media on the fly to play on any device.

On YAMS, Emby is one of the most important parts: Emby is going to be your "Netflix", "Hulu" or "Amazon Prime". This means you'll be able to stream your TV shows and movies to any device using Emby.

## Initial configuration

In your browser, go to [http://{your-ip-address}:8096/]() and you'll see Emby's setup page.

Choose your display language and click on "Next".

[![emby-1](/pics/emby-1.png)](/pics/emby-1.png)

Now, create your first user. When you are done, click on "Next".

[![emby-2](/pics/emby-2.png)](/pics/emby-2.png)

Next, on the "Setup Media Libraries" page, click on "New Library".

[![emby-3](/pics/emby-3.png)](/pics/emby-3.png)

### Setting the "TV Shows" library

On the "New Library" modal, select "TV shows" as your Content type and click on the big ➕ sign next to "Folders".

[![emby-4](/pics/emby-4.png)](/pics/emby-4.png)

In "Select Path", select the folder `/data/tvshows` and click on "Ok"

[![emby-5](/pics/emby-5.png)](/pics/emby-5.png)

**Note:** This is NOT on your filesystem! The `/data/tvshows/` folder exists inside the `docker` environment and maps to your server `/mediafolder/tv/` folder!


You should see your recently added folder in the "New Library" modal.

[![emby-6](/pics/emby-6.png)](/pics/emby-6.png)

Finally, set your metadata language to your favorite language. All the default settings that follow are fine, but you can change them if you want. 

Your "New Library" screen should look like this:

[![emby-7](/pics/emby-7.png)](/pics/emby-7.png)

If you are okay with the settings, click on "Ok". Your library should be added now!

[![emby-8](/pics/emby-8.png)](/pics/emby-8.png)


### Setting the "Movies" library

Open the "New Library modal" again.

On the "New Library" modal, select "Movies" as your Content type and click on the big ➕ sign next to "Folders".

[![emby-9](/pics/emby-9.png)](/pics/emby-9.png)

In "Select Path", select the folder `/data/movies` and click on "Ok"

[![emby-10](/pics/emby-10.png)](/pics/emby-10.png)

**Note:** This is NOT on your filesystem! The `/data/movies/` folder exists inside the `docker` environment and maps to your server `/mediafolder/movies/` folder!


You should see your recently added folder in the "New Library" modal.

[![emby-11](/pics/emby-11.png)](/pics/emby-11.png)

Finally, set your metadata language to your favorite language. All the default settings that follow are fine, but you can change them if you want. 

Your "New Library" screen should look like this:

[![emby-12](/pics/emby-12.png)](/pics/emby-12.png)

If you are okay with the settings, click on "Ok". Your library should be added now!

[![emby-13](/pics/emby-13.png)](/pics/emby-13.png)

To finish, click on the "Next" button.

[![emby-14](/pics/emby-14.png)](/pics/emby-14.png)

### Continuing the setup

On the "Preferred Metadata Language" page, you can choose the language and country of your metadata. Choose your preferred language and country and click "Next".

[![emby-15](/pics/emby-15.png)](/pics/emby-15.png)

Next, on the "Configure Remote Access" page, disable "Enable automatic port mapping" and click on "Next".

[![emby-16](/pics/emby-16.png)](/pics/emby-16.png)

Accept the terms of service and click on "Next".

[![emby-17](/pics/emby-17.png)](/pics/emby-17.png)

And you are finally done! Click on "Finish" to go to your Emby dashboard.
[![emby-18](/pics/emby-18.png)](/pics/emby-18.png)

### Logging in to Emby

On the "Please Sign In" screen, select your user and log in with the username/password you set in the [Initial configuration](#initial-configuration) step.

[![emby-19](/pics/emby-19.png)](/pics/emby-19.png)

[![emby-20](/pics/emby-20.png)](/pics/emby-20.png)

And there it is! Your Emby home page is up and running!

[![emby-21](/pics/emby-21.png)](/pics/emby-21.png)

## That's all!

YAMS is fully up and running! Now, let's add some content. Move on to [Running everything together](/config/running-everything-together).
