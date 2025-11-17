---
title: "Seeding With Qbitmanage"
date: 2025-11-14T15:34:20+11:00
draft: false
weight: 110
---


In general, it is good practice to seed any torrents you download. Seeding is the act of sharing a media file you have downloaded with other users, helping with their downloads.

Many private trackers also require maintenance of a 'ratio'. This ratio is calculating by the amount seeded over the amount downloaded, and must be maintained above a limit to ensure you are contributing to a tracker community.

Within a default YAMS setup, [seeding is essentially not enabled](https://yams.media/config/qbittorrent/#is-this-a-dick-move) once you have downloaded the file. However, if you already have the file downloaded, you might as well seed it to others right?

This is a guide on how to automate a flexible seeding setup within your media server:
- Once movies and shows are downloaded, they will be automatically seeded whilst the media remains within your server
- When media is watched from your streaming platform, it is deleted from within Radarr and Sonarr
- These now 'loose' torrents are ensured to meet any minumum seeding requirements for your tracker, and then seamlessly deleted, freeing up your storage space!

But what is meant by a 'loose' torrent? Let's explore the concept of hardlinking.

# Hardlinking 🔗

Hardlinking is enabled in YAMS by default, **and required for this guide to work, with no exceptions.** To verify if hardlinking is enabled in your setup,