---
title: "Running Prowlarr Behind the VPN"
date: 2024-09-27T16:44:00-03:00
draft: false
weight: 4
summary: A complete guide to routing Prowlarr's traffic through your VPN for extra privacy
---

# Extra Privacy for Prowlarr 🔒

While downloading .torrent files isn't usually illegal, some ISPs might try to block your access to indexers. Let's fix that by putting Prowlarr behind your VPN! 

## Why Put Prowlarr Behind the VPN? 🤔

1. **Bypass ISP Blocks**: Some ISPs block torrent indexer websites
2. **Extra Privacy**: Keep your searches private
3. **Better Access**: Reach indexers that might be geo-blocked in your country

## Configuration Steps 🛠️

We'll need to modify two services in your `docker-compose.yaml` file: Prowlarr and Gluetun. Let's do this step by step!

### Step 1: Modify Prowlarr's Config
First, let's update Prowlarr to use the VPN network. Open your `docker-compose.yaml` and find the Prowlarr service:

```yaml
prowlarr:
    image: lscr.io/linuxserver/prowlarr
    container_name: prowlarr
    # Delete or comment out the 'ports' section
    # ports:
    #   - 9696:9696
    network_mode: "service:gluetun"  # Add this line
    environment:
      - PUID=${PUID}
      - PGID=${PGID}
      - WEBUI_PORT=9696  # Add this line
    volumes:
      - ${INSTALL_DIRECTORY}/config/prowlarr:/config
    restart: unless-stopped
```

Key changes:
1. Remove or comment out the `ports` section
2. Add `network_mode: "service:gluetun"`
3. Add `WEBUI_PORT=9696` to the environment variables

### Step 2: Update Gluetun's Config
Now we need to tell Gluetun to handle Prowlarr's traffic. Find the Gluetun service in your `docker-compose.yaml`:

```yaml
gluetun:
    image: qmcgaw/gluetun:v3
    container_name: gluetun
    cap_add:
      - NET_ADMIN
    devices:
      - /dev/net/tun:/dev/net/tun
    ports:
      - 8888:8888/tcp   # HTTP proxy
      - 8388:8388/tcp   # Shadowsocks
      - 8388:8388/udp   # Shadowsocks
      - 8080:8080/tcp   # gluetun
      - 9696:9696/tcp   # Add this line for Prowlarr
    volumes:
      - ${INSTALL_DIRECTORY}/config/gluetun:/config
    environment:
      - FIREWALL_OUTBOUND_SUBNETS=192.168.1.0/24  # Add this line
    restart: unless-stopped
```

Key changes:
1. Add `9696:9696/tcp` to the ports
2. Add `FIREWALL_OUTBOUND_SUBNETS` to the environment section

### Step 3: Find Your Subnet 🔍

The `FIREWALL_OUTBOUND_SUBNETS` value needs to match your container subnet. Here's how to find it:

1. Open Portainer
2. Click on "Containers"
3. Look at the "IP Address" column

Most setups use one of these subnets:
- `172.18.0.0/24` - If your containers use IPs like `172.18.x.x`
- `192.168.1.0/24` - If your containers use IPs like `192.168.1.x`

### Step 4: Apply the Changes 🔄

Save your changes and restart YAMS:
```bash
yams restart
```

## Testing Your Setup 🎯

After YAMS restarts, check that:
1. You can still access Prowlarr at `http://your-ip:9696`
2. Your indexers still work
3. The search function works correctly

## Troubleshooting 🔧

### Can't Access Prowlarr?
1. Check Gluetun's logs:
```bash
docker logs gluetun
```
2. Verify your subnet setting is correct
3. Make sure the port mapping is right in both services

### Indexers Not Working?
1. Check your VPN connection:
```bash
yams check-vpn
```
2. Try accessing an indexer manually through Prowlarr
3. Check Prowlarr's logs for any errors

### Still Having Issues? 
1. Compare your configuration with the examples above
2. Make sure your VPN provider allows port forwarding
3. Try a different VPN server

## Pro Tips 💡

1. **Speed Matters**: Choose a VPN server close to you for better performance
2. **Regular Checks**: Use `yams check-vpn` to verify your VPN is working
3. **Monitor Logs**: Keep an eye on both Prowlarr and Gluetun logs for issues

## Need Help? 🆘

If you're stuck:
1. Check the [Common Issues](/faqs/common-errors/) page
2. Visit the [YAMS Forum](https://forum.yams.media)
3. Join our [Discord](https://discord.gg/Gwae3tNMST) or [Matrix](https://matrix.to/#/#yams-space:rogs.me) chat

Remember: Taking a few extra steps for privacy is always worth it! Stay safe out there! 🛡️
