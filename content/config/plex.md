---
title: "Plex"
date: 2023-01-23T13:59:59-03:00
draft: false
weight: 9
---

# What is Plex?

From their [website](https://www.plex.tv/):

> With our free app you can add, access, and share all the entertainment that matters to you, on almost any device—including your own personal media collection. Guess that makes us the hardest working app in show business.

On YAMS, Plex is one of the most important parts: Plex is going to be your "Netflix", "Hulu" or "Amazon Prime". This means you'll be able to stream your TV shows and movies to any device using Plex.

## First steps

To start, you need to allow your IP range to access the Plex setup. In your server, first stop YAMS.

```bash
$ yams stop
```

Now, go to your Plex config in YAMS. For the purposes of this tutorial, I'm asuming your install location is `/opt/yams`.

```bash
$ cd /opt/yams/config/plex/Library/Application\ Support/Plex\ Media\ Server/
```

Inside that folder, open `Preferences.xml`.

```bash
/opt/yams/config/plex/Library/Application Support/Plex Media Server$ vim Preferences.xml
```
(you don't have to use `vim`, you can use `nano` if you want to).

On the `Preferences.xml` file, add the following **after** the `<Preferences ` directive:

```xml
<Preferences allowedNetworks="<your_subnet_IP>/255.255.255.0" ...
```

The `...` is the rest of the XML file, you only have to add the `allowedNetworks` directive.

### How do you find your subnet IP?

This depends on your network configuration, but it _sometimes_ goes with the following rules:
- If your server IP is `192.168.0.100`, your subnet is `192.168.0.0`.
- If your server IP is `10.0.0.25`, your subnet is `10.0.0.0`.

Finally, restart YAMS.

```bash
$ yams restart
```

To check if everything is working, you can try by running:

```bash
$ docker logs plex
```

If you see something like this:

```bash
Failed to load preferences at /config/Library/Application Support/Plex Media Server/Preferences.xml
Failed to load preferences at /config/Library/Application Support/Plex Media Server/Preferences.xml
```

It means your `Preferences.xml` is badly formatted. Try to fix it and try again.

Once you finish the Preferences config, you can continue.

**Note:** You can read more about this fix here: https://www.truenas.com/community/threads/plex-not-authorized-you-do-not-have-access-to-this-server.96858/.

## Initial configuration

In your browser, go to [http://{your-ip-address}:32400/web]() and you'll see Plex's setup page. Click on "Got it!" to continue.

[![plex-1](/pics/plex-1.png)](/pics/plex-1.png)

After logging in, you'll see a modal that says "Plex Pass". You can close that.

[![plex-2](/pics/plex-2.png)](/pics/plex-2.png)

On the "Name" screen, select a name for your server and click on continue.

[![plex-3](/pics/plex-3.png)](/pics/plex-3.png)

On the "Sync Your Watch State and Ratings" screen, just click "No".

[![plex-4](/pics/plex-4.png)](/pics/plex-4.png)

Now on "Media Library", click on "Add Library".

[![plex-5](/pics/plex-5.png)](/pics/plex-5.png)

### Adding Movies

On the "Add Library" modal, select "Movies" and click "Next".

[![plex-6](/pics/plex-6.png)](/pics/plex-6.png)

Now, click on "Browse For Media Folder".

[![plex-7](/pics/plex-7.png)](/pics/plex-7.png)

On the "Add Folder" modal, select the movies path (`/data/movies`) and click on "Add".

[![plex-8](/pics/plex-8.png)](/pics/plex-8.png)

Your "Add Library" modal should look like this. Finally, click on "Add Library".

[![plex-9](/pics/plex-9.png)](/pics/plex-9.png)

### Adding TV Shows

On "Media Library", click on "Add Library".

[![plex-10](/pics/plex-10.png)](/pics/plex-10.png)

On the "Add Library" modal, select "TV Shows" and click "Next".

[![plex-11](/pics/plex-11.png)](/pics/plex-11.png)

Now, click on "Browse For Media Folder".

[![plex-7](/pics/plex-7.png)](/pics/plex-7.png)

On the "Add Folder" modal, select the TV Shows path (`/data/tvshows`) and click on "Add".

[![plex-12](/pics/plex-12.png)](/pics/plex-12.png)

Your "Add Library" modal should look like this. Finally, click on "Add Library".

[![plex-13](/pics/plex-13.png)](/pics/plex-13.png)

In the end, your "Media Library" screen should look like this. If it's okay, click on "Next".

[![plex-14](/pics/plex-14.png)](/pics/plex-14.png)

## Finish

On the "Finish screen", click on "Done".

[![plex-15](/pics/plex-15.png)](/pics/plex-15.png)

You should see the Plex dashboard now! On the left side panel, click on "More".

[![plex-16](/pics/plex-16.png)](/pics/plex-16.png)

There, you should find your local "Movies" and "TV Shows".

[![plex-17](/pics/plex-17.png)](/pics/plex-17.png)

## That's all!

YAMS is fully up and running! Now, let's add some content. Move on to [Running everything together](/config/running-everything-together).

## Do you want a more in depth configuration?

If you want a more in depth configuration, I recommend you check the [TRaSH Guide for Plex](https://trash-guides.info/Plex/).
