---
title: "Backups"
date: 2023-01-17T19:38:39-03:00
draft: false
weight: 3
summary: Backup your YAMS configuration.
---

Your YAMS configuration is located in your install location.

## Create a backup

For the purposes of this tutorial, I'll assume your YAMS install directory is `/opt/yams`, and that you want to create a backup on your `~` directory.

First, go to the YAMS install directory and do a `ls`. You should see the `config` folder right there:

```bash
$ cd /opt/yams/
/opt/yams$ ls

# Output
config  docker-compose.yaml
```

To create a backup, just run:

```bash
/opt/yams/config$ tar -czvf ~/yams-backup.tar.gz config/*
```

`tar` is going to compress and create a `.tar.gz` file called `yams-backup.tar.gz` on the `~` directory.

Remember you should store your backups in a secure location!

## Restore a backup

For the purposes of this tutorial, I'll assume your YAMS install directory is `/opt/yams`, and that the backup is located in `~/yams-backup.tar.gz`.

To restore a backup, first stop YAMS:

```bash
$ yams stop
```

Then, go to your YAMS install directory and delete everything inside the `config` folder.

```bash
$ cd /opt/yams
/opt/yams$ rm -r config/*
```

Now, untar the backup file on your YAMS install directory.

```bash
/opt/yams$ tar -xzvf ~/yams-backup.tar.gz
```

If you see all the folders inside the `config` directory, it means it worked!

```bash
/opt/yams$ ls config

# Output
bazarr  emby  gluetun  jackett  qbittorrent  radarr  sonarr
```

Finally, restart YAMS

```bash
/opt/yams$ yams start
```

Everything should be running as expected, with your backup up and running!
