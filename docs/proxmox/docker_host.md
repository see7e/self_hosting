---
title: Docker Host
iso: ubuntu-26.04-live-server-amd64
ip: 192.168.1.108
---

Machine settings:

| Setting    | Value                                      | Explanation                                                                                                                                                                                              |
| ---------- | ------------------------------------------ | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `agent`    | `1`                                        | Enables the **QEMU Guest Agent**. If installed inside the VM, Proxmox can get the VM's IP address, perform clean shutdowns, freeze filesystems for backups, and more.                                    |
| `bios`     | `ovmf`                                     | Uses **UEFI firmware** instead of legacy BIOS. This is recommended for modern operating systems like Ubuntu 26.04.                                                                                       |
| `cores`    | `4`                                        | The VM has **4 CPU cores** assigned.                                                                                                                                                                     |
| `cpu`      | `host`                                     | Exposes the host CPU directly to the VM, allowing it to use all supported CPU features. This generally gives the best performance, though it can reduce migration compatibility between different hosts. |
| `efidisk0` | `local-lvm:1,efitype=4m,...`               | Small EFI partition that stores UEFI boot variables. Required when using `bios=ovmf`.                                                                                                                    |
| `ide2`     | `local:iso/ubuntu-26.04-live-server-am...` | Ubuntu installation ISO attached as a virtual CD/DVD drive. This is typically used during installation and can be removed afterward.                                                                     |
| `machine`  | `q35`                                      | Uses the modern **Q35 chipset** emulation, which supports PCIe devices and is preferred for newer operating systems.                                                                                     |
| `memory`   | `8192`                                     | The VM has **8 GB of RAM**.                                                                                                                                                                              |
| `name`     | `docker-host`                              | Friendly name of the VM.                                                                                                                                                                                 |
| `net0`     | `virtio,bridge=vmbr0,firewall=1`           | One virtual network interface using the **VirtIO** driver (high performance), connected to bridge `vmbr0`. Proxmox firewall is enabled for this interface.                                               |
| `nodename` | `pve`                                      | The Proxmox node hosting this VM is named `pve`.                                                                                                                                                         |
| `numa`     | `0`                                        | NUMA awareness is disabled. This is fine for most small VMs.                                                                                                                                             |
| `onboot`   | `1`                                        | VM automatically starts when the Proxmox host boots.                                                                                                                                                     |
| `ostype`   | `l26`                                      | Optimized for a Linux 2.6+ kernel (used for virtually all modern Linux distributions).                                                                                                                   |
| `scsi0`    | `local-lvm:40,iothread=on`                 | Main virtual disk: **40 GB**, stored on `local-lvm`. `iothread=on` improves disk performance, especially under heavier workloads.                                                                        |
| `scsihw`   | `virtio-scsi-single`                       | Uses the VirtIO SCSI controller. This provides excellent performance and supports features like I/O threads.                                                                                             |
| `sockets`  | `1`                                        | VM presents one CPU socket. Combined with `cores=4`, the guest sees **1 socket × 4 cores**.                                                                                                              |
| `startup`  | `order=2,up=30,down=120`                   | Boot order settings: start second among configured VMs, wait 30 seconds before starting it after the previous VM, and allow up to 120 seconds for shutdown.                                              |
| `vmid`     | `101`                                      | Internal Proxmox identifier for the VM.                                                                                                                                                                  |

---


# System info
```bash
root@docker:/home/dockeradmin# hostnamectl
#  Static hostname: docker
#        Icon name: computer-vm
#          Chassis: vm 🖴
#       Machine ID: 7057a25e099245469708ce8d96f493e1
#          Boot ID: 7109bca25b4c46209065173a1696e9e8
#     Product UUID: 7057a25e-0992-4546-9708-ce8d96f493e1
#   Virtualization: kvm
# Operating System: Ubuntu 26.04 LTS
#           Kernel: Linux 7.0.0-28-generic
#     Architecture: x86-64
#  Hardware Vendor: QEMU
#   Hardware Model: Standard PC _Q35 + ICH9, 2009_
# Hardware Version: pc-q35-11.0
# Firmware Version: 4.2025.05-2
#    Firmware Date: Thu 2025-11-13
#     Firmware Age: 8month 2w 6d
root@docker:/home/dockeradmin# timedatectl
#                Local time: Mon 2026-08-03 16:44:02 UTC
#            Universal time: Mon 2026-08-03 16:44:02 UTC
#                  RTC time: Mon 2026-08-03 16:44:02
#                 Time zone: Etc/UTC (UTC, +0000)
# System clock synchronized: yes
#               NTP service: active
#           RTC in local TZ: no
root@docker:/home/dockeradmin# localectl
# System Locale: LANG=C.UTF-8
#     VC Keymap: (unset)
#    X11 Layout: us
#     X11 Model: pc105
```

