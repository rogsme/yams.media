---
title: "SABnzbd"
date: 2023-01-10T18:02:13-03:00
weight: 2
draft: false
summary: SABnzbd is a program to download binary files from Usenet servers. Many people upload all sorts of interesting material to Usenet and you need a special program to get this material with the least effort.
---

## What is SABnzbd?

From their [website](https://sabnzbd.org/):

> SABnzbd is a program to download binary files from Usenet servers. Many people upload all sorts of interesting material to Usenet and you need a special program to get this material with the least effort.

So, SABnzbd is going to allow us to download binaries from Usenet servers. Pretty cool!

## Initial configuration

In your browser, go to [http://{your-ip-address}:8080/]() and you'll see SABnzbd setup page. First, choose your language and click on "Start Wizard":

[![sabnzbd-1](/pics/sabnzbd-1.png)](/pics/sabnzbd-1.png)

After choosing your language, you'll be prompted to choose a server. Newshosting usually has good deals, so it's a good choice, but you can always use whatever server you want. 

When you have your server information ready, click on "Next".

[![sabnzbd-2](/pics/sabnzbd-2.png)](/pics/sabnzbd-2.png)

You should now see the final page on the wizard, congratulations!

You'll also notice that the Completed and Incompleted download folders are not in the right location. We'll fix that in a bit.

Finally, click on "Go to SABnzbd".

[![sabnzbd-3](/pics/sabnzbd-3.png)](/pics/sabnzbd-3.png)

Now, go to the setting page by clicking on the cog-wheel at the top right

[![sabnzbd-4](/pics/sabnzbd-4.png)](/pics/sabnzbd-4.png)

On the settings page, click on "Folders" and:
- Set your "Temporary Download Folder" to `/data/downloads/usenet/incomplete`.
- Set your "Completed Download Folder" to `/data/downloads/usenet/complete`.
- Click on "Save Changes"

[![sabnzbd-5](/pics/sabnzbd-5.png)](/pics/sabnzbd-5.png)

## That's done!

Excellent! Now we can move forward with [Radarr](/config/radarr).
