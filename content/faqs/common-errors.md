---
title: "Common issues"
date: 2023-10-22T10:22:29-03:00
draft: false
weight: 1
summary: How to fix common issues with YAMS.
---

# Docker

## Common `docker` permission errors

If you encounter errors like the one below when running the installer or the `yams` CLI:

```sh
permission denied while trying to connect to the Docker daemon socket at unix:///var/run/docker.sock:
```

It might indicate that you need to refresh your user permissions. This issue can typically be resolved by logging out of your server and then logging back in.

This problem arises because your user must be part of the `docker` group to execute `docker` commands without using `sudo`.

# qBittorrent

## qBittorrent is not accessible

If you [configured the VPN](/install/steps/#vpn), go to [Gluetun does not connect](#gluetun-does-not-connect)

# Gluetun

## Gluetun does not connect

After installing YAMS, there are instances when Gluetun fails to connect, resulting in qBittorrent becoming inaccessible.

To debug this issue, start by checking Gluetun's logs:

```bash
docker logs -n 100 gluetun
```

This command will display the last 100 lines of the Gluetun logs.

Many of the issues arise due to misconfigurations in your VPN setup. Please review the documentation for your VPN by clicking [here](/advanced/vpn).

Review the logs to try and find a solution. If you require assistance, feel free to join our [Matrix](https://matrix.to/#/#yams-space:rogs.me) or [Discord](https://discord.gg/Gwae3tNMST) chat and ask for help!
