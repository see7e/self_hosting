The homelab is split into two distinct roles:

* **Raspberry Pi 4** hosts the core network infrastructure that should remain available even if the Proxmox server is offline or undergoing maintenance.
* **Proxmox VE** hosts applications, media services, monitoring, and IoT workloads using virtual machines and Docker.

This separation improves reliability, simplifies maintenance, and provides a clean foundation for future expansion.

```
Internet
    │
Router
    │
────────────── LAN ──────────────
│                               │
│                          Raspberry Pi 4
│                          ├── AdGuard Home
│                          ├── WireGuard
│                          ├── Unbound (optional)
│                          └── Node Exporter
│
└── Proxmox VE https://192.168.1.200:8006
        │
        ├── VM: Home Assistant OS              # IoT
        │
        ├── VM: Ubuntu Server Minimal          # Docker Host
        │   ├── Glance                         # Dashboard
        │   │
        │   ├── Media
        │   │   ├── Jellyfin
        │   │   └── Immich (small/no ML model)
        │   │
        │   ├── Monitoring
        │   │   ├── Grafana
        │   │   ├── Prometheus
        │   │   ├── Node Exporter
        │   │   ├── Promtail
        │   │   ├── Loki
        │   │   ├── cAdvisor
        │   │   └── garmin-grafana (development)
        │   │
        │   ├── Storage & Files
        │   │   ├── OpenMediaVault
        │   │   └── OpenCloud
        │   │
        │   ├── IoT
        │   │   ├── ThingsBoard
        │   │   └── MQTT Broker
        │   │
        │   ├── Finance
        │   │   └── Firefly III
        │   │
        │   └── Other Docker services
        │
        ├── LXC: WireGuard (future)
        ├── LXC: Tailscale / WireGuard
        └── LXC: Caddy or Nginx Reverse Proxy (optional)
```

# Proxmox Layout
For a Proxmox homelab setup, keep Home Assistant OS as its own dedicated VM because it is a complete appliance with its own operating system, Supervisor, and update system. Treat it differently from normal applications.

For the rest of your services, avoid creating a VM for every application. A more practical architecture is to create a dedicated Linux server VM as your Docker host and run applications there using Docker Compose. Use a minimal server installation (no desktop environment), with only SSH, Docker, and Docker Compose installed.



***

# Raspberry Pi 4

The Raspberry Pi serves as the **network infrastructure node**. Services hosted here should continue operating independently of Proxmox.

## AdGuard Home

Provides network-wide DNS filtering and ad blocking.

Keeping DNS on the Raspberry Pi ensures name resolution remains available even while the Proxmox server is rebooting or undergoing maintenance.

## WireGuard

Provides secure remote VPN access to the home network.

Hosting the VPN endpoint outside Proxmox guarantees remote administrative access even if the virtualization host is unavailable.

## Unbound (Optional)

Acts as a local recursive DNS resolver.

Benefits include:

* improved privacy
* reduced reliance on public DNS providers
* local DNS caching

Typical flow:

```
Clients
   │
AdGuard Home
   │
Unbound
   │
Root DNS Servers
```

## Node Exporter

Exports Raspberry Pi system metrics to Prometheus.

Typical metrics include:

* CPU usage
* memory usage
* storage utilization
* network throughput
* CPU temperature

---

# Proxmox VE
Proxmox hosts virtual machines dedicated to applications and services. Virtual Machines and Linux Containers serve different purposes:

A VM is a complete virtual computer. It has its own virtual hardware, operating system, and kernel. It provides stronger isolation and can run different operating systems such as Windows, Linux, BSD, or Home Assistant OS. The trade-off is higher resource usage.

An LXC container is a lightweight Linux environment that shares the Proxmox host kernel. It has its own filesystem, users, and network, but it is much lighter than a VM. LXCs are ideal for simple infrastructure services such as WireGuard, Pi-hole, AdGuard Home, Caddy, or monitoring tools.

For the Docker host, use Ubuntu Server Minimal or Debian. Avoid the full desktop installation because it adds unnecessary packages and services. The goal is a small, stable server dedicated to running containers.

A good deployment order is:

1. Install Proxmox.
2. Create the Home Assistant OS VM.
3. Create the Docker host VM with Ubuntu Server Minimal or Debian.
4. Deploy your applications with Docker Compose.
5. Add monitoring (Prometheus/Grafana) after services are running.
6. Add WireGuard for remote access later.
7. Add a reverse proxy only if you need public domains, HTTPS, or easier access to multiple services.

