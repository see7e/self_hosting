# Apps
- [Watchtower](https://github.com/containrrr/watchtower): to keep the containers updated automatically.
- [Fail2ban](https://www.fail2ban.org/): to protect the server from brute-force attacks.
- [Crowdsec](https://crowdsec.net/): to protect the server from various types of attacks using a community-driven approach.
- auth
  - [aithentik](https://goauthentik.io/): to manage authentication and authorization.
  - [authelia](https://www.authelia.com/): to provide 2FA and SSO.
  - [mTLS](https://www.cloudflare.com/learning/access-management/what-is-mutual-tls/)
- monitoring/alerts
  - [zabbix](https://www.zabbix.com/): to monitor the server and applications.
  - [prometheus](https://prometheus.io/): to monitor the server and applications
  - [grafana](https://grafana.com/): to visualize the monitoring data.
  - [ntffy](https://ntfy.sh/): to send notifications to mobile devices.
  - [beszel](https://beszel.dev/): to send notifications to various platforms.
- honeypots
  - [opencanary](https://opencanary.org/): to detect unauthorized access attempts.
- network segmentation
    - [pfsense](https://www.pfsense.org/): to create a firewall and router.
    - [opnsense](https://opnsense.org/): to create a firewall and router.

# References
- [ImranR98](https://www.youtube.com/watch?v=U9NgRShXFgk) ![landscape](<src/img/Screenshot 2025-11-17 191804.png>)

---
Container RAM estimates

Inside the Ubuntu VM:

| Service       |                         Typical RAM |
| ------------- | ----------------------------------: |
| Glance        |                           50–150 MB |
| Grafana       |                          250–400 MB |
| Prometheus    |                         400 MB–1 GB |
| Loki          |                          300–700 MB |
| Promtail      |                             <100 MB |
| Node Exporter |                              <50 MB |
| cAdvisor      |                           50–150 MB |
| Jellyfin      |  200–500 MB (excluding transcoding) |
| Immich Server |                          300–700 MB |
| Immich ML     | 1–4 GB (avoid or use a small model) |
| OpenCloud     |                          300–600 MB |
| Firefly III   |                          150–300 MB |
| MQTT          |                              <50 MB |
| ThingsBoard*  |      800 MB–2 GB (Java application) |


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

