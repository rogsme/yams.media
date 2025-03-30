---
title: "Your Environment File (.env)"
weight: 30
description: "Get to know the handy .env file that helps configure YAMS."
summary: Learn about the central .env file used for YAMS configuration variables like paths and user IDs.
---

## Your Environment File (`.env`) - The YAMS Settings Hub!

Think of the `.env` file as the central control panel for some of YAMS's key settings. It's a simple text file living right where you installed YAMS (remember specifying that location during the [install steps]({{< relref "/install/steps" >}})? The default spot is `/opt/yams`).

### So, What Does It Do?

At its heart, the `.env` file holds **environment variables**. That sounds technical, but it's just a fancy way of saying "named settings". You give a setting a name, set its value, and then you can easily reuse that name elsewhere.

It looks like this inside:

```env
# Lines starting with # are comments (ignored)
PUID=1000
PGID=100
MEDIA_DIRECTORY=/srv/media
# You might add your own later!
# MY_API_KEY=supersecret123
```

See? Just `SETTING_NAME=some_value` on each line. Easy peasy!

### How YAMS Uses It (The Magic Part!)

Now, where do these settings get used? Primarily in your `docker-compose.yaml` and `docker-compose-custom.yaml` files. These files tell Docker how to run all the YAMS services (like Radarr, Sonarr, Plex, etc.).

Instead of writing the same path or ID over and over again in those files, we can just use the *name* of the setting from `.env`, but with a dollar sign (`$`) in front. Like this:

```yaml
# Inside a service definition in docker-compose.yaml...
environment:
  - PUID=$PUID # Aha! Use the PUID value from .env
  - PGID=$PGID # And the PGID value too!
volumes:
  - $MEDIA_DIRECTORY:/data # Map the media folder defined in .env
```

When Docker starts the container, it automatically swaps `$PUID` with `1000` (or whatever you set in `.env`), `$MEDIA_DIRECTORY` with `/srv/media`, and so on. Neat, right?

### Why Bother With `.env`? (Spoiler: It Makes Life Easier!)

Okay, why the extra step? It actually helps you out in a few great ways:

*   **Keep Secrets Secret:** Got API keys or passwords? Pop them in your `.env` file. This way, you can share your `docker-compose.yaml` file if you need help, without accidentally giving away sensitive info! **Super Important:** Make sure you add `.env` to your `.gitignore` file so you don't accidentally upload your secrets to Git! (We've already suggested adding this for you).
*   **Change Once, Update Everywhere:** Imagine you move your media library. Instead of editing the path in *every single service* in your `docker-compose.yaml`, you just change the `MEDIA_DIRECTORY` line in your `.env` file once. Done!
*   **Easy Tweaks:** It keeps your main `docker-compose.yaml` cleaner and lets you adjust core settings without digging through complex files.

### The Defaults YAMS Gives You

When you first set up YAMS, your `.env` file comes pre-filled with a few essentials:

*   `PUID` and `PGID`: These numbers tell the containers which user on your computer "owns" the files they create. This is super important for permissions (making sure Radarr can actually save files to your media folder!). You usually *don't* need to change the defaults (often `1000` for both) unless you know you need to run things as a different specific user.
*   `MEDIA_DIRECTORY`: This is the main folder on your computer where all your media lives (or will live!). The default is `/srv/media`. Feel free to change it to wherever you keep your stuff, just make sure the user from `PUID`/`PGID` can read and write there! **Heads Up:** For smooth sailing and efficient hardlinking (which saves disk space!), try to keep all your media (movies, TV, music, books) in *subfolders* under this *one* main directory.
*   `INSTALL_DIRECTORY`: This tells YAMS where its own configuration files for each service should live. Default is `/opt/yams`. You set this during install and probably won't touch it again.

### What About VPN Stuff?

Good question! Some VPN setups also rely on settings you might put in your `.env` file. For the specifics on that, head over to the [Torrenting with VPN guide]({{< relref "/advanced/torrenting" >}}).

---

*Thanks to Airwreck on Discord for contributing to this guide!*
