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

So basically, SABnzbd is going to help us download stuff from Usenet servers. Pretty cool! 😎

## Initial configuration

In your browser, go to [http://{your-ip-address}:8080/]() and you'll see SABnzbd's setup page. First, choose your language and click on "Start Wizard":

[![sabnzbd-1](/pics/sabnzbd-1.png)](/pics/sabnzbd-1.png)

Next up, you'll need to choose a Usenet server. [Newshosting](https://www.newshosting.com/) usually has good deals going on, but you can use whatever server you prefer! 

When you've got your server details ready, input them and click on "Next".

[![sabnzbd-2](/pics/sabnzbd-2.png)](/pics/sabnzbd-2.png)

You should now see the final wizard page - congrats! 🎉 

You'll notice the Completed and Uncompleted download folders aren't quite where we want them. Don't worry, we'll fix that in a minute!

For now, just click on "Go to SABnzbd".

[![sabnzbd-3](/pics/sabnzbd-3.png)](/pics/sabnzbd-3.png)

Head over to the settings page by clicking on the cog-wheel icon in the top right.

[![sabnzbd-4](/pics/sabnzbd-4.png)](/pics/sabnzbd-4.png)

On the "General" page, set the "External internet access" to "Full API" and click on "Save Changes"

[![sabnzbd-7](/pics/sabnzbd-7.png)](/pics/sabnzbd-7.png)

Now, click on "Folders" and let's get those paths sorted:
- Set your "Temporary Download Folder" to `/data/downloads/usenet/incomplete`
- Set your "Completed Download Folder" to `/data/downloads/usenet/complete`
- Click on "Save Changes"

[![sabnzbd-5](/pics/sabnzbd-5.png)](/pics/sabnzbd-5.png)

## Getting your API key for Sonarr and Radarr

You'll need this API key later when we set up Radarr and Sonarr. Feel free to skip this section for now if you want - you can always come back! 

To get your API key:

First, head back to the settings.

[![sabnzbd-4](/pics/sabnzbd-4.png)](/pics/sabnzbd-4.png)

Then, go to "General" and scroll down to "Security". You'll find your API Key right there!

[![sabnzbd-6](/pics/sabnzbd-6.png)](/pics/sabnzbd-6.png)

## That's done! 🎉

Excellent! Now we can move forward with [Radarr](/config/radarr). Get ready - this is where things start getting really fun! 😄
