---
title: "VPN"
date: 2023-01-15T21:16:29-03:00
draft: false
weight: 3
summary: Everything you need to know about configuring and using a VPN with YAMS
---

# Keeping Your Downloads Private 🔒

Let's talk about VPNs! While they might seem like an optional extra, **you should always use a VPN when downloading torrents**. It's not just about privacy - it's about keeping you safe and sound on the internet! 

YAMS uses [gluetun](https://github.com/qdm12/gluetun) to manage VPN connections. It's like a super-smart traffic controller for your downloads! 🚦

## Supported VPN Providers 🌐

YAMS works with tons of VPN providers! Here's the full list, with direct links to their setup guides:

### Popular Choices 🌟
- [ProtonVPN](https://github.com/qdm12/gluetun-wiki/blob/main/setup/providers/protonvpn.md) (Recommended! Easy to set up and great privacy)
- [Mullvad](https://github.com/qdm12/gluetun-wiki/blob/main/setup/providers/mullvad.md)
- [NordVPN](https://github.com/qdm12/gluetun-wiki/blob/main/setup/providers/nordvpn.md)
- [Private Internet Access](https://github.com/qdm12/gluetun-wiki/blob/main/setup/providers/private-internet-access.md)
- [Surfshark](https://github.com/qdm12/gluetun-wiki/blob/main/setup/providers/surfshark.md)

### Full Provider List 📋
- [AirVPN](https://github.com/qdm12/gluetun-wiki/blob/main/setup/providers/airvpn.md)
- [Cyberghost](https://github.com/qdm12/gluetun-wiki/blob/main/setup/providers/cyberghost.md)
- [ExpressVPN](https://github.com/qdm12/gluetun-wiki/blob/main/setup/providers/expressvpn.md)
- [FastestVPN](https://github.com/qdm12/gluetun-wiki/blob/main/setup/providers/fastestvpn.md)
- [Hidemyass](https://github.com/qdm12/gluetun-wiki/blob/main/setup/providers/hidemyass.md)
- [IPVanish](https://github.com/qdm12/gluetun-wiki/blob/main/setup/providers/ipvanish.md)
- [IVPN](https://github.com/qdm12/gluetun-wiki/blob/main/setup/providers/ivpn.md)
- [Perfect Privacy](https://github.com/qdm12/gluetun-wiki/blob/main/setup/providers/perfect-privacy.md)
- [Privado](https://github.com/qdm12/gluetun-wiki/blob/main/setup/providers/privado.md)
- [PrivateVPN](https://github.com/qdm12/gluetun-wiki/blob/main/setup/providers/privatevpn.md)
- [PureVPN](https://github.com/qdm12/gluetun-wiki/blob/main/setup/providers/purevpn.md)
- [SlickVPN](https://github.com/qdm12/gluetun-wiki/blob/main/setup/providers/slickvpn.md)
- [Torguard](https://github.com/qdm12/gluetun-wiki/blob/main/setup/providers/torguard.md)
- [VPN Secure](https://github.com/qdm12/gluetun-wiki/blob/main/setup/providers/vpn-secure.md)
- [VPN Unlimited](https://github.com/qdm12/gluetun-wiki/blob/main/setup/providers/vpn-unlimited.md)
- [VyprVPN](https://github.com/qdm12/gluetun-wiki/blob/main/setup/providers/vyprvpn.md)
- [WeVPN](https://github.com/qdm12/gluetun-wiki/blob/main/setup/providers/wevpn.md)
- [Windscribe](https://github.com/qdm12/gluetun-wiki/blob/main/setup/providers/windscribe.md)

Want to use a different VPN? You can set up a [custom VPN provider](https://github.com/qdm12/gluetun-wiki/blob/main/setup/providers/custom.md), but keep in mind this isn't officially supported by YAMS. You'll be in DIY territory! 🛠️

## Manual Configuration 🔧

Let's walk through setting up your VPN manually. For this guide, I'll assume your YAMS is installed in `/opt/yams` - adjust the paths if you installed it somewhere else!

### Step 1: Stop YAMS
```bash
yams stop
```

### Step 2: Configure Your VPN Settings
Open your `.env` file:
```bash
nano /opt/yams/.env
```

Find the VPN section and update it:
```bash
# VPN configuration
VPN_ENABLED=y
VPN_SERVICE=protonvpn     # Your VPN service from the list above
VPN_USER=your-username    # Your VPN username
VPN_PASSWORD=your-pass    # Your VPN password
```

### Step 3: Update Docker Compose
Open `docker-compose.yaml`:
```bash
nano /opt/yams/docker-compose.yaml
```

Find the qBittorrent section and make these changes:
```yaml
  qbittorrent:
    # ports:     # Comment out these lines
    #  - 8081:8081
    network_mode: "service:gluetun"  # Uncomment this line
```

Find the SABnzbd section and make similar changes:
```yaml
  sabnzbd:
    # ports:     # Comment out these lines
    # - 8080:8080
    network_mode: "service:gluetun"  # Uncomment this line
```

At the bottom, find the gluetun section and uncomment these ports:
```yaml
  gluetun:
    ports:
      - 8080:8080/tcp  # Uncomment this line
      - 8081:8081/tcp  # Uncomment this line
```

### Step 4: Restart and Test
```bash
yams restart
```

### Step 5: Verify Everything Works
```bash
yams check-vpn
```

You should see something like:
```bash
Getting your qBittorrent IP...
<qbittorrent_ip>
Your country in qBittorrent is Brazil

Getting your IP...
<your_local_ip>
Your local IP country is North Korea

Your IPs are different. qBittorrent is working as expected! ✅
```

If you get an error, double-check all your settings and make sure they're correct!

## Pro Tips 🎯

1. **Regular Checks**: Run `yams check-vpn` periodically to make sure your VPN is working correctly
2. **Kill Switch**: YAMS automatically includes a kill switch - if the VPN goes down, your downloads stop too!
3. **Speed Matters**: Choose a VPN server that's relatively close to you for better download speeds
4. **Port Problems**: If you can't access qBittorrent after setting up the VPN, check the troubleshooting section below

## Troubleshooting 🔧

### Common Issues:

1. **Can't access qBittorrent:**
   - Check gluetun logs: `docker logs gluetun`
   - Verify your VPN credentials
   - Make sure ports are configured correctly

2. **VPN keeps disconnecting:**
   - Try a different VPN server
   - Check your internet connection
   - Review the gluetun logs for errors

3. **Slow speeds:**
   - Try a server closer to your location
   - Check if your VPN provider throttles P2P traffic
   - Some providers have specialized servers for torrenting - try those!

## Need Extra Security? 🛡️

Want to double-check that your torrent client is really using the VPN? Head over to [Double-checking your torrent client IP address](/advanced/torrenting/#double-checking-your-torrent-client-ip-address) for a detailed guide!

## Still Need Help? 🆘

If you're stuck:
1. Check our [Common Issues](/faqs/common-errors/#gluetun-does-not-connect) page
2. Visit the [YAMS Forum](https://forum.yams.media)
3. Join our [Discord](https://discord.gg/Gwae3tNMST) or [Matrix](https://matrix.to/#/#yams-space:rogs.me) chat

Remember: A working VPN is crucial for safe downloading. Take the time to set it up right, and you'll be good to go! 🚀
