---
title: "Torrenting"
date: 2023-01-16T14:48:14-03:00
draft: false
weight: 5
summary: Everything you need to know about safe and effective torrenting with YAMS
---

# Advanced Torrenting with YAMS 🌊

While [Sonarr](/config/sonarr) and [Radarr](/config/radarr) handle most of your downloads automatically, sometimes you might want to download something manually. Let's explore how to do that safely!

## Manual Downloads 📥

### Adding Torrent Files
1. Open qBittorrent at `http://{your-ip}:8081`
2. Click the "+" icon or "Add torrent file" button:
   [![Add torrent button](/pics/advanced-torrent-1.png)](/pics/advanced-torrent-1.png)

3. Select your .torrent file and click "Upload Torrents":
   [![Upload torrents](/pics/advanced-torrent-2.png)](/pics/advanced-torrent-2.png)

4. Watch your download progress:
   [![Download progress](/pics/advanced-torrent-3.png)](/pics/advanced-torrent-3.png)

### Finding Your Downloads
When your download finishes, find it in your media folder under the "downloads" directory:
```bash
/srv/media$ tree downloads/torrents/
downloads/torrents/
└── your-downloaded-file.iso

0 directories, 1 file
```

## Safety First: IP Leak Testing 🛡️

Even with a VPN, it's good practice to verify that your real IP isn't leaking. Here's how to do a thorough check:

### Using the IP Checker

1. Visit [whatismyip.net's Torrent Checker](https://www.whatismyip.net/tools/torrent-ip-checker/index.php) and grab their test magnet link:
   [![Torrent checker](/pics/advanced-torrent-4.png)](/pics/advanced-torrent-4.png)

2. In qBittorrent, click "Add Torrent Link":
   [![Add magnet link](/pics/advanced-torrent-5.png)](/pics/advanced-torrent-5.png)

3. Paste the magnet link and click "Download":
   [![Paste magnet](/pics/advanced-torrent-6.png)](/pics/advanced-torrent-6.png)

4. You'll see a new torrent called "Torrent Tracker IP Checker" in your list. Don't worry - it won't actually download anything!
   [![IP checker torrent](/pics/advanced-torrent-7.png)](/pics/advanced-torrent-7.png)

5. Back on the checker website, you'll see your torrent client's IP:
   [![IP check results](/pics/advanced-torrent-8.png)](/pics/advanced-torrent-8.png)

### Verifying the Results 🔍

For proper privacy protection, check that:
1. The reported IP is **different** from your real IP address
2. The IP matches what `yams check-vpn` reports
3. The country shown matches your VPN server location

## Pro Tips for Safe Torrenting 🎯

1. **Always Verify VPN First**
   ```bash
   yams check-vpn
   ```
   Do this before starting any downloads!

2. **Use the Kill Switch**
   YAMS configures qBittorrent to only use the VPN network interface. If the VPN drops, downloads stop automatically.

3. **Regular Testing**
   - Run the IP leak test monthly
   - Check VPN status before large downloads
   - Monitor qBittorrent's connection status

4. **Download Organization**
   - Use labels for different types of content
   - Set up category-specific download folders
   - Remove completed torrents regularly

5. **Enable Port Forwarding**
   - Check our [Port Forwarding Guide](/advanced/port-forwarding/)
   - Significantly improves download speeds
   - Works automatically with ProtonVPN

## Troubleshooting Common Issues 🔧

### Downloads Won't Start
1. Check VPN connection:
   ```bash
   yams check-vpn
   ```
2. Verify tracker status in qBittorrent
3. Try a different VPN server

### Slow Speeds
1. Try a VPN server closer to you
2. Check if your VPN provider throttles P2P
3. Verify you're not hitting VPN bandwidth limits

### Connection Drops
1. Check VPN provider status
2. Try a different VPN server
3. Monitor system resources

## Best Practices 📚

1. **Keep VPN Active**
   - Always check VPN status before downloading
   - Use `yams check-vpn` regularly
   - Monitor qBittorrent's network interface

2. **Regular Maintenance**
   - Clear completed torrents
   - Update qBittorrent when YAMS prompts
   - Run periodic IP leak tests

3. **Download Management**
   - Set reasonable ratio limits
   - Use categories for organization
   - Monitor disk space regularly

## Need Help? 🆘

Having issues with torrenting? We've got you covered:
1. Check the [Common Issues](/faqs/common-errors/) page
2. Visit the [YAMS Forum](https://forum.yams.media)
3. Join our [Discord](https://discord.gg/Gwae3tNMST) or [Matrix](https://matrix.to/#/#yams-space:rogs.me) chat

Remember: Safe torrenting is good torrenting. Always verify your VPN is working before downloading! 🛡️
