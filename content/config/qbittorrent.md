---
title: "qBittorrent"
date: 2023-01-10T18:02:13-03:00
draft: false
weight: 3
summary: The qBittorrent project aims to provide an open-source software alternative to µTorrent.
---

## What is qBitorrent?

From their [website](https://www.qbittorrent.org/):

> The qBittorrent project aims to provide an open-source software alternative to µTorrent.

So, just like µTorrent, qBitorrent is a torrent downloader. Pretty easy!

## First, check your VPN!

If you configured Mullvad correctly, your VPN should already be running. To test, run on your terminal:

```bash
$ yams check-vpn
```

If everything is working correctly, you should get a message like this:

```bash
Getting your qBittorrent IP...
<qBittorrent IP>

Getting your IP...
<your local IP>

Your IPs are different. qBittorrent is working as expected! ✅
```
If your VPN is working fine, move onwards to the [Initial configuration](#initial-configuration).

If the check fails (or you haven't configured the VPN), you'll see a message like this:

```bash
Getting your qBittorrent IP...
<your local IP>

Getting your IP...
<your local IP>

Your IPs are the same! qBittorrent is NOT working! ⚠️
```

**You should always run a VPN when downloading torrents!** You can manually set your VPN here: [Advanced VPN settings](/advanced/vpn). You can come back here after you have fixed this!

## Initial configuration

In your browser, go to [http://{your-ip-address}:8080/]() and you'll see qBittorrent's admin page. The default username and password are:

```sh
username: admin
password: adminadmin
```
I know, super safe.

[![qbittorrent-1](/pics/qbittorrent-1.png)](/pics/qbittorrent-1.png)

After logging in, you'll see the empty qBittorrent window. Here, you have to click on the gear icon to enter the settings.

[![qbittorrent-2](/pics/qbittorrent-2.png)](/pics/qbittorrent-2.png)

You'll notice qBitorrent has A TON of settings you can change. First, go to the "BitTorrent" tab, check the "When ratio reaches" checkbox and set it to 0

### Is this a dick move?

Yes.

In case you don't know, the BitTorrent protocol works by sharing (seeding) files across the network. By setting the seeding limit to zero, we are basically saying "Share the torrent **until** I've finished downloading." You'll still share the file across the network while downloading, but when the file completes, the torrent will automatically stop and wait for [Sonarr](/config/sonarr)/[Radarr](/config/radarr) to pick up the file.

For the purposes of this tutorial we'll leave it at 0, but if you want you can change it later to a less dickish setting.

[![qbittorrent-3](/pics/qbittorrent-3.png)](/pics/qbittorrent-3.png)

Then, we'll continue to the "Web UI" tab. There, we can set it so it won't ask for a password if we are accesing it from the same subnet. This is not required, but recommended.

[![qbittorreft-4](/pics/qbittorrent-4.png)](/pics/qbittorrent-4.png)

## That's done!

Excellent! Now we can move forward with [Radarr](/config/radarr).