> Links
> - https://www.home-assistant.io/installation/generic-x86-64/
> - https://pve.proxmox.com/pve-docs/
> - [Proxmox VE Scripts](https://community-scripts.org)


Apps:

## Home Assistant OS

Dedicated virtual machine responsible for home automation.

Keeping Home Assistant isolated makes upgrades, backups, and device integrations straightforward.

---

## Ubuntu Server Minimal (Docker Host)

Rather than deploying dozens of individual LXCs, a single lightweight Ubuntu Server VM runs Docker and Docker Compose.

Benefits include:

* simplified management
* version-controlled Docker Compose files
* straightforward upgrades
* excellent portability
* minimal virtualization overhead

### Dashboard
#### Glance

### Media
#### Jellyfin
#### Immich
##### 1. Disable or reduce Machine Learning (biggest win)
Immich's ML container is usually the largest RAM consumer.

It provides:
* face recognition
* object recognition
* smart search
* duplicate detection features

If you don't care about "find all pictures with dogs/cars/person X", you can reduce the footprint significantly. Options:

###### Disable ML completely
You lose:
* face recognition
* smart search
* AI classification

You keep:
* upload
* albums
* timeline
* sharing
* browsing
* metadata

For many people this is enough.

##### 2. Use smaller ML models
If you want some AI features, you can choose lighter models. The trade-off:

| Model size | RAM     | Accuracy |
| ---------- | ------- | -------- |
| Small      | Lower   | Good     |
| Medium     | Higher  | Better   |
| Large      | Highest | Best     |

For a home server, small models are usually fine.

##### 3. Avoid constant background processing
A lot of RAM/CPU spikes happen when:
* importing a large photo library
* generating thumbnails
* indexing faces
* transcoding videos

A good approach:
1. Import everything once.
2. Let Immich finish processing.
3. Keep it running normally.

The steady-state usage is much lower than the initial migration.

##### 4. Limit video transcoding
Videos are expensive. If your phones upload:
* 4K videos
* HDR videos
* HEVC formats

processing can become heavy. You can configure Immich to avoid unnecessary transcoding depending on your devices.

##### 5. Tune PostgreSQL
Immich uses PostgreSQL. For a home installation you usually don't need aggressive database settings. Reducing PostgreSQL memory parameters can save RAM, especially on small machines.

##### 6. Run ML only when needed
A nice compromise:
```text
Normal operation:
Immich server
Postgres
Redis

Occasionally:
Enable ML
Process new photos
Disable again
```

If you don't need instant AI indexing, this works well.

##### 7. Use hardware acceleration if available
If your server has:
* Intel Quick Sync
* NVIDIA GPU
* AMD GPU

you can move some video processing away from the CPU. This doesn't always reduce RAM directly, but it reduces processing time and system load.

***
### Monitoring

* Grafana
* Prometheus
* Loki
* Promtail
* Node Exporter
* cAdvisor
* garmin-grafana (development)

### Storage & File Services

* OpenMediaVault
* OpenCloud

### IoT

* ThingsBoard
* MQTT Broker

### Finance

* Firefly III

### Additional Services

Future Docker services can be added without modifying the Proxmox VM layout.

---

# Optional LXCs

Some lightweight infrastructure services may later be moved into dedicated LXCs.

Examples include:

* WireGuard
* Tailscale
* Caddy
* Nginx Reverse Proxy

Keeping these isolated makes experimentation easier while avoiding unnecessary virtual machines.

---

# Monitoring Architecture

Monitoring spans both the Raspberry Pi and the Proxmox environment.

```
                    Prometheus
                   /     |      \
                  /      |       \
                 /       |        \
      Raspberry Pi   Proxmox     Docker
     Node Exporter    Exporter   cAdvisor
           │              │          │
           └──────────────┴──────────┘
                         │
                      Grafana
```

This provides a unified view of:

* Raspberry Pi health
* Proxmox node resources
* virtual machine utilization
* Docker container metrics
* storage usage
* network throughput
* temperatures
* application-specific dashboards

Grafana can correlate metrics across the entire stack, allowing you to drill down from Proxmox host utilization to individual Docker containers.

---

# Design Principles

This architecture follows a few guiding principles:

* **Infrastructure and applications are separated.**
* **Critical network services remain operational during Proxmox maintenance.**
* **Docker is the primary platform for self-hosted applications.**
* **Virtual machines are reserved for operating systems that benefit from isolation (e.g., Home Assistant OS).**
* **Monitoring is centralized through Prometheus and Grafana.**
* **The environment is designed to grow incrementally without requiring major architectural changes.**