# Docker Installation & Daemon Configuration
Rather than just installing Docker, I'd like to establish a few design principles first.

## Design Goals
Our Docker host should be:
* **Minimal** – only Docker and supporting tools on the host.
* **Reproducible** – rebuilding the VM should take less than an hour.
* **Secure** – minimize privileges and exposed services.
* **Maintainable** – clear directory structure and configuration.
* **Observable** – logging and metrics from day one.

## Install Docker

I recommend using Docker's official repository instead of Ubuntu's package.

Reasons:
* Faster updates
* Officially supported packages
* Consistent behavior across distributions
* Includes Buildx and Compose plugin

After installation, verify:

```bash
dockeradmin@docker-host:~$ docker version
docker compose version
docker info
# Client: Docker Engine - Community
#  Version:           29.7.1
#  API version:       1.55
#  Go version:        go1.26.5
#  Git commit:        e9452d6
#  Built:             Fri Jul 31 17:06:16 2026
#  OS/Arch:           linux/amd64
#  Context:           default
# permission denied while trying to connect to the docker API at unix:///var/run/docker.sock
# Docker Compose version v5.4.0
# Client: Docker Engine - Community
#  Version:    29.7.1
#  Context:    default
#  Debug Mode: false
#  Plugins:
#   buildx: Docker Buildx (Docker Inc.)
#     Version:  v0.36.0
#     Path:     /usr/libexec/docker/cli-plugins/docker-buildx
#   compose: Docker Compose (Docker Inc.)
#     Version:  v5.4.0
#     Path:     /usr/libexec/docker/cli-plugins/docker-compose
#
# Server:
# permission denied while trying to connect to the docker API at unix:///var/run/docker.sock
```

> [!error] permission denied while trying to connect to the docker API at unix:///var/run/docker.sock
> Just confirmed if the current user is in the `docker` group, if not then just:
> ```bash
> sudo usermod -aG docker $USER
> ```

## Enable Docker at Boot

Verify:
```bash
systemctl is-enabled docker
systemctl is-enabled containerd
```

Both should return `enabled`

## Decide on the Docker Data Root
By default, Docker stores everything under: `/var/lib/docker`. For the current setup, I **recommend keeping it there**.

Many homelab guides move it to `/srv` or a mounted disk, but I don't think it's worth the extra complexity here because:

* Your VM has a dedicated virtual disk.
* `/var/lib/docker` is the standard location.
* Most documentation assumes the default.
* Recovery is simpler.
* Backups are straightforward with Proxmox.

The only data we'll intentionally place elsewhere is persistent application data.

## Configure the Docker Daemon
We'll create: `/etc/docker/daemon.json`. My recommended starting configuration is:
```json
{
  "log-driver": "local",
  "log-opts": {
    "max-size": "10m",
    "max-file": "5"
  },
  "live-restore": true,
  "features": {
    "buildkit": true
  }
}
```

### Why these settings?

#### `log-driver: local`

Docker defaults to the `json-file` driver, which can grow indefinitely if log rotation isn't configured. The `local` driver is more space-efficient and still supports `docker logs`.

#### Log rotation

```json
"max-size": "10m",
"max-file": "5"
```

Caps each container's logs at roughly 50 MB, preventing a noisy service from filling the VM's disk.

#### `live-restore`

Keeps containers running if the Docker daemon restarts unexpectedly, reducing service interruptions.

#### BuildKit

Enables the modern Docker build engine with better performance and caching.

