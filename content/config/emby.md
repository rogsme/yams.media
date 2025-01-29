---
title: "Emby"
date: 2023-01-10T19:07:29-03:00
draft: false
weight: 8
summary: Emby brings together your personal videos, music, photos, and live television. Emby Server automatically converts and streams your personal media on the fly to play on any device.

---

# What is Emby?

From their [website](https://emby.media/about.html):

> Emby brings together your personal videos, music, photos, and live television. (...) Emby Server automatically converts and streams your personal media on the fly to play on any device.

In YAMS, Emby is your streaming service superstar! 🌟 Just like Netflix or Amazon Prime, Emby lets you stream all your media to any device. The best part? You're in complete control!

## Initial configuration

In your browser, go to [http://{your-ip-address}:8096/]() and you'll see Emby's setup page.

First up, pick your display language and click on "Next".

[![emby-1](/pics/emby-1.png)](/pics/emby-1.png)

Time to create your first user! This will be your admin account, so make it a good one. When you're done, click "Next".

[![emby-2](/pics/emby-2.png)](/pics/emby-2.png)

Now we're at the "Setup Media Libraries" page. Click on "New Library" - let's tell Emby where all your awesome content lives! 🎬

[![emby-3](/pics/emby-3.png)](/pics/emby-3.png)

### Setting up your TV Shows library

On the "New Library" modal, pick "TV shows" as your Content type and click that big ➕ sign next to "Folders".

[![emby-4](/pics/emby-4.png)](/pics/emby-4.png)

In "Select Path", choose the `/data/tvshows` folder and click "Ok"

[![emby-5](/pics/emby-5.png)](/pics/emby-5.png)

**Docker Magic Note:** 🎩 Don't worry if this path looks weird! The `/data/tvshows/` folder exists inside the docker environment and maps to your server's `/mediafolder/media/tvshows/` folder. It's all connected behind the scenes!

You'll see your newly added folder in the modal:

[![emby-6](/pics/emby-6.png)](/pics/emby-6.png)

Pick your preferred metadata language. All the default settings are good to go, but feel free to tweak them if you want to get fancy!

Your "New Library" screen should look something like this:

[![emby-7](/pics/emby-7.png)](/pics/emby-7.png)

Happy with how it looks? Click "Ok". Your TV Shows library is ready for action! 📺

[![emby-8](/pics/emby-8.png)](/pics/emby-8.png)

### Setting up your Movies library

Let's do that one more time! Click "New Library" again.

This time, pick "Movies" as your Content type and click the ➕ next to "Folders".

[![emby-9](/pics/emby-9.png)](/pics/emby-9.png)

Choose the `/data/movies` folder and click "Ok"

[![emby-10](/pics/emby-10.png)](/pics/emby-10.png)

**More Docker Magic:** ✨ Just like before, `/data/movies/` is actually mapping to your server's `/mediafolder/media/movies/` folder. Docker is doing its thing!

Your folder should show up in the modal:

[![emby-11](/pics/emby-11.png)](/pics/emby-11.png)

Set your preferred metadata language again. The defaults are still your friend here!

The screen should look something like this:

[![emby-12](/pics/emby-12.png)](/pics/emby-12.png)

All set? Click "Ok". Your Movies library is now ready! 🎬

[![emby-13](/pics/emby-13.png)](/pics/emby-13.png)

Time to move forward - click that "Next" button!

[![emby-14](/pics/emby-14.png)](/pics/emby-14.png)

### Wrapping up the setup

On the "Preferred Metadata Language" page, pick your language and country preferences, then click "Next".

[![emby-15](/pics/emby-15.png)](/pics/emby-15.png)

For the "Configure Remote Access" page, let's keep things simple and secure:
- Disable "Enable automatic port mapping"
- Click "Next"

[![emby-16](/pics/emby-16.png)](/pics/emby-16.png)

Time to accept the terms of service (you read those, right? 😉). Click "Next".

[![emby-17](/pics/emby-17.png)](/pics/emby-17.png)

You're all done! Click "Finish" to see your new Emby dashboard. 🎉
[![emby-18](/pics/emby-18.png)](/pics/emby-18.png)

### Logging in to Emby

First up, pick your user and log in with the credentials you created earlier.

[![emby-19](/pics/emby-19.png)](/pics/emby-19.png)

[![emby-20](/pics/emby-20.png)](/pics/emby-20.png)

And there it is! Your very own streaming service, ready to go! 🌟

[![emby-21](/pics/emby-21.png)](/pics/emby-21.png)

## That's all folks! 🎬

YAMS is fully up and running! Want to see how everything works together? Head over to [Running everything together](/config/running-everything-together).

## Pro Tip! 💡

If you're loving Emby, I highly recommend checking out [Emby Premiere](https://emby.media/premiere.html)! It's totally optional, but it gives you some really cool features like:
- Offline media for your devices
- Hardware transcoding (smoother playback!)
- Auto-conversion of your content
- And lots more!

I actually canceled all my streaming services, bought a 1-year Emby Premiere license, and never looked back. Just saying! 😉
