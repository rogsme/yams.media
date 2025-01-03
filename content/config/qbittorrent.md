---
title: "qBittorrent"
date: 2023-01-10T18:02:13-03:00
draft: false
weight: 1
summary: The qBittorrent project aims to provide an open-source software alternative to µTorrent.
---

## What is qBitorrent?

From their [website](https://www.qbittorrent.org/):

> The qBittorrent project aims to provide an open-source software alternative to µTorrent.

So, just like µTorrent, qBitorrent is a torrent downloader. Pretty easy! 😎

## Initial configuration

First things first - if you set up a VPN during YAMS installation (which you really should!), qBittorrent should already be configured to use it. Let's verify everything is working correctly.

In your terminal, run:
```bash
yams check-vpn
```

You should see output like this:
```bash
Getting your qBittorrent IP...
<qBittorrent IP>
Your country in qBittorrent is Brazil

Getting your IP...
<your local IP>
Your local IP country is North Korea

Your IPs are different. qBittorrent is working as expected! ✅
```

If the check fails, you'll see something like:
```bash
Getting your qBittorrent IP...
<your local IP>
Your country in qBittorrent is North Korea

Getting your IP...
<your local IP>
Your local IP country is North Korea

Your IPs are the same! qBittorrent is NOT working! ⚠️
```

If your VPN check failed, head over to [VPN Configuration](/advanced/vpn/#manual-configuration) to fix it. **You should always use a VPN when downloading torrents!**

### Setting up qBittorrent

Let's get qBittorrent configured! In your terminal, check the qBittorrent logs to get your initial login credentials:

```sh 
docker logs qbittorrent
```

You'll see the qBittorrent username and password in the logs:
```
qbittorrent  | ******** Information ********
qbittorrent  | To control qBittorrent, access the WebUI at: http://localhost:8081
qbittorrent  | The WebUI administrator username is: admin
qbittorrent  | The WebUI administrator password was not set. A temporary password is provided for this session: FBFsKbfbD
qbittorrent  | You should set your own password in program preferences.
qbittorrent  | Connection to localhost (::1) 8081 port [tcp/tproxy] succeeded!
```

In your browser, go to [http://{your-ip-address}:8081/]() and you'll see qBittorrent's admin page. Log in with:

```sh
username: admin
password: your-temporary-password-from-the-logs
```

[![qbittorrent-1](/pics/qbittorrent-1.png)](/pics/qbittorrent-1.png)

After logging in, you'll see the empty qBittorrent window. Click on the gear icon in the top right to enter the settings.

[![qbittorrent-2](/pics/qbittorrent-2.png)](/pics/qbittorrent-2.png)

### Configuring BitTorrent Settings

First, go to the "Downloads" tab and set the "Default Save Path" to `/data/downloads/torrents/`.

[![qbittorrent-8](/pics/qbittorrent-8.png)](/pics/qbittorrent-8.png)

Then, go to the "BitTorrent" tab and check the "When ratio reaches" checkbox. Set it to 0.

### Is this a dick move?

Yes. 😅

The BitTorrent protocol works by sharing (seeding) files across the network. Setting the seeding limit to zero means "Share the torrent **until** I've finished downloading." You'll still share while downloading, but once complete, the torrent stops and waits for [Sonarr](/config/sonarr)/[Radarr](/config/radarr) to pick it up.

For this tutorial we'll leave it at 0, but feel free to be less selfish later! 

[![qbittorrent-3](/pics/qbittorrent-3.png)](/pics/qbittorrent-3.png)

### Configuring Web UI Settings

Next, go to the "Web UI" tab. Here you can set it to skip password authentication when accessing from your local network. This is optional but recommended.

[![qbittorreft-4](/pics/qbittorrent-4.png)](/pics/qbittorrent-4.png)

While you're here, change that temporary password to something more secure:

[![qbittorreft-7](/pics/qbittorrent-7.png)](/pics/qbittorrent-7.png)

### Configuring Network Settings

On the "Advanced" tab, make sure your Network interface is set to `tun0`. This ensures qBittorrent always uses the VPN connection and stops if the VPN goes down.

[![qbittorreft-5](/pics/qbittorrent-5.png)](/pics/qbittorrent-5.png)

Finally, scroll to the bottom and click "Save".

[![qbittorreft-6](/pics/qbittorrent-6.png)](/pics/qbittorrent-6.png)

### Port Forwarding 🚀

Want faster downloads? YAMS supports automatic port forwarding! Check out our [Port Forwarding Guide](/advanced/port-forwarding/) to supercharge your download speeds.

[![qbittorrent-ports](/pics/advanced-port-forwarding-1.png)](/pics/advanced-port-forwarding-1.png)

## Final VPN Check

Let's do one last VPN check to make sure everything's working:

```bash
$ yams check-vpn
```

You should see your qBittorrent IP is different from your local IP. If not, head over to [VPN Configuration](/advanced/vpn/#manual-configuration) to fix it.

## That's done! 🎉

Looking good! Now we can move forward with [SABnzbd](/config/sabnzbd).
