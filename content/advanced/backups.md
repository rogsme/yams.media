---
title: "Backups"
date: 2023-01-17T19:38:39-03:00
draft: false
weight: 4
summary: Backup your YAMS configuration.
---

Your YAMS configuration is located in your YAMS install directory.

## Create a Backup

To create a backup, run:

```bash
yams backup [destination]
```

Where the destination is the location where you want the `.tar.gz` file to be saved. For example:

```bash
yams backup ~/backups/
```

The output will be:

```bash
Stopping YAMS services...

Backing up YAMS to /home/roger...
This may take a while depending on the size of your installation.
Please wait... ⌛

Backup completed! 🎉
Starting YAMS services...

Backup completed successfully! 🎉
Backup file: /home/roger/yams-backup-2024-12-23-1734966570.tar.gz
```

## Restore a Backup

Restoring a backup is simple:

1. Extract your backup in the new location and `cd` into it:

```bash
tar -xzvf your-backup.tar.gz /your/new/location
cd /your/new/location
```

2. Edit the YAMS binary with the new information. You don't have to use `vim`; you can use your favorite text editor:

```bash
vim yams
```

3. Update `your/install/location` with your new install location:

```bash
set -euo pipefail

dc="docker compose -f your/install/location/docker-compose.yaml -f your/install/location/docker-compose.custom.yaml"  # -> Change this!
install_directory="your/install/location" # -> Change this!
```

4. Move the `yams` script to `/usr/local/bin/`:

```bash
sudo cp yams /usr/local/bin/
```

5. Start YAMS:

```bash
yams start
```

And that's it! YAMS should now be up and running.

