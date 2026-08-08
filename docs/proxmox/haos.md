# HAOS VM
The Community Scripts **Home Assistant OS VM** script creates a proper Proxmox VM using the official Home Assistant OS KVM/qcow2 image. It handles downloading the image, creating the VM, importing the disk, configuring the boot device, and starting the VM. ([Proxmox VE Helper-Scripts][1])

> [Home Assistant OS VM script](https://community-scripts.org/scripts/haos-vm)

### Current state
Given your existing Proxmox setup, I'd create HAOS as a **separate VM**, rather than an LXC/container.

Use **Advanced Settings** in the script rather than blindly accepting every default.
```bash
Using HAOS Version: 18.2
  🆔  Virtual Machine ID: 102
  📦  Machine Type: q35
  💾  Disk Size: 32G
  💾  Disk Cache: Write Through
  🏠  Hostname: home-assitant
  🖥️  CPU Model: Host
  🧠  CPU Cores: 2
  🛠️  RAM Size: 4096
  🌉  Bridge: vmbr0
  🔗  MAC Address: <ADDRESS>
  🏷️  VLAN: Default
  ⚙️  Interface MTU Size: Default
Start VM when completed: yes
```

The current script supports selecting Stable/Beta/Dev HAOS versions, VM ID, storage, CPU/RAM, bridge, VLAN, startup behavior, etc. ([Gitea: Git with a cup of tea][2])

### Then run it on Proxmox
Open **Proxmox → your node → Shell** and run:
```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/vm/haos-vm.sh)"
```

That's the current installation command published by the script. ([Proxmox VE Helper-Scripts][1])

I would **not** install the Docker/container version. HAOS is the better fit for what you're building because you specifically want Home Assistant OS, and it keeps Home Assistant isolated from your Docker-host VM. The container variant also doesn't provide Home Assistant add-ons. ([Proxmox VE Helper-Scripts][3])

### After the VM is created

Don't immediately start configuring monitoring.

Let's do this in stages:

```text
Proxmox
   │
   ├── VM 100? ── existing infrastructure
   ├── VM 101 ── docker-host
   │              └── Prometheus/Grafana/Loki/etc.
   │
   └── VM 102 ── home-assistant
                  └── Home Assistant OS
```

Then we'll:

1. Confirm HAOS booted correctly.
2. Find its IP.
3. Open the Home Assistant onboarding page.
4. Configure a **static DHCP lease** for HA.
5. Get your first devices/integrations working.
6. Add **Home Assistant metrics to Prometheus**.
7. Add HA to your Grafana monitoring.
8. Later, integrate Proxmox monitoring into HA if useful — Home Assistant has an official Proxmox VE integration for monitoring VMs/containers. ([Home Assistant][4])

**So yes: use that script.** It's a good fit for the architecture we've already built.

If you're at the Proxmox shell now, run the command above and **paste the script's first configuration screen here**. I'll walk you through each option before you create VM 102.

[1]: https://community-scripts.org/scripts/haos-vm?utm_source=chatgpt.com "Home Assistant OS | Proxmox VE Helper Scripts"
[2]: https://git.community-scripts.org/community-scripts/ProxmoxVE/src/commit/101c9eb122ca9ab4a74e6aa096f53bd17c1710e1/vm/haos-vm.sh?utm_source=chatgpt.com "ProxmoxVE/vm/haos-vm.sh at 101c9eb122ca9ab4a74e6aa096f53bd17c1710e1 - ProxmoxVE - Gitea: Git with a cup of tea"
[3]: https://community-scripts.org/scripts/homeassistant?id=homeassistant&utm_source=chatgpt.com "Home Assistant Container | Proxmox VE Helper Scripts"
[4]: https://www.home-assistant.io/integrations/proxmoxve/?utm_source=chatgpt.com "Proxmox VE - Home Assistant"

