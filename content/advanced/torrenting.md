---
title: "Torrenting"
date: 2023-01-16T14:48:14-03:00
draft: false
weight: 2
summary: Advanced torreting advices.
---

## Dowloading torrents manually

Now that you have a Bittorrent client always available, you can use it to download any torrents you find online.

To add a new torrent, click on the "Add torrent file" option:

[![advanced-torrent-1](/pics/advanced-torrent-1.png)](/pics/advanced-torrent-1.png)

Now, select your .torrent file and click on "Upload Torrents".

[![advanced-torrent-2](/pics/advanced-torrent-2.png)](/pics/advanced-torrent-2.png)

Finally, you'll see your torrent downloading.

[![advanced-torrent-3](/pics/advanced-torrent-3.png)](/pics/advanced-torrent-3.png)

Once it finishes downloading, you can find your torrent file in your mediafolder, on the "downloads" folder.

```bash
/srv/media$ tree downloads/
downloads/
└── debian-11.6.0-amd64-DVD-1.iso

0 directories, 1 file
```

## Double checking your torrent client IP address

If you want to be extra sure your IP is not leaking in qBittorrent, you can use this simple check.

Go to https://www.whatismyip.net/tools/torrent-ip-checker/index.php and grab the testing magnet link.

[![advanced-torrent-4](/pics/advanced-torrent-4.png)](/pics/advanced-torrent-4.png)

In qBittorrent, click on "Add Torrent Link".

[![advanced-torrent-5](/pics/advanced-torrent-5.png)](/pics/advanced-torrent-5.png)

And paste the magnet link on the box. When you are done, click on "Download".

[![advanced-torrent-6](/pics/advanced-torrent-6.png)](/pics/advanced-torrent-6.png)

You'll see a new torrent called "Torrent Tracker IP Checker". This torrent is never going to start downloading, its just for https://whatsmyip.net to check the IP address.

[![advanced-torrent-7](/pics/advanced-torrent-7.png)](/pics/advanced-torrent-7.png)

Back at the torrent tracker page, you'll see the data for your torrent, and your qBittorrent IP!

[![advanced-torrent-8](/pics/advanced-torrent-8.png)](/pics/advanced-torrent-8.png)

The IP address **has to be different from your own IP address**, and **it has to match the output of** `yams check-vpn`.

You are now extra sure your IP is not going to get leaked from torrenting!
