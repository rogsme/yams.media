---
title: "Proxmox LXC Prerequisites"
date: 2025-03-29T10:00:00-03:00 
draft: false
weight: 1
summary: Required steps before installing YAMS in a Proxmox LXC container.
---

# Prerequisites for Installing YAMS in a Proxmox LXC

If you plan to install YAMS inside a Proxmox LXC container, some specific host-level configuration is required **before** you run the YAMS installation script. These steps ensure Docker and the VPN component (Gluetun) can function correctly within the LXC environment by providing access to the necessary TUN device.

> **Note:** This guide is based on the solution discovered and shared by forum user **Bobs_Manager**. You can find the original discussion [here on the YAMS Forum](https://forum.yams.media/viewtopic.php?t=212).

⚠️ **Important:** Only use an **unprivileged** LXC container for YAMS. Privileged containers pose significant security risks and are not recommended.

Follow these steps on your Proxmox **host** system:

1.  **Access the Proxmox Host Shell:** Log into your Proxmox server via SSH or use the web UI's shell access for the node (not the LXC console).

2.  **Edit the LXC Configuration File:** Open the configuration file specific to the LXC container where you intend to install YAMS. Replace `<container-ID>` with the actual numeric ID of your LXC container.
    ```bash
    nano /etc/pve/lxc/<container-ID>.conf
    ```

3.  **Add Configuration Lines:** Append the following lines to the **end** of the file. These lines grant the container necessary permissions and crucially mount the `/dev/net/tun` device from the host into the container.
    ```ini
    lxc.cgroup.devices.allow: a
    lxc.cap.drop:
    lxc.cgroup2.devices.allow: c 10:200 rwm
    lxc.mount.entry: /dev/net/tun dev/net/tun none bind,create=file
    ```
    Your configuration file should now look similar to this at the end:
    [![Proxmox LXC Config Example](/pics/proxmox-lxc-config.png)](/pics/proxmox-lxc-config.png)

4.  **Save and Close:** Save the changes to the configuration file and exit the editor.

5.  **Restart the LXC Container:** For the changes to take effect, you must restart the LXC container. You can do this via the Proxmox web UI or using the following commands on the Proxmox host:
    ```bash
    pct stop <container-ID>
    pct start <container-ID>
    ```

## Next Steps

After completing these prerequisites and restarting the LXC container, you can now log into the LXC container's console and proceed with the standard YAMS installation as described in the [Installation Guide](/install/steps/).
