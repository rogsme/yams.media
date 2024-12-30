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

In YAMS, Bazarr is your subtitle superstar! 🌟 It's going to download subtitles in any language you choose, sort them, and put them right where Emby/Jellyfin/Plex can find them. No more hunting for subtitles manually! 

## Initial Configuration

In your browser, go to [http://{your-ip-address}:6767/]() and you'll see Bazarr's settings page.

[![bazarr-1](/pics/bazarr-1.png)](/pics/bazarr-1.png)

The default settings here are fine - no need to change anything yet!

### Languages

On the left side menu, click on "Languages". This is where the fun begins! 🎬

In the "Languages Filter" box, pick all the languages you want subtitles for. For this tutorial, I'm going with:
- `English` (because why not?)
- `Spanish` (¿por qué no?)
- `Latin American Spanish` (different flavor, same great taste!)

After choosing your languages, click on "Add New Profile"

[![bazarr-2](/pics/bazarr-2.png)](/pics/bazarr-2.png)

In the "Edit Languages Profile" modal:
1. Give your profile a name (anything you want!)
2. Click on "Add Language"
3. **Important:** Click "Add Language" once for EACH language you picked earlier!

Since I picked 3 languages earlier, I need to click "Add Language" three times. Math! 🧮

When you're done, click "Save" at the bottom.

[![bazarr-3](/pics/bazarr-3.png)](/pics/bazarr-3.png)

Back on the "Languages" page, set your new profile as the default for both Series and Movies.

[![bazarr-4](/pics/bazarr-4.png)](/pics/bazarr-4.png)

You should end up with something like this:

[![bazarr-5](/pics/bazarr-5.png)](/pics/bazarr-5.png)

Happy with how it looks? Hit "Save" at the top of the page!

[![bazarr-6](/pics/bazarr-6.png)](/pics/bazarr-6.png)

### Providers

Time to tell Bazarr where to find those subtitles! Click on "Providers" in the left menu, then click that big ➕ sign.

[![bazarr-7](/pics/bazarr-7.png)](/pics/bazarr-7.png)

You'll see a HUGE list of providers - and they even include descriptions! How thoughtful! 📚

[![bazarr-8](/pics/bazarr-8.png)](/pics/bazarr-8.png)

For this tutorial, we'll just add [OpenSubtitles.org](https://www.opensubtitles.org/en/search/subs), but feel free to add more later! The more providers you have, the better chance of finding perfect subtitles.

Some providers (including OpenSubtitles.org) need a username and password. If you don't have an account yet, go ahead and create one - I'll wait! ⏳

Got your login info? Great! Enter it and click "Save"

[![bazarr-9](/pics/bazarr-9.png)](/pics/bazarr-9.png)

Now you'll see OpenSubtitles.org in your providers list! Click "Save" at the top of the page if you're happy with the changes.

[![bazarr-10](/pics/bazarr-10.png)](/pics/bazarr-10.png)

### Subtitles

Click on "Subtitles" in the left menu and scroll down to "Performance / Optimization". 

First thing to do: Disable "Use Embedded Subtitles". We want our subtitles free-range, not caged! 🐓

A bit further down, you'll find "Post-Processing". Enable these options:
- "Encode Subtitles to UTF8" (keeps everything readable)
- "Hearing Impaired" (removes those [DOOR CREAKS] descriptions)
- "Remove Tags" (cleans up formatting)
- "OCR Fixes" (fixes common scanning errors)
- "Common Fixes" (fixes... common stuff! 😅)
- "Fix Uppercase" (NO MORE SHOUTING IN SUBTITLES)

[![bazarr-11](/pics/bazarr-11.png)](/pics/bazarr-11.png)

Now scroll aaaaaall the way to the bottom and enable:
- "Automatic Subtitles Synchronization"
- Set both "Series Score Threshold" and "Movies Score Threshold" to 50

Why 50? I've found it's a good balance - Bazarr can still find good subtitles but won't use terrible ones. Feel free to adjust this if you want to be more or less picky!

[![bazarr-12](/pics/bazarr-12.png)](/pics/bazarr-12.png)

Happy with your settings? Hit "Save" at the top!

[![bazarr-13](/pics/bazarr-13.png)](/pics/bazarr-13.png)

### Connecting to Sonarr

Time to link Bazarr with [Sonarr](/config/sonarr)! First, we need Sonarr's API key.

Head to [http://{your-ip-address}:8989/settings/general]() and find the API Key under "Security".

[![bazarr-14](/pics/bazarr-14.png)](/pics/bazarr-14.png)

Copy that key and keep it safe!

Back in Bazarr, click on "Sonarr" in the left menu.

By default, Sonarr is disabled. Let's fix that! Enable Sonarr and you'll see lots of new options. Don't panic - you only need to change a few:

- Address: set to `sonarr`
- API Key: paste in Sonarr's API Key
- Click "Test"

If everything's working, you'll see your Sonarr version on the button! 🎉

[![bazarr-15](/pics/bazarr-15.png)](/pics/bazarr-15.png)

Click "Save" at the top of the page to finish up.

[![bazarr-16](/pics/bazarr-16.png)](/pics/bazarr-16.png)

Magic time! The "Series" section should appear in your left menu! ✨

[![bazarr-19](/pics/bazarr-19.png)](/pics/bazarr-19.png)

### Connecting to Radarr

Now let's connect to [Radarr](/config/radarr)! First step: get that API key.

Go to [http://{your-ip-address}:7878/settings/general]() and find the API Key under "Security".

[![bazarr-17](/pics/bazarr-17.png)](/pics/bazarr-17.png)

Copy that key and keep it handy!

Back in Bazarr, click "Radarr" in the left menu.

Just like with Sonarr, Radarr is disabled by default. Enable it and fill in:
- Address: set to `radarr`
- API Key: paste in Radarr's API Key
- Click "Test"

If the test works, you'll see your Radarr version on the button! 🎯

[![bazarr-18](/pics/bazarr-18.png)](/pics/bazarr-18.png)

Click "Save" at the top to wrap things up.

[![bazarr-20](/pics/bazarr-20.png)](/pics/bazarr-20.png)

More magic! The "Movies" section appears in your left menu! ✨

[![bazarr-21](/pics/bazarr-21.png)](/pics/bazarr-21.png)

### Almost there! 🏃‍♂️

Just one last step! Time to set up your media service. Pick your path:
- [Jellyfin](/config/jellyfin)
- [Emby](/config/emby)
- [Plex](/config/plex)

## Want to become a subtitle master? 🎓

If you want to really dive into Bazarr's settings, check out the [TRaSH Guide for Bazarr](https://trash-guides.info/Bazarr/). They've got some amazing advanced configurations in there!
