---
title: "FAQs"
date: 2023-01-11T09:11:29-03:00
draft: false
weight: 100
---

## Common `docker` permission errors

If you are getting errors like this when running the installer or running the `yams` cli:

```sh
permission denied while trying to connect to the Docker daemon socket at unix:///var/run/docker.sock:
```

It might mean that you need to reload your user. This is fixed by logging out of your server and logging back in.

This happens because your user needs to be part of the `docker` group in order to be able to execute `docker` without `sudo`

## Why did you choose <this_software> instead of <that_software>?

Because. That's why it's _**opinionated**_, you don't _necessarily_ have to agree with me. This setup is aimed at noobs and first time media server enthusiasts. You can always use my sources and fork the project 🔥

