---
title: "Using the CLI"
date: 2023-01-10T17:55:41-03:00
draft: false
weight: 3
summary: Master YAMS's powerful command-line interface - your Swiss Army knife for managing your media server!
---

# The YAMS Command Line: Your Media Server's Best Friend 🛠️

YAMS comes with a super handy command-line interface (CLI) that makes managing your media server a breeze! Think of it as your media server's remote control - but cooler. 😎

## Getting Started

To see what your YAMS CLI can do, just type:
```bash
yams --help
```

You'll get a nice overview of all available commands:

```bash
yams - Yet Another Media Server

Usage: yams [command] [options]

Commands:
--help                     displays this help message
restart                    restarts yams services
stop                      stops all yams services
start                     starts yams services
destroy                   destroy yams services so you can start from scratch
check-vpn                 checks if the VPN is working as expected
backup                    backs up yams to the destination location
```

Let's break down each command and see what magic they can do! ✨

## The Command Arsenal 🚀

### `yams start`
Fires up all your YAMS services. It's like pressing the "ON" button for your media server! The CLI will even show you a nice progress bar and let you know when everything's up and running.

### `yams stop`
Gracefully stops all YAMS services. Think of it as tucking your media server in for a good night's rest. 😴 All downloads will be paused, and all services will shut down properly.

### `yams restart`
Having a hiccup with one of your services? This command is like giving your media server a quick refresh! It:
1. Gracefully stops all services
2. Starts them back up
3. Shows you a progress bar while services are starting
4. Confirms when everything's back online

### `yams check-vpn`
Your privacy guardian! 🛡️ This command makes sure your VPN is doing its job by:
1. Checking your real IP address
2. Checking qBittorrent's IP address
3. Comparing them to make sure they're different
4. Showing you which countries both IPs are from

If something's wrong, it'll let you know right away!

### `yams backup [destination]`
Your safety net! 🎯 Backs up your entire YAMS configuration to keep your setup safe. Just tell it where to save the backup:

```bash
yams backup ~/my-backups
```

This will:
1. Stop all services (temporarily)
2. Create a timestamped backup file
3. Start everything back up
4. Tell you exactly where your backup is saved

### `yams destroy`
The nuclear option! ☢️ This command completely removes all YAMS services so you can start fresh. But don't worry - it'll ask for confirmation first! We don't want any accidents. 😅

## Pro Tips 💡

1. **Service Status**: After starting or restarting, YAMS will show you the status of each service, so you know everything's working properly.

2. **Backup Regularly**: Get into the habit of running `yams backup` before making any big changes. Future you will thank present you!

3. **Check That VPN**: Run `yams check-vpn` periodically to ensure your privacy is protected.

## Troubleshooting 🔧

Getting a `docker` permission error when trying to use the CLI? Don't panic! Head over to our [Common Issues](/faqs/common-errors/) page for the fix.

Remember: YAMS's CLI is here to make your life easier! If you're ever unsure about a command, just add `--help` at the end or check back here for a refresher. Happy streaming! 🎬
