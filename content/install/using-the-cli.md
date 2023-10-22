---
title: "Using the CLI"
date: 2023-01-10T17:55:41-03:00
draft: false
weight: 3
summary: YAMS comes with a very handy CLI to manage all your media server. Here's where you'll learn how to use it.
---

YAMS comes with a very handy CLI to manage your media server. Here's where you'll learn how to use it.

On your server, you can type: 
```bash
yams --help
```

And you'll get the following message:

```bash
yams - Yet Another Media Server

Usage: yams [--help|restart|stop|start]
options:
--help     displays this help message
restart    restarts yams services
stop       stops all yams services
start      starts yams services
destroy    destroy yams services so you can start from scratch
check-vpn  checks if the VPN is working as expected
update     updates YAMS
```

Everything is very self-explanatory, but I'll go in more detail here:

- `restart`: Restarts all the services. It stops them gracefully and starts them again.
- `stop`: Stops all the services gracefully.
- `start`: Starts all the services.
- `destroy`: Destroys all the services so you can start the configuration from scratch. ⚠️ Be careful! ⚠️ There's no going back after this!
- `check-vpn`: Checks the IP of the qBittorrent service and compares it to your own IP. If they are the same, it's going to warn you.
- `update`: Updates YAMS to the latest version available in the git repository.


If you get a `docker` permission error trying to use the CLI, go [here](/faqs/) to fix it.
