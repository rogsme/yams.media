---
title: "Bazarr"
date: 2023-01-10T19:06:54-03:00
draft: false
weight: 6
summary: Bazarr is a companion application to Sonarr and Radarr that manages and downloads subtitles based on your requirements.
---

# What is Bazarr?

From their [website](https://www.bazarr.media/):

> Bazarr is a companion application to Sonarr and Radarr that manages and downloads subtitles based on your requirements.

In YAMS, Bazarr is going to download subtitles on any language you choose, sort them and put them in the correct location for Emby to grab.

## Initial Configuration

In your browser, go to [http://{your-ip-address}:6767/]() and you'll see Bazarr's settings page.

[![bazarr-1](/pics/bazarr-1.png)](/pics/bazarr-1.png)

You don't have to change anything on this screen.

### Languages

On the left side menu, click on "Languages".

On the "Languages" page, go to the "Languages Filter" box and select the languages you want to use. For this tutorial, I will choose `English`, `Spanish` and `Latin American Spanish`.

When you have chosen your languages, click on "Add New Profile"

[![bazarr-2](/pics/bazarr-2.png)](/pics/bazarr-2.png)

Now, on the "Edit Languages Profile" modal, add a name (it can be whatever you want), and click on "Add Language".

**Note: You have to click on "Add language" once per each language you added on the last step**.

Since I added 3 languages (`English`, `Spanish` and `Latin American Spanish`), I'm going to add 3 languages on the modal.

When you are done, you can click on "Save" at the bottom.

[![bazarr-3](/pics/bazarr-3.png)](/pics/bazarr-3.png)

Back at the "Languages" page, you can set your new "Language Profile" as the default for Series and Movies.

[![bazarr-4](/pics/bazarr-4.png)](/pics/bazarr-4.png)

In the end, you should have something simillar to this:

[![bazarr-5](/pics/bazarr-5.png)](/pics/bazarr-5.png)

If you are happy with the configuration, click on "Save" at the top of the page.

[![bazarr-6](/pics/bazarr-6.png)](/pics/bazarr-6.png)

### Providers

On the left side menu, click on "Providers". You'll see the empty providers page. To add providers, click on the big ➕ sign.

[![bazarr-7](/pics/bazarr-7.png)](/pics/bazarr-7.png)

Here, you can search from a LOT of providers! They even include a little description so you know what they are.

[![bazarr-8](/pics/bazarr-8.png)](/pics/bazarr-8.png)

For this tutorial, I'll just add [OpenSubtitles.org](https://www.opensubtitles.org/en/search/subs), but you can add more later.

Some of the providers might ask you for a username and password. If you don't have an account for OpenSubtitles.org yet, create it.

After entering your login information, click on "Save"

[![bazarr-9](/pics/bazarr-9.png)](/pics/bazarr-9.png)

Now, you'll see OpenSubtitles.org as a new provider for Bazarr! If you are happy with the changes, click on "Save" at the top of the page.

[![bazarr-10](/pics/bazarr-10.png)](/pics/bazarr-10.png)

### Subtitles

On the left side menu, click on "Subtitles" and scroll down to "Performance / Optimization". There, you should disable "Use Embedded Subtitles".

A little down, you'll see the "Post-Processing" settings. Enable:

- "Encode Subtitles to UTF8".
- "Hearing Impaired".
- "Remove Tags".
- "OCR Fixes".
- "Common Fixes".
- "Fix Uppercase"

[![bazarr-11](/pics/bazarr-11.png)](/pics/bazarr-11.png)

Now, scroll all the way to the bottom and enable:

- "Automatic Subtitles Synchronization".
- "Series Score Threshold" and set it to 50.
- "Movies Score Threshold" and set it to 50.

I've found that with a threshold of 50, Bazarr can still find good subtitles and synchronize them if necessary. You can tune this if you want.

[![bazarr-12](/pics/bazarr-12.png)](/pics/bazarr-12.png)

If you are happy with the changes, click on "Save" at the top of the page.

[![bazarr-13](/pics/bazarr-13.png)](/pics/bazarr-13.png)

### Sonarr

This is how you will tie in Bazarr with [Sonarr](/config/sonarr).

First, you are going to need your Sonarr API Key.

You can get your Sonarr API Key in Sonarr. Go to [http://{your-ip-address}:8989/settings/general]() to open Sonarr's settings, and you'll find the API Key under the "Security" section.

[![bazarr-14](/pics/bazarr-14.png)](/pics/bazarr-14.png)

For now, just copy it and keep it in a safe location.

Now, back at Bazarr on the left side menu, click on "Sonarr".

Sonarr is disabled by default. To begin, enable Sonarr. A lot of new options will appear, but you only have to change a few.

- On Address, set `sonarr`.
- On API Key, just paste Sonarr's API Key.
- Click on "Test"

If everything worked, you should see your current Sonarr version on the button!

[![bazarr-15](/pics/bazarr-15.png)](/pics/bazarr-15.png)

To finish, click on "Save" at the top of the page.

[![bazarr-16](/pics/bazarr-16.png)](/pics/bazarr-16.png)

After saving, you'll see how the "Series" section appears on the left side menu!

[![bazarr-19](/pics/bazarr-19.png)](/pics/bazarr-19.png)

### Radarr

This is how you will tie in Bazarr with [Radarr](/config/radarr).

First, you are going to need your Radarr API Key.

You can get your Radarr API Key in Radarr. Go to [http://{your-ip-address}:7878/settings/general]() to open Radarr's settings, and you'll find the API Key under the "Security" section.

[![bazarr-17](/pics/bazarr-17.png)](/pics/bazarr-17.png)

For now, just copy it and keep it in a safe location.

Now, back at Bazarr on the left side menu, click on "Radarr".

Radarr is disabled by default. To begin, enable Radarr. A lot of new options will appear, but you only have to change a few.

- On Address, set `radarr`.
- On API Key, just paste Radarr's API Key.
- Click on "Test"

If everything worked, you should see your current Radarr version on the button!

[![bazarr-18](/pics/bazarr-18.png)](/pics/bazarr-18.png)

To finish, click on "Save" at the top of the page.

[![bazarr-20](/pics/bazarr-20.png)](/pics/bazarr-20.png)

After saving, you'll see how the "Movies" section appears on the left side menu!

[![bazarr-21](/pics/bazarr-21.png)](/pics/bazarr-21.png)

### All done!

Only one more step left! Continue with [Emby](/config/emby).
