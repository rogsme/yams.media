---
title: "FAQs"
date: 2023-01-11T09:11:29-03:00
draft: false
weight: 100
---

# Frequently Asked Questions 🤔

## General Questions

### Why another media server script?
YAMS was born from a simple goal: Create a media server that's so easy to use, your non-tech-savvy family members could handle it! While there are other solutions out there, YAMS focuses on simplicity and automation without sacrificing power.

### Why these specific software choices?
YAMS is **opinionated** by design. Every choice was made to create a reliable, user-friendly experience. If you're curious about specific choices:

- **Sonarr/Radarr**: Best-in-class for automated media management
- **Prowlarr**: Unified indexer management
- **qBittorrent**: Reliable, open-source torrent client
- **Gluetun**: Robust VPN management
- **Jellyfin/Emby/Plex**: Top-tier media streaming options

Don't agree with our choices? That's totally fine! You can always use our source code as inspiration for your own setup. 🔧

## Platform Support

### Can I run YAMS on Windows?
While technically possible with Docker for Windows, we don't officially support it. Check out [WIMPS](https://github.com/Xaque8787/WIMPS) instead - it's inspired by YAMS but built specifically for Windows! Although the project has been archived, it could provide a better starting point than YAMS.

### What about macOS?
If you're looking to install YAMS on macOS, you're in luck! A community-maintained fork is available, specifically tailored for macOS.

Please visit [zavan/yams on GitLab](https://gitlab.com/zavan/yams) to access the fork and follow their installation instructions.

### Which Linux distributions are supported?
- **Recommended**: Debian 13
- **Also Supported**: Ubuntu 24.04
- Other distros might work but aren't officially supported

## Advanced Usage

### How do I add custom containers?
Easy! Check out our [Adding Custom Containers](/advanced/add-your-own-containers/) guide. You can add any Docker container to work alongside YAMS.

### Can I modify YAMS's default settings?
Absolutely! While YAMS comes with sensible defaults, you can customize:
- Container configurations
- Download settings
- Media organization
- Network settings
- And much more!

### Need more advanced configurations?
Check out [TRaSH Guides](https://trash-guides.info/) - they're fantastic for deep-diving into each component's settings!

## Network & VPN

### Can I add more containers to the VPN?
Yes! Everything's documented in the [VPN guide](https://github.com/qdm12/gluetun-wiki/blob/main/setup/connect-a-container-to-gluetun.md). Your config file is in `/opt/yams/docker-compose.yaml` (or your custom install location).

### Which VPN providers work with YAMS?
We support many popular providers! Check our [VPN Configuration](/advanced/vpn/#official-supported-vpns) page for the full list.

## Troubleshooting

### Getting Docker permission errors?
Common issue! Check our [Common Errors](/faqs/common-errors/#common-docker-permission-errors) page for the fix.

### Services not starting?
1. Check the logs: `docker logs container-name`
2. Verify permissions
3. Check our [Common Issues](/faqs/common-errors/) page

## Getting Help 🆘

Need more help? We've got you covered!

1. **Documentation**
   - Check relevant service docs
   - Review our [Common Issues](/faqs/common-errors/) page
   - Search existing forum posts

2. **Community**
   - Join our [Discord](https://discord.gg/Gwae3tNMST)
   - Visit our [Matrix](https://matrix.to/#/#yams-space:rogs.me) chat
   - Post on our [Forum](https://forum.yams.media)

3. **Issues & Bugs**
   - Check our [GitLab Issues](https://gitlab.com/rogs/yams/-/issues)
   - Search for similar problems
   - Create a new issue if needed

## Contributing 🤝

Want to help make YAMS better? Awesome!
- Fork our repository
- Make your changes
- Submit a pull request
- Or help improve our documentation!

Remember: YAMS is a community project, and we welcome all contributions! 🌟
