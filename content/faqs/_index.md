---
title: "FAQs"
date: 2023-01-11T09:11:29-03:00
draft: false
weight: 100
---

## Why did you choose <this_software> instead of <that_software>?

Because. That's why it's _**opinionated**_, you don't _necessarily_ have to agree with me. This setup is aimed at noobs and first time media server enthusiasts. You can always use my sources and fork the project 🔥

## I want to use YAMS in Windows. Can I do that?

You might have success running YAMS manually in Windows with `docker`, but I recommend you check out [WIMPS](https://github.com/Xaque8787/WIMPS), a YAMS inspired setup for Windows. Although the project has been archived, it could provide a better starting point than YAMS.

## YAMS's configuration is too basic. I want more!

And you shall receive! If you want a more deep configuration, I strongly recommend you checking out [TRaSH Guides](https://trash-guides.info/). The configurations there are extensive and very specific, I strongly recommend them!

## Can I add more containers to the VPN network?

Yes, you can!

Go to [this link](https://github.com/qdm12/gluetun-wiki/blob/main/setup/connect-a-container-to-gluetun.md) and follow the instructions! For reference, your docker-compose file should be in `your/install/location/docker-compose.yaml`. If you used the default install location, it should be in `/opt/yams/docker-compose.yaml`.
