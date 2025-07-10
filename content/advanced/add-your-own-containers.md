---
title: "Adding your own containers to YAMS"
date: 2023-10-21T21:41:29-03:00
draft: false
weight: 20
summary: A complete guide to expanding YAMS with your own Docker containers
---

# Make YAMS Your Own! 🚀

Want to add more containers to your YAMS setup? Maybe a cool new app you found, or something specific for your needs? No problem! YAMS makes it super easy to expand your media server with custom containers.

## The Basics 📚

When you install YAMS, it creates two important files:
- `docker-compose.yaml`: This is YAMS's brain! Don't modify this file directly.
- `docker-compose.custom.yaml`: This is your playground! Add all your custom containers here.

## Getting Started 🎯

First, let's find your YAMS installation. I'll use `/opt/yams` in these examples, but replace it with your actual install location:

```bash
cd /opt/yams
```

## The Magic Variables ✨

YAMS provides some handy environment variables you can use in your custom containers. These are defined in your central [`.env` settings file]({{< relref "/advanced/env-file" >}}) (learn more about it!) and make it super easy to keep your custom containers working in harmony with YAMS:

```yaml
PUID: Your user ID
PGID: Your group ID
MEDIA_DIRECTORY: Your media folder location
INSTALL_DIRECTORY: Your YAMS installation location
```

These make it super easy to keep your custom containers working in harmony with YAMS!

## Let's Add a Container! 🎮

Let's walk through an example by adding [Overseerr](https://overseerr.dev/) - a fantastic request management app for your media server.

1. First, open `docker-compose.custom.yaml`:
```bash
nano docker-compose.custom.yaml
```

2. If this is your first custom container, you'll need to uncomment the `services:` line. To uncomment you must remove the `#` symbol and the space. Your file should start like this:

```yaml
services:  # Make sure this line is uncommented and there's no spaces around it!
```

3. Now let's add Overseerr with all the YAMS goodies:

```yaml
  overseerr:
    image: lscr.io/linuxserver/overseerr:latest
    container_name: overseerr
    environment:
      - PUID=${PUID}               # Using YAMS's user ID
      - PGID=${PGID}               # Using YAMS's group ID
    volumes:
      - ${INSTALL_DIRECTORY}/config/overseer:/config  # Using YAMS's config location
    ports:
      - 5055:5055
    restart: unless-stopped
```

4. Time to start your new container:
```bash
yams restart
```

You should see something like:
```bash
 ⠙ overseerr Pulling                                                                     5.2s
[...]
```

That's it! Your new container is up and running! 🎉

## Pro Tips 🎓

### 1. Container Discovery
Looking for cool containers to add? Check out:
- [linuxserver.io fleet](https://fleet.linuxserver.io/) (Highly recommended!)
- [Docker Hub](https://hub.docker.com/)

### 2. Network Magic 🌐
All containers in your `docker-compose.custom.yaml` automatically join YAMS's network! This means they can talk to each other using their container names as hostnames.

For example, if you need to connect to Radarr from a custom container, just use `http://radarr:7878` as the URL.

### 3. VPN Access 🔒
Want your custom container to use YAMS's VPN? Add this to your container config:
```yaml
    network_mode: "service:gluetun"
```

Check out [Running Prowlarr behind the VPN](/advanced/prowlarr-behind-vpn) for a detailed example!

### 4. Variable Power 💪
You can access any environment variable defined in YAMS's [`.env` file]({{< relref "/advanced/env-file" >}}) within your custom containers. Just use the `${VARIABLE_NAME}` syntax! This is great for things like API keys or other settings you want to manage centrally.

## Common Gotchas 🚨

1. **YAML Formatting Errors**: YAML is very sensitive to spacing and indentation. Even a single misplaced space can break your configuration! We highly recommend using a YAML validator like [yamllint.com](https://www.yamllint.com/) to check your syntax before applying changes.
2. **Container Names**: Make sure your custom container names don't conflict with YAMS's built-in containers.
3. **Port Conflicts**: Double-check that your new containers don't try to use ports that are already taken.
4. **Permissions**: If your container needs to access media files, remember to use `PUID` and `PGID`!

## Need Ideas? 💡

Here are some popular containers that work great with YAMS:

1. **[Overseerr](https://overseerr.dev/)** / **[Petio](https://petio.tv/)** / **[Jellyseer](https://docs.jellyseerr.dev/)**: Let users request movies and shows
2. **[Tautulli](https://tautulli.com/)**: Advanced Plex monitoring and statistics
3. **[Organizr](https://organizr.app/)**: Create a sleek dashboard for all your services

## Need Help? 🆘

If you run into any issues:
1. Check our [Common Issues](/faqs/common-errors/) page
2. Visit the [YAMS Forum](https://forum.yams.media)
3. Join our [Discord](https://discord.gg/Gwae3tNMST) or [Matrix](https://matrix.to/#/#yams-space:rogs.me) chat

Remember: YAMS is all about making your media server work for YOU. Don't be afraid to experiment and make it your own! 😎
