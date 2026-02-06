---
title: "Port Forwarding"
date: 2024-12-30T10:14:29-03:00
draft: false
weight: 50
summary: Everything you need to know about configuring and using a VPN with YAMS
---

Port forwarding helps you get better download speeds by allowing incoming connections to your torrent client. YAMS enables port forwarding by default, but setup varies by VPN provider.

## ProtonVPN Users 🚀
ProtonVPN makes port forwarding easy! Just follow these steps:

> 🆕 ProtonVPN now supports **WireGuard with port forwarding**! If you want faster VPN performance, check out our [Switching Gluetun to WireGuard](/advanced/wireguard/) guide.

### Setup from zero

If you didn’t set up port forwarding with the YAMS installer, start here.

If you did set up port forwarding with the YAMS installer, skip ahead to [Automatically change to the forwarded port](#automatically-change-to-the-forwarded-port).

#### Update your .env file

For OpenVPN users, you need to modify your `OPENVPN_USER` in your `.env` file.
- Open your `.env` file (usually located at `/opt/yams/.env`) using `nano`:
  ```bash
  nano /opt/yams/.env
  ```
- Locate the `VPN_USER` line and append `+pmp` to your username, as shown in this example:

```bash
# VPN configuration
VPN_ENABLED=y
VPN_SERVICE=protonvpn
VPN_USER=your_user+pmp # Append +pmp here!
VPN_PASSWORD=your_password
```

- Save the file and exit nano (Ctrl+S, then Ctrl+X).

#### Update your Docker Compose file

Open your Docker Compose file, located at `/your/install/location/docker-compose.yaml`, and update these variables:

```yaml
  # Gluetun is our VPN, so you can download torrents safely
  gluetun:
    image: qmcgaw/gluetun:v3
    container_name: gluetun
    cap_add:
      - NET_ADMIN
    devices:
      - /dev/net/tun:/dev/net/tun
    ports:
      - 8888:8888/tcp # HTTP proxy
      - 8388:8388/tcp # Shadowsocks
      - 8388:8388/udp # Shadowsocks
      - 8003:8000/tcp # Admin
      - 8080:8080/tcp # gluetun
      - 8081:8081/tcp # gluetun
    environment:
      - VPN_SERVICE_PROVIDER=${VPN_SERVICE}
      - VPN_TYPE=openvpn
      - OPENVPN_USER=${VPN_USER}
      - OPENVPN_PASSWORD=${VPN_PASSWORD}
      - OPENVPN_CIPHERS=AES-256-GCM
      - PORT_FORWARD_ONLY=on  # Change this!
      - VPN_PORT_FORWARDING=on  # Change this!
      - FIREWALL_OUTBOUND_SUBNETS=172.60.0.0/24
    restart: unless-stopped
    networks:
      yams_network:
        ipv4_address: 172.60.0.18
```

Summary of changes:
- `PORT_FORWARD_ONLY` should be set to `on`.
- `VPN_PORT_FORWARDING` should be set to `on`.

## Automatically change to the forwarded port
VPN providers can often change your forwarded port without notice, breaking your qBitTorrent connection.

Fix this issue by adding these two environment variables to your Gluetun container:
```yaml
environment:
- VPN_PORT_FORWARDING_UP_COMMAND=/bin/sh -c 'wget -O- --retry-connrefused --post-data "json={\"listen_port\":{{PORT}},\"current_network_interface\":\"{{VPN_INTERFACE}}\",\"random_port\":false,\"upnp\":false}" http://127.0.0.1:8080/api/v2/app/setPreferences 2>&1'
- VPN_PORT_FORWARDING_DOWN_COMMAND=/bin/sh -c 'wget -O- --retry-connrefused --post-data "json={\"listen_port\":0,\"current_network_interface\":\"lo"}" http://127.0.0.1:8080/api/v2/app/setPreferences 2>&1'
```

For this to work, the qBittorrent web UI server must be enabled and listening on port 8080 and the Web UI "Bypass authentication for clients on localhost" must be ticked (json key bypass_local_auth) so Gluetun can reach qBittorrent without authentication. Both of these should already be correctly configured if you set up your qBitTorrent instance as per the [YAMS config guide](/config/qbittorrent).

Then, restart Gluetun, and you are done! When port forwarding is established, the Gluetun container will contact your qBitTorrent instance, automatically updating the port number.

*Read more about this Gluetun feature [here](https://github.com/qdm12/gluetun-wiki/blob/main/setup/advanced/vpn-port-forwarding.md#custom-port-forwarding-updown-command)*

## Other VPN Providers 🌐
For other VPN providers, port forwarding configuration varies.

> 💡 Some providers support WireGuard too! See [Switching Gluetun to WireGuard](/advanced/wireguard/) for details.

Gluetun natively supports port forwarding for these providers:
- Private Internet Access
- ProtonVPN
- Perfect Privacy
- PrivateVPN

For detailed provider-specific instructions, check the [Gluetun Port Forwarding Documentation](https://github.com/qdm12/gluetun-wiki/blob/main/setup/advanced/vpn-port-forwarding.md).

> ⚠️ Remember, if your provider needs custom environment variables, they must be provided in the containers `environment:` section. Variables defined within the YAMS `.env` file can be acessed by the `docker-compose.yml` file, but not within the containers themselves! Check out [Your Environment File (.env)](/advanced/content/advanced/env-file) for more info.

## Verifying Port Forwarding ✅
To check if port forwarding is working:

1. Run `curl http://localhost:8003/v1/openvpn/portforwarded` to see your current port
2. Visit [Open Port Check Tool](https://www.yougetsignal.com/tools/open-ports/) and test your port by using your public VPN IP and the active port
3. Check qBittorrent's connection status - it should show "Connection Status: Connected"

[![conection-status](/pics/advanced-port-forwarding-1.png)](/pics/advanced-port-forwarding-1.png)

## Troubleshooting 🔧

1. **No port shown:**
   ```bash
   docker logs gluetun | grep "\[port forwarding\]"
   ```
   Look for any error messages

2. **Port not updating:**
   - Check if the script has execute permissions
   - Verify crontab is running: `crontab -l`
   - Check script logs: `tail -f /var/log/syslog | grep update-port`

Need help? Visit our [Common Issues](/faqs/common-errors/) page or join our [Discord](https://discord.gg/Gwae3tNMST) chat!
