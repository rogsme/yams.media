---
title: "Adding your own containers to YAMS"
date: 2023-10-21T21:41:29-03:00
draft: false
weight: 1
summary: Instructions on how to add your own Docker containers to YAMS.
---

Adding your own containers in YAMS is very easy.

First, go to your install location. For the purposes of this tutorial, I'll use `/opt/yams`.

```bash
cd /opt/yams
```

If you `ls`, you'll see 2 files:
- `docker-compose.yaml`: This is YAMS. You shouldn't mess with this file manually.
- `docker-compose.custom.yaml`: Here's where you'll add your containers. Any container you add here will be automatically added to the YAMS network and will be able to communicate locally with YAMS.

To add your containers, you'll have a few environment variables available:

- `PUID`: Your PUID.
- `PGID`: Your PGID.
- `MEDIA_DIRECTORY`: Your media directory.
- `INSTALL_LOCATION`: Your install location.

# Adding a container

As an example, I'll add [Overseerr](https://overseerr.dev/).

Open `docker-compose.custom.yaml` and add the following information:

```yaml
version: "3"

services: # -> Uncomment this line! (remove the "#" in front of it)

# Add your container here 👇 
  overseerr:
    image: lscr.io/linuxserver/overseerr:latest
    container_name: overseerr
    environment:
      - PUID=${PUID} # Note how I'm using the env variables here
      - PGID=${PGID} # Note how I'm using the env variables here
    volumes:
      - ${INSTALL_LOCATION}/config/overseer:/config # Note how I'm using the env variables here
    ports:
      - 5055:5055
    restart: unless-stopped
```

To start the container, run:

```bash
yams restart
```

If everything is okay, you should see Overseer installing:

```bash
 ⠙ overseerr Pulling                                                                            5.2s


 ...
```

And that's it!

You can find new containers here:
- https://fleet.linuxserver.io/ (recommended).
- https://hub.docker.com/.
