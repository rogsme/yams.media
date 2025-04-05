---
title: "Switching Gluetun to WireGuard"
date: 2025-04-05T12:00:00-03:00
draft: false
weight: 55
summary: Learn how to switch your Gluetun VPN configuration from OpenVPN to WireGuard for faster and more reliable connections.
---

Want faster VPN speeds and quicker connection times? It's time to switch from OpenVPN to **WireGuard**! This guide will walk you through updating your Gluetun configuration to use WireGuard — with a focus on **ProtonVPN**.

> ✅ **Why switch?** WireGuard is a modern VPN protocol that’s faster, more efficient, and easier to configure than OpenVPN.

---

## For ProtonVPN Users 🚀

ProtonVPN makes it easy to use WireGuard with Gluetun. Here's how to update your configuration.

### Step 1: Get Your WireGuard Private Key 🔑

1. Go to [ProtonVPN WireGuard Config Generator](https://account.proton.me/u/0/vpn/WireGuard)
2. Select a server and enable **Port Forwarding** and **Moderate NAT** (optional)
3. Click **Download** to get the `.conf` file
4. Open the file and copy the value of `PrivateKey`

It will look something like this:
```
PrivateKey = wOEI9rqqbDwnN8/Bpp22sVz48T71vJ4fYmFWujulwUU=
```

---

### Step 2: Update Your `.env` File 🛠️

Open your `.env` file and remove the OpenVPN credentials:

```bash
nano /opt/yams/.env
```

Remove or comment out:
```env
VPN_USER=your-username
VPN_PASSWORD=your-password
```

You can also remove `VPN_SERVICE=protonvpn` if you want to hardcode it in the compose file (see below), or leave it — both work.

> 💡 Not sure how the `.env` file works? Check out our [Environment File Guide](/advanced/env-file/) to learn how to manage variables like `WIREGUARD_PRIVATE_KEY` securely.

---

### Step 3: Update `docker-compose.yaml` 🐳

Find the `gluetun` service and replace the `environment:` section with the following:

```yaml
environment:
  - VPN_SERVICE_PROVIDER=protonvpn
  - VPN_TYPE=wireguard
  - WIREGUARD_PRIVATE_KEY=wOEI9rqqbDwnN8/Bpp22sVz48T71vJ4fYmFWujulwUU=
  - VPN_PORT_FORWARDING=on
  - VPN_PORT_FORWARDING_PROVIDER=protonvpn
  - PORT_FORWARD_ONLY=on
```

> 🧠 **Tip:** You can still use `${VARIABLE}` syntax if you prefer to keep the private key in your `.env` file. See the [Environment File Guide](/advanced/env-file/) for more info.

---

### Step 4: Restart YAMS 🔄

Apply the changes:

```bash
yams restart
```

---

### Step 5: Verify It’s Working ✅

Run the VPN check:

```bash
yams check-vpn
```

You should see your qBittorrent IP is different from your local IP — and located in the country you selected in ProtonVPN.

You can also check the Gluetun logs:

```bash
docker logs gluetun
```

Look for lines like:
```
Using VPN provider: protonvpn
VPN type: wireguard
Port forwarding is enabled
```

---

## For Other VPN Providers 🌐

WireGuard support varies by provider. Here’s what to do:

1. Visit the [Gluetun Provider Docs](https://github.com/qdm12/gluetun-wiki/tree/main/setup/providers)
2. Find your VPN provider and follow their WireGuard instructions
3. Replace the `gluetun` environment variables in your `docker-compose.yaml` accordingly

> ⚠️ Not all providers support WireGuard or port forwarding. Check their documentation carefully.

---

## Troubleshooting 🔧

### Gluetun won’t start?
- Double-check your `WIREGUARD_PRIVATE_KEY`
- Make sure `VPN_TYPE=wireguard` is set
- Check for typos in your `docker-compose.yaml`

### Port forwarding not working?
- Ensure `VPN_PORT_FORWARDING=on` and `PORT_FORWARD_ONLY=on` are set
- Verify that port forwarding is enabled in your ProtonVPN config
- Check Gluetun logs for forwarded port info

---

## Need Help? 🆘

If you're stuck:
- Visit our [Common Issues](/faqs/common-errors/) page
- Join our [Discord](https://discord.gg/Gwae3tNMST) or [Matrix](https://matrix.to/#/#yams-space:rogs.me) chat
- Or ask in the [YAMS Forum](https://forum.yams.media)
