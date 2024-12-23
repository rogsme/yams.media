---
title: "Upgrading YAMS from version 1 to version 2 (Advanced)"
date: 2023-10-25T19:19:19-03:00
draft: false
weight: 4
summary: Are you running YAMS V1? Here's the guide to upgrade YAMS to V2!
---

# First, a brief disclaimer

I want to make this very clear: **This is entirely optional!** I will continue to support YAMS V1 as well as YAMS V2.

If you are completely happy with YAMS V1, or have a heavily modified setup, you can skip this tutorial!

## What are the advantages?

- YAMS V2 introduces a new command: `yams update`. It allows YAMS to update itself.
- Adding custom containers is now easier. You can find the tutorial here: [Add your own containers](/advanced/add-your-own-containers/).

# Before starting
# ⚠ BACKUP YOUR CONFIGURATION! ⚠

Some of these operations **MIGHT BE DESTRUCTIVE!** Ensure you have everything backed up before making any changes.

# Let's begin!

First, clone the YAMS repository in any directory (**do NOT** use your installation directory!). For the purposes of this tutorial, I'll use `~/yams_upgrade`.


```bash
git clone --depth 1 https://gitlab.com/rogs/yams.git ~/yams_upgrade
cd ~/yams_upgrade
```

## Setup .env.example

Begin by opening the `.env.example` file. Add your correct information to the file. All this information is currently available in your YAMS V1 `docker-compose.yaml` file.

For the purposes of this tutorial:

- My `PUID` and `PGID` are both set to `1000`.
- All the other settings are going to be the defaults set in the installer.
- Your media server name must be in lowercase. Accepted values are: `jellyfin`, `emby`, and `plex`.
- The VPN is set to be enabled (`y`) and configured to use Mullvad. If you are not using a VPN, leave the VPN configuration empty.

Here's how it should look:


```bash
# Base configuration
PUID=1000
PGID=1000
MEDIA_DIRECTORY=/srv/media
INSTALL_DIRECTORY=/opt/yams
MEDIA_SERVICE=jellyfin

# VPN configuration
VPN_ENABLED=y
VPN_SERVICE=mullvad
VPN_USER=12345678901234567890
VPN_PASSWORD=12345678901234567890
```

## Setup the YAMS binary

Now it's time to set up the `yams` binary. You need to replace some variables in this command, so proceed with caution:

- For the first line, the format is `/your/install/location/docker-compose.yaml`. In this tutorial, the value should be `/opt/yams/docker-compose.yaml`.
- For the second line, the format is `/your/install/location/docker-compose.custom.yaml`. In this tutorial, the value should be `/opt/yams/docker-compose.custom.yaml`.
- For the third line, the format is `/your/install/location`. In this tutorial, the value should be `/opt/yams`.

Run each of the `sed` commands separately!

```bash
sed -i -e "s|<filename>|/opt/yams/docker-compose.yaml|g" yams
                      # ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ REPLACE THE FIRST LINE HERE BETWEEN THE "|"
sed -i -e "s|<custom_file_filename>|/opt/yams/docker-compose.custom.yaml|g" yams
                                  # ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ REPLACE THE SECOND LINE HERE BETWEEN THE "|"
sed -i -e "s|<install_directory>|/opt/yams|g" yams
                               # ^^^^^^^^^ REPLACE THE THIRD LINE HERE BETWEEN THE "|"
```

## If you have custom containers:

Move your custom containers to `docker-compose.custom.yaml`. If you need help, you can use this tutorial from the "Adding a container" section: [Add your own containers - Adding a container](/advanced/add-your-own-containers/#adding-a-container).

# Finish the update

First, you need to stop YAMS. Run:

```bash
yams stop
```

## Copy the files to the correct locations

Now that you have all the changes ready for your setup, you can copy the files to the correct location.

### Copying .env.example file

You need to copy the `.env.example` file to the correct location. For the purposes of this tutorial, I will copy it to `/opt/yams/` and rename it to `.env`:

```bash
cp .env.example /opt/yams/.env
```

### Copying the docker-compose.custom.yaml file

Now, copy the file to the install location. For the purposes of this tutorial, I will copy it to `/opt/yams/`:

```bash
cp docker-compose.custom.yaml /opt/yams/
```

Let's also backup your current `docker-compose.yaml` configuration for safekeeping:

```bash
cp /your/install/location/docker-compose.yaml docker-compose.yaml.backup
```

### Copying the `yams` binary to the right place

This command will copy the current `yams` binary for backup and copy the new `yams` binary to the right place:

```bash
cp $(which yams) yams-old
sudo cp yams $(which yams)
```

### Run the update!

Now it's the time to execute the update!

```bash
yams update
```

Everything should be up and running!

# That's done!

YAMS should start back up again, and everything should be working as expected with the difference that now YAMS can be updated by using `yams update`.

If you have any issues upgrading from V1 to V2, you can create a new post in our forum: [YAMS Forum: Upgrading YAMS from V1 to V2](https://forum.yams.media/viewforum.php?f=26)
