# INFO

u=see7ee
id -u see7e=1000
id -g see7e=100

# Instalations

Previously I was building everything from scratch using the Docker containers via command line, but after I discovered that OMV now has included the container management as Portainer, so all the `.yml` files will be included there when following the steps of this [guide](https://forum.openmediavault.org/index.php?thread/48003-guide-using-the-new-docker-plugin/) (*the location of some elements changed from version to version and I'll transcribe the current elements in here*).

## Step 1: Configuring Docker inside of OMV

> This might be a litle different for fresh installations as I already had Docker installed in the RPi

1. Log in to OMV and go to **Shared Folders**.

2. Create a folder called "compose". This really needs to be on a larger data drive, as these folders can get large.

3. In the webUI, Go to **System/omv-extras**

4. Click Enable Docker Repo (if it's not already)

5. Save/Apply

6. Click apt-clean

7. Once apt finishes, go to System/Plugins

8. Do a search for "compose" and install the openmediavault-compose plugin.

9. Now with the installation of the compose plugin, go to Services/Compose/Settings.

10. In the drop down box at the top, set that to the compose folder we created in Step 2.

11. In the "docker storage" path... If it is anything other than what you find with `docker info | grep Root`, paste your path there. If it already has your path there, then there's no need to make a change. If it's a new install, paste the path you recorded earlier to the "containers" folder we created.

12. Click Save

13. CLICK RESTART DOCKER (this is important)

## Step 2: Importing your containers to the new Compose plugin

1. Go to **Services/Compose/Files** and select the plus icon

2. Name the container and paste the docker-compose information of the `.yml` files

3. Click at the Up (arrow icon)

And its done, all of the container applications can be deployed here now.

## PiHole

> https://www.youtube.com/watch?v=kkFP46S2VEM

1. Get the network interfaces with `ifconfig`, find the local IP of the RPi and get the adaoters name, mine is `end0`

2. create a `macvlan` interface with `sudo docker network create -d macvlan -o parent=end0 --subnet=192.168.1.0/24 --gateway=192.168.1.1 --ip-range=192.168.1.63/32 ph_network` 
> Considerations: this is to create a virtual connection as if the PiHole is located in a different machin. For this the mapped IP must be out of the range defined automatically by the router (mine is from .64 to.253). Also check if the network adapter used by the OMV (Network/Interfaces) is not the one that will be used in the above command (mine is `eth0`)

3. `piholeunbound` Dockerfile and `pihole_unbound` compose file, optional is tto restart the service

4. Add/Create `./dnsmasq.d/99-edns.conf` file with `edns-packet-max=1232`

3. Create a new Container for PiHole using the `pihole.yml` file

4. Access the container terminal with `docker exec -it pihole_unbound bash` and:

    1. Update the default password with `pihole -a -p <new_passw>
    2. Check if the process is up with `top` and check for "unbound" or with `systemctl status unbound`
    3. Also is possible to check with the `dig fail01.dnssec.works @127.0.0.1 -p 5335` and `dig dnssec.works @127.0.0.1 -p 5335` commands, The first command should give a status report of `SERVFAIL` and no IP address. The second should give `NOERROR` plus an IP address.

5. Login and configure DNS settings.

> [!WARNING]
> For me I got some erros after this, some of the containers running at the OMV Plugin needed Docker looged account, you could achieve with `docker login -u <dockerhub-username>`.  
> Other issues were:
> - Running `dig` returned `SERVFAIL`, the next point is what followed trying to resolve this issue:
>    ```bash
>    $ dig google.com @127.0.0.1 -p 5335
>
>    ; <<>> DiG 9.18.28-1~deb12u2-Debian <<>> google.com @127.0.0.1 -p 5335
>    ;; global options: +cmd
>    ;; Got answer:
>    ;; ->>HEADER<<- opcode: QUERY, status: SERVFAIL, id: 24630
>    ;; flags: qr rd ra; QUERY: 1, ANSWER: 0, AUTHORITY: 0, ADDITIONAL: 1
>
>    ;; OPT PSEUDOSECTION:
>    ; EDNS: version: 0, flags:; udp: 1232
>    ;; QUESTION SECTION:
>    ;google.com.                    IN      A
>
>    ;; Query time: 343 msec
>    ;; SERVER: 127.0.0.1#5335(127.0.0.1) (UDP)
>    ;; WHEN: Sun Oct 27 10:56:36 GMT 2024
>    ;; MSG SIZE  rcvd: 39
>    ```
> - Reading from the logs with `journalctl -xeu unbound.service`, Unbound were unable to read the `root.key` file due to permission issues or the file being missing, which is causing the startup failure:
>    ```bash
>    $ sudo systemctl start unbound
>    sudo systemctl enable unbound
>    Job for unbound.service failed because the control process exited with error code.
>    See "systemctl status unbound.service" and "journalctl -xeu unbound.service" for details.
>    Synchronizing state of unbound.service with SysV service script with /lib/systemd/systemd-sysv-install.
>    Executing: /lib/systemd/systemd-sysv-install enable unbound
>    ```
>    To resolve this issue I tried to set the permissions with `sudo unbound-anchor -a "/var/lib/unbound/root.key` but got another error: `unbound-anchor: command not found`.  
>    ```bash
>    sudo mkdir -p /var/lib/unbound
>    sudo tee /var/lib/unbound/root.key > /dev/null <<EOF
>    . IN DS 20326 8 2 E06D44B80B8E4079F6B0758DC8016749952E9E6D6BFC22D4FD9176F5896A7A4A
>    EOF
>    ```
>    Maked sure that the permissions for Unbound to read this file:
>    ```bash
>    sudo chown unbound:unbound /var/lib/unbound/root.key
>    sudo chmod 644 /var/lib/unbound/root.key
>    ```
>   Restarted Unbound service with `sudo systemctl restart unbound` and checked the status with `systemctl status unbound`:
>    ```bash
>    ● unbound.service - Unbound DNS server
>     Loaded: loaded (/lib/systemd/system/unbound.service; enabled; preset: enabled)
>     Active: active (running) since Sun 2024-10-27 10:50:06 GMT; 4s ago
>       Docs: man:unbound(8)
>    Process: 88165 ExecStartPre=/usr/libexec/unbound-helper chroot_setup (code=exited, status=0/SUCCESS)
>    Process: 88167 ExecStartPre=/usr/libexec/unbound-helper root_trust_anchor_update (code=exited, status>   Main PID: 88169 (unbound)
>      Tasks: 1 (limit: 1577)
>        CPU: 172ms
>     CGroup: /system.slice/unbound.service
>             └─88169 /usr/sbin/unbound -d -p
>    ```
>   All of this hapened between the steps 4. and 5.
>
> - Another big issue was some interference was because I had the HDD of the NAS very close of the moden and as [this post](https://www.reddit.com/r/pihole/comments/p8usze/pihole_takes_out_24_ghz_connections/) suggested it could cause some interference on the signal, so keep that in mind.
 
### Installing Unbound and configuring the recursive DNS Server

> I'll configure the DNS set on the router, the first will point the PiHole IP and the secondary will loopback to the router's IP in case the RPi went down.  
> Also this part follows [this](https://docs.pi-hole.net/guides/dns/unbound/) tutorial.

1. `sudo apt install unbound -y`

2. configure the unbound for `/etc/unbound/unbound.conf.d/pi-hole.conf` the file is in [here]().
> Optional: set `root-hints: "/var/lib/unbound/root.hints"` and download with `sudo wget -O /var/lib/unbound/root.hints https://www.internic.net/domain/named.root`


## NGINX

As OMV already uses Nginx to serve the webgui pages I'll leverage the instalation to configure the applications, for this there's a simple script to configure based on the `apps.txt` file, must follow the syntax:

```txt
app_name, 192.168.1.##:####, domain
```

Remember only to set the script permissions with `chmod +x nginx.sh`. And run with `sudo ./nginx.sh`.

Is expected to return:
```bash
...+ramdom+...+lines..+of+++++this++++
-----
nginx: the configuration file /etc/nginx/nginx.conf syntax is ok
nginx: configuration file /etc/nginx/nginx.conf test is successful
Nginx configuration reloaded successfully.
```

> [!IMPORTANT]
> There's still some issue regarding trhe ssl for https autentication, I can't use Certbot because this is only mapped at the Pihole local DNS Records. I'll try to resolve thjis latrer.


> [!NOTE]
> If you want to clean an application to run the Nginx configuration again only use `sudo find /etc/nginx/ -name "firefly*" -exec rm {} \;`


---

# Past Problems when running the containers manualy

Uppon running the script at `omv.sh` the installation will reserve the port 80 of the server. The problem is, to set a DNS server name will require configuration of the router of the ISP if not possible to edit the table itself, PiHole is a solution but wil clash at the port configuration.

Resolving the port for PiHole will require configuration to use a different port (e.g., port 8080) during installation or after installation by editing the `/etc/lighttpd/lighttpd.conf` file:
```bash
server.port := 8080
```

Restart lighttpd for Pi-hole to apply the changes:
```bash
sudo systemctl restart lighttpd
```
After this change, Pi-hole’s admin interface will be accessible at `http://<server-ip>:8080/admin`.

But in this case will setup a docker compose configuration file `pihole/yml`. The `WEBPASSWORD` variable for *admin* will be defined after using `docker exec -it pihole pihole -a -p`.