## Restart Docker
```bash
sudo systemctl restart docker
```

Confirm the daemon starts cleanly:

```bash
systemctl status docker
```

## Verify the Installation

Run:
```bash
docker run hello-world
```

If it prints the success message, Docker is working end-to-end.

> [!note]
> **Before We Move On: One Design Decision**
> After Docker is installed, the next major topic is how we'll organize everything on disk. This is where many homelabs become difficult to maintain. 
> ```text
> DH
>├── /opt/docker/
>│   ├── compose/
>│   ├── configs/
>│   ├── scripts/
>│   └── templates/
> OMV
> ├── .infra/
> │   ├── docker/
> │   |   ├── grafana/
> │   |   ├── prometheus/
> │   |   ├── loki/
> │   |   ├── promtail/
> │   |   ├── cadvisor/
> │   |   ├── jellyfin/
> │   |   ├── immich/
> │   |   ├── firefly/
> │   |   ├── postgres/
> │   |   ├── redis/
> │   |   ├── opencloud/
> │   |   ├── mosquitto/
> │   |   └── thingsboard/
> │   ├── backups/
> │   └── snapshots/
> ├── shared/
> │   ├── media/
> │   |   ├── movies/
> │   |   ├── shows/
> ```
> The idea is to separate:
> - **Infrastructure as code** (`/opt/docker`) — Compose files, scripts, configuration templates, version-controlled in Git.
> - **Runtime data** (`/srv`) — Databases, uploaded media, application state, and other persistent data.
> This separation makes backups, migrations, and disaster recovery much cleaner.

## NFS
> [!note]
> NFS shares were added and the info is in the [omv](./omv.md). To test the connection (at the docker-host):
> ```bash
> sudo apt install nfs-common # if not installed
> Export list for 192.168.1.107:
> /export        192.168.1.108
> /export/shared 192.168.1.108
> /export/.infra 192.168.1.108
> ```

### `/etc/fstab`

Once the manual mounts work, I'd use:

```fstab
192.168.1.107:/.infra  /mnt/omv/.infra  nfs4  vers=4.2,_netdev,nofail,x-systemd.automount  0  0
192.168.1.107:/shared  /mnt/omv/shared  nfs4  vers=4.2,_netdev,nofail,x-systemd.automount  0  0
```

I deliberately recommend:
* `vers=4.2` → use the newest protocol both ends support.
* `_netdev` → wait for networking.
* `nofail` → don't block boot if OMV is temporarily unavailable.
* `x-systemd.automount` → mount on first access instead of during boot, which avoids race conditions after power outages.

```bash
dockeradmin@docker-host:~$ sudo mount -a
mount.nfs4: mount point /mnt/omv/.infra does not exist
mount: (hint) your fstab has been modified, but systemd still uses
       the old version; use 'systemctl daemon-reload' to reload.
mount.nfs4: mount point /mnt/omv/shared does not exist
dockeradmin@docker-host:~$ cat /etc/fstab
# /etc/fstab: static file system information.
#
# Use 'blkid' to print the universally unique identifier for a
# device; this may be used with UUID= as a more robust way to name devices
# that works even if disks are added and removed. See fstab(5).
#
# <file system> <mount point>   <type>  <options>       <dump>  <pass>
# / was on /dev/ubuntu-vg/ubuntu-lv during curtin installation
/dev/disk/by-id/dm-uuid-LVM-5ddQaCBTIGN0eBvszdKfBt0mqFOzX9dTXds1bIk3fpvLkhqnlF4VWewLX7NGenqo / ext4 defaults 0 1
# /boot was on /dev/sda2 during curtin installation
/dev/disk/by-uuid/40f0f8ff-3f86-4cac-a67e-b84d672e8726 /boot ext4 defaults 0 1
# /boot/efi was on /dev/sda1 during curtin installation
/dev/disk/by-uuid/12D2-7628 /boot/efi vfat defaults 0 1
# OMV Shares
192.168.1.107:/.infra  /mnt/omv/.infra  nfs4  vers=4.2,_netdev,nofail,x-systemd.automount  0  0
192.168.1.107:/shared  /mnt/omv/shared  nfs4  vers=4.2,_netdev,nofail,x-systemd.automount  0  0
```

