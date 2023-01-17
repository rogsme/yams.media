---
title: "VPN"
date: 2023-01-15T21:16:29-03:00
draft: false
weight: 1
summary: Advanced configuration for the VPN, supported VPN lists and manual configuration.
---

Remember: **You should always use a VPN when downloading torrents!**.

YAMS uses [gluetun](https://github.com/qdm12/gluetun) for VPN.

## Official supported VPNs

- [AirVPN](https://github.com/qdm12/gluetun/wiki/AirVPN)
- [Cyberghost](https://github.com/qdm12/gluetun/wiki/Cyberghost)
- [ExpressVPN](https://github.com/qdm12/gluetun/wiki/ExpressVPN)
- [FastestVPN](https://github.com/qdm12/gluetun/wiki/FastestVPN)
- [Hidemyass](https://github.com/qdm12/gluetun/wiki/Hidemyass)
- [IPVanish](https://github.com/qdm12/gluetun/wiki/IPVanish)
- [IVPN](https://github.com/qdm12/gluetun/wiki/IVPN)
- [Mullvad](https://github.com/qdm12/gluetun/wiki/Mullvad) **(Recommended!)**
- [NordVPN](https://github.com/qdm12/gluetun/wiki/NordVPN)
- [Perfect privacy](https://github.com/qdm12/gluetun/wiki/Perfect-privacy)
- [Privado](https://github.com/qdm12/gluetun/wiki/Privado)
- [Private internet access](https://github.com/qdm12/gluetun/wiki/Private-internet-access)
- [PrivateVPN](https://github.com/qdm12/gluetun/wiki/PrivateVPN)
- [ProtonVPN](https://github.com/qdm12/gluetun/wiki/ProtonVPN)
- [PureVPN](https://github.com/qdm12/gluetun/wiki/PureVPN)
- [SlickVPN](https://github.com/qdm12/gluetun/wiki/SlickVPN)
- [Surfshark](https://github.com/qdm12/gluetun/wiki/Surfshark)
- [Torguard](https://github.com/qdm12/gluetun/wiki/Torguard)
- [VPN Secure](https://github.com/qdm12/gluetun/wiki/VPN-Secure)
- [VPN Unlimited](https://github.com/qdm12/gluetun/wiki/VPN-Unlimited)
- [VyprVPN](https://github.com/qdm12/gluetun/wiki/VyprVPN)
- [WeVPN](https://github.com/qdm12/gluetun/wiki/WeVPN)
- [Windscribe](https://github.com/qdm12/gluetun/wiki/Windscribe)

You can also set a [custom VPN provider](https://github.com/qdm12/gluetun/wiki/Custom-provider), but **this is not officially supported for YAMS. You are on your own here.**

## Manual configuration

To manually configure your VPN, you have to edit your `docker-compose.yaml` file.

First, stop `YAMS`:
```bash
$ yams stop
```

Then, open your `docker-compose.yaml` file. For this tutorial, I'm assuming the install location is `/opt/yams`. Also, you don't have to use `vim`, you can use `nano` or any other editor.

```bash
$ vim /opt/yams/docker-compose.yaml
```

On the file, find the `qbitorrent` config and make the following changes:

```yaml
...
    # ports: # qbittorrent -> Comment this line
    #  - 8080:8080 # qbittorrent -> Comment this line
    network_mode: "service:gluetun" -> Uncomment this line
```

Then, at the bottom, find the `gluetun` config and make the following changes:

```yaml
...
      - 8080:8080/tcp # gluetun -> Uncomment this line
...
    environment:
      - VPN_SERVICE_PROVIDER=<vpn_service> # -> Replace "<vpn_service>" with your VPN service provider
      - VPN_TYPE=openvpn
      - OPENVPN_USER=<vpn_user> # -> Replace "<vpn_user>" with your VPN username
      - OPENVPN_PASSWORD=<vpn_password> # -> Replace "<vpn_password>" with your VPN password
      - SERVER_COUNTRIES=<vpn_country> # -> Replacee "<vpn_country>" with your VPN country
```

Now, restart `YAMS`:

```bash
$ yams restart
```

Finally, check that your VPN is running correctly:

```bash
$ yams check-vpn

Getting your qBittorrent IP...
<your_qbittorrent_ip>
Your country in qBittorrent is Brazil

Getting your IP...
<your_local_ip>
Your local IP country is North Korea

Your IPs are different. qBittorrent is working as expected! ✅
```

If it's not running correctly, check every setting and make sure they are all correct.

## Double check your torrent client IP address

Go [here](/advanced/torrenting/#double-checking-your-torrent-client-ip-address).
