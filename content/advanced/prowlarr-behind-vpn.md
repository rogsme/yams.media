---
title: "Running Prowlarr behind the VPN"
date: 2024-09-27T16:44:00-03:00
draft: false
weight: 3
summary: How to put Prowlarr behind the VPN just like qBitTorrent
---

While not usually illegal, downloading .torrent files can be a grey area in a lot of places. Because of this, some ISPs will attempt to block indexers.
An obvious way around this is by putting Prowlarr itself behind the VPN. Here's the steps to do that


## Modifying Prowlarr
- Open your `docker-compose.yaml` file in your text editor of choice
- Scroll down to the `prowlarr` service and remove the `ports` section
- Add a new line: `network_mode: "service:gluetun"` (if you've renamed your Gluetun service, be sure to match the service names here)
- Under the existing `environment` section, add this line `- WEBUI_PORT=9696`
- Once finished, your Prowlarr service should look something like this
  ```yaml
  prowlarr:
      image: lscr.io/linuxserver/prowlarr
      container_name: prowlarr
      network_mode: "service:gluetun"
      environment:
        - PUID=${PUID}
        - PGID=${PGID}
        - WEBUI_PORT=9696
      volumes:
        - ${INSTALL_DIRECTORY}/config/prowlarr:/config
      restart: unless-stopped
  ```

## Modifying Gluetun
- Scroll down to the `gluetun` section
- Under the `ports` section, add this line `- 9696:9696/tcp`
- Under the `environment` section, add this line: `- FIREWALL_OUTBOUND_SUBNETS=192.168.1.0/24` (NOTE: You'll want the subnet to match the subnet for your containers)
  - If you're unsure what subnets your containers are running under, open up Portainer, click on `Containers`, and look in the `IP Address` column
  - You really only need to care about the first two sections of the IP address. So if your containers are running under `172.18.X.X` then your entry would look like: `- FIREWALL_OUTBOUND_SUBNETS=172.18.1.0/24`
- Once finished, your Gluetun service should look something like this:
  ```yaml
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
        - 8080:8080/tcp # gluetun
        - 9696:9696/tcp
      volumes:
        - ${INSTALL_DIRECTORY}/config/gluetun:/config
      environment:
        - FIREWALL_OUTBOUND_SUBNETS=192.168.1.0/24 # NOTE: May look different on your system. Double check the subnets in Portainer
      restart: unless-stopped`
  ```

Once all of your changes have been made, save and close the file

In your terminal, run `yams restart` to bounce the stack and apply your changes
