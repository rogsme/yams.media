---
title: "Easy mode"
date: 2023-01-13T15:37:32-03:00
draft: false
weight: 1
summary: Easy initial configuration for YAMS. This is only intended for people that know what they are doing! If this is the first time you are configuring YAMS or it's the first time you are using any of the programs in YAMS, **⚠️ don't enter here! ⚠️**
---

# ⚠️ This is intended for experts! ⚠️ You have been warned.

I **strongly recommend** you configure everything yourself by following the tutorial. That way, you'll know what everything does and how everything is connected.

If this is your first time configuring YAMS, and want to go through the full manual configuration, go to [Jackett](/config/jackett) and start the configuration **(Recommended)**.

If this is not your first time configuring YAMS, or you already know how to use all the software included, you can move forward.

# Installation

If you go back to the [folder where you cloned YAMS](/install/steps/#cloning-from-gitlab), you'll see there's a folder called `base` with a `tar.gz` file called `base-config.tar.gz`.

`base-config.tar.gz` has a bare-bones configuration for YAMS. With it, you'll have YAMS configured at 100%, just like if you followed the configuration tutorial.

To apply the configuration, first go to your YAMS install location. For the purposes of this tutorial, let's say you installed it on the recommended location of `/opt/yams`.

```bash
$ cd /opt/yams
```

On your YAMS install location, if you run an `ls` you'll see you have a `config/` folder. `cd` into it and you'll find all the configuration files for each of the apps included with YAMS.

```bash
/opt/yams$ ls
config  docker-compose.yaml

/opt/yams$ cd config

/opt/yams/config$ ls
bazarr  emby  jackett  qbittorrent  radarr  sonarr
```

Now, shut down `yams`
```bash
/opt/yams/config$ yams stop
```

Then, `rm -r` all the files on the `config` folder:

```bash
/opt/yams/config$ rm -r *
```

To finish, extract the base file in your config folder. Remember to replace `{your-yams-clone-location}` with the real location within your filesystem:

```bash
/opt/yams/config$ tar -xzvf {your-yams-clone-location}/base/base-config.tar.gz
```

If you `ls` now, you'll see all the folders were extracted and are available again
```bash
/opt/yams/config$ ls
bazarr  emby  jackett  qbittorrent  radarr  sonarr
```

To restart `yams`, run:
```bash
/opt/yams/config$ yams start
```

And that's it! You should have everything configured and running from zero. You can now jump to [Running everything together](/config/running-everything-together/).