> [!error] 
> Make sure that the folders exists:
> ```bash
> sudo mkdir -p /mnt/omv/.infra
> sudo mkdir -p /mnt/omv/shared
> ```

Then again:
```bash
sudo systemctl daemon-reload
# ==== AUTHENTICATING FOR org.freedesktop.systemd1.reload-daemon ====
# Authentication is required to reload the systemd state.
# Authenticating as: docker-host (dockeradmin)
# Password:
# ==== AUTHENTICATION COMPLETE ====
sudo mount -a
```

## Last configurations

- Create `/opt/docker`: `sudo mkdir -p /opt/docker/{compose,configs,scripts,templates,docs,.envs}`
- Initialize Git: `git init -b=main`
  ```bash
  drwxr-xr-x 9 root root 4096 Aug  4 07:37 .
  drwxr-xr-x 4 root root 4096 Aug  4 07:34 ..
  drwxr-xr-x 2 root root 4096 Aug  4 07:34 .envs
  drwxr-xr-x 6 root root 4096 Aug  4 07:37 .git
  drwxr-xr-x 2 root root 4096 Aug  4 07:34 compose
  drwxr-xr-x 2 root root 4096 Aug  4 07:34 configs
  drwxr-xr-x 2 root root 4096 Aug  4 07:34 docs
  drwxr-xr-x 2 root root 4096 Aug  4 07:34 scripts
  drwxr-xr-x 2 root root 4096 Aug  4 07:34 templates
  ```

### Custom Docker Networks
| Network      | Purpose                      | Internet Access         | Notes                              |
| ------------ | ---------------------------- | ----------------------- | ---------------------------------- |
| `proxy`      | Services exposed to users    | Yes (via reverse proxy) | Entry point for web applications   |
| `backend`    | Internal application traffic | No direct exposure      | Databases, caches, message brokers |
| `monitoring` | Metrics and logging          | No direct exposure      | Observability stack                |


```bash
dockeradmin@docker-host:/opt/docker$ docker network create proxy
# e0ea36b4f4782720af46b3c6950e6c82734934dccceb5fdba1996faff05af3f8
dockeradmin@docker-host:/opt/docker$ docker network create monitoring
# c745024f224fea5138d95059f678f882077a8b8845b1900af4bca6b0d84971db
dockeradmin@docker-host:/opt/docker$ docker network create backend
# faf30614fac8bedd78249a15e425efeab75a6f37ed7c1d6b7126be3e7d42a5ef
```

# Docker Stacks
At dedicated [docker-host documentation](../../docker-host/docs/README.md)

---

> ### One thing I'd test before deploying containers
> Since the exports use **`root_squash`**, verify that the Docker VM can actually write to the directories with the user IDs you'll be using.
> For example:
> ```bash
> touch /mnt/omv/.infra/test
> rm /mnt/omv/.infra/test
> ```
> and then later, once you've decided on a common UID/GID for your containers (often `1000:1000` for a homelab), test creating a file as that user. It's much easier to solve permission mapping now than after Grafana, Immich, or PostgreSQL have already created data. This will be the last infrastructure check before we start adapting your Compose stacks.

Even though Docker is on the same machine, `/mnt/omv/...` is backed by an NFS export. NFS has its own permission model, and if the export uses `root_squash` (the default), or if the filesystem permissions don't allow UID `65534` to write, you'll get exactly:
```bash
open /prometheus/queries.active: permission denied
```

because Prometheus is trying to create a new file as UID `65534`. Testing with `acl`:
```bash
dockeradmin@docker-host:/opt/docker/compose/monitoring$ getfacl /mnt/omv/.infra/docker/prometheus/data
# getfacl: Removing leading '/' from absolute path names
# # file: mnt/omv/.infra/docker/prometheus/data
# # owner: root
# # group: users
# # flags: -s-
# user::rwx
# group::r-x
# other::r-x
```

There's two choices to solve this: the easy way or the hard way:
- easy: change ownership from root to prometheus / use ACL to grant permission without changing ownership
- hard: keep the time series db (TSDB) within the Docker VM and set a backup job to store in the OMV
