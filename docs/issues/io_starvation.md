

```bash
qm config 101
cat /proc/pressure/io
iostat -xz 1 5
dmesg -T | tail -100

# status: running
# agent: 1
# balloon: 3072
# bios: ovmf
# boot: order=scsi0;ide2;net0
# cores: 4
# cpu: host
# efidisk0: local-lvm:vm-101-disk-0,efitype=4m,ms-cert=2023k,pre-enrolled-keys=1,size=4M
# ide2: local:iso/ubuntu-26.04-live-server-amd64.iso,media=cdrom,size=2850194K
# machine: q35
# memory: 6144
# meta: creation-qemu=11.0.2,ctime=1785747085
# name: docker-host
# net0: virtio=BC:24:11:03:17:20,bridge=vmbr0,firewall=1
# numa: 0
# onboot: 1
# ostype: l26
# scsi0: local-lvm:vm-101-disk-1,iothread=1,size=100G
# scsihw: virtio-scsi-single
# smbios1: uuid=redacted
# sockets: 1
# startup: order=2,up=30,down=120
# vmgenid: redacted
# some avg10=97.29 avg60=93.20 avg300=92.82 total=2907040230
# full avg10=92.09 avg60=88.42 avg300=87.70 total=2796539273
# -bash: iostat: command not found
# [Tue Aug 25 20:21:49 2026] intel_rapl_common: Found RAPL domain package
# [Tue Aug 25 20:21:49 2026] intel_rapl_common: Found RAPL domain core
# [Tue Aug 25 20:21:49 2026] intel_rapl_common: Found RAPL domain dram
# [Tue Aug 25 20:21:49 2026] MXM: GUID detected in BIOS
# [Tue Aug 25 20:21:49 2026] nouveau 0000:01:00.0: NVIDIA GP108 (138000a1)
# [Tue Aug 25 20:21:49 2026] nouveau 0000:01:00.0: bios: version 86.08.36.00.1e
# [Tue Aug 25 20:21:49 2026] nouveau 0000:01:00.0: pmu: firmware unavailable
# [Tue Aug 25 20:21:49 2026] Console: switching to colour dummy device 80x25
# [Tue Aug 25 20:21:49 2026] nouveau 0000:01:00.0: vgaarb: deactivate vga console
# [Tue Aug 25 20:21:49 2026] nouveau 0000:01:00.0: fb: 2048 MiB GDDR5
# [Tue Aug 25 20:21:49 2026] nouveau 0000:01:00.0: drm: VRAM: 2048 MiB
# [Tue Aug 25 20:21:49 2026] nouveau 0000:01:00.0: drm: GART: 536870912 MiB
# [Tue Aug 25 20:21:49 2026] nouveau 0000:01:00.0: drm: BIT table 'A' not found
# [Tue Aug 25 20:21:49 2026] nouveau 0000:01:00.0: drm: BIT table 'L' not found
# [Tue Aug 25 20:21:49 2026] nouveau 0000:01:00.0: drm: TMDS table version 2.0
# [Tue Aug 25 20:21:49 2026] nouveau 0000:01:00.0: drm: MM: using COPY for buffer copies
# [Tue Aug 25 20:21:49 2026] snd_hda_intel 0000:01:00.1: bound 0000:01:00.0 (ops nv50_audio_component_bind_ops [nouveau])
# [Tue Aug 25 20:21:49 2026] nouveau 0000:01:00.0: [drm] Registered 2 planes with drm panic
# [Tue Aug 25 20:21:49 2026] [drm] Initialized nouveau 1.4.2 for 0000:01:00.0 on minor 0
# [Tue Aug 25 20:21:49 2026] fbcon: nouveaudrmfb (fb0) is primary device
# [Tue Aug 25 20:21:49 2026] Console: switching to colour frame buffer device 240x67
# [Tue Aug 25 20:21:49 2026] nouveau 0000:01:00.0: [drm] fb0: nouveaudrmfb frame buffer device
# [Tue Aug 25 20:21:49 2026] nouveau 0000:01:00.0: drm: Disabling PCI power management to avoid bug
# [Tue Aug 25 20:21:51 2026] audit: type=1400 audit(1787685711.240:2): apparmor="STATUS" operation="profile_load" profile="unconfined" name="Discord" pid=788 comm="apparmor_parser"
# [Tue Aug 25 20:21:51 2026] audit: type=1400 audit(1787685711.240:3): apparmor="STATUS" operation="profile_load" profile="unconfined" name="1password" pid=787 comm="apparmor_parser"
# [Tue Aug 25 20:21:51 2026] audit: type=1400 audit(1787685711.240:4): apparmor="STATUS" operation="profile_load" profile="unconfined" name="QtWebEngineProcess" pid=790 comm="apparmor_parser"
# [Tue Aug 25 20:21:51 2026] audit: type=1400 audit(1787685711.240:5): apparmor="STATUS" operation="profile_load" profile="unconfined" name=4D6F6E676F444220436F6D70617373 pid=789 comm="apparmor_parser"
# [Tue Aug 25 20:21:51 2026] audit: type=1400 audit(1787685711.240:6): apparmor="STATUS" operation="profile_load" profile="unconfined" name="balena-etcher" pid=792 comm="apparmor_parser"
# [Tue Aug 25 20:21:51 2026] audit: type=1400 audit(1787685711.253:7): apparmor="STATUS" operation="profile_load" profile="unconfined" name="ch-checkns" pid=797 comm="apparmor_parser"
# [Tue Aug 25 20:21:51 2026] audit: type=1400 audit(1787685711.253:8): apparmor="STATUS" operation="profile_load" profile="unconfined" name="brave" pid=793 comm="apparmor_parser"
# [Tue Aug 25 20:21:51 2026] audit: type=1400 audit(1787685711.253:9): apparmor="STATUS" operation="profile_load" profile="unconfined" name="buildah" pid=794 comm="apparmor_parser"
# [Tue Aug 25 20:21:51 2026] audit: type=1400 audit(1787685711.253:10): apparmor="STATUS" operation="profile_load" profile="unconfined" name="cam" pid=796 comm="apparmor_parser"
# [Tue Aug 25 20:21:51 2026] audit: type=1400 audit(1787685711.253:11): apparmor="STATUS" operation="profile_load" profile="unconfined" name="busybox" pid=795 comm="apparmor_parser"
# [Tue Aug 25 20:21:51 2026] RPC: Registered named UNIX socket transport module.
# [Tue Aug 25 20:21:51 2026] RPC: Registered udp transport module.
# [Tue Aug 25 20:21:51 2026] RPC: Registered tcp transport module.
# [Tue Aug 25 20:21:51 2026] RPC: Registered tcp-with-tls transport module.
# [Tue Aug 25 20:21:51 2026] RPC: Registered tcp NFSv4.1 backchannel transport module.
# [Tue Aug 25 20:21:58 2026] vmbr0: port 1(nic0) entered blocking state
# [Tue Aug 25 20:21:58 2026] vmbr0: port 1(nic0) entered disabled state
# [Tue Aug 25 20:21:58 2026] r8169 0000:03:00.0 nic0: entered allmulticast mode
# [Tue Aug 25 20:21:58 2026] r8169 0000:03:00.0 nic0: entered promiscuous mode
# [Tue Aug 25 20:21:58 2026] Generic FE-GE Realtek PHY r8169-0-300:00: attached PHY driver (mii_bus:phy_addr=r8169-0-300:00, irq=MAC)
# [Tue Aug 25 20:21:58 2026] r8169 0000:03:00.0 nic0: Link is Down
# [Tue Aug 25 20:21:58 2026] vmbr0: port 1(nic0) entered blocking state
# [Tue Aug 25 20:21:58 2026] vmbr0: port 1(nic0) entered forwarding state
# [Tue Aug 25 20:21:59 2026] vmbr0: port 1(nic0) entered disabled state
# [Tue Aug 25 20:22:00 2026] kauditd_printk_skb: 109 callbacks suppressed
# [Tue Aug 25 20:22:00 2026] audit: type=1400 audit(1787685720.451:121): apparmor="STATUS" operation="profile_replace" info="same as current profile, skipping" profile="unconfined" name="/usr/bin/lxc-copy" pid=1194 comm="apparmor_parser"
# [Tue Aug 25 20:22:00 2026] audit: type=1400 audit(1787685720.458:122): apparmor="STATUS" operation="profile_replace" info="same as current profile, skipping" profile="unconfined" name="/usr/bin/lxc-start" pid=1198 comm="apparmor_parser"
# [Tue Aug 25 20:22:00 2026] audit: type=1400 audit(1787685720.473:123): apparmor="STATUS" operation="profile_replace" info="same as current profile, skipping" profile="unconfined" name="lxc-container-default" pid=1202 comm="apparmor_parser"
# [Tue Aug 25 20:22:00 2026] audit: type=1400 audit(1787685720.473:124): apparmor="STATUS" operation="profile_replace" info="same as current profile, skipping" profile="unconfined" name="lxc-container-default-cgns" pid=1202 comm="apparmor_parser"
# [Tue Aug 25 20:22:00 2026] audit: type=1400 audit(1787685720.473:125): apparmor="STATUS" operation="profile_replace" info="same as current profile, skipping" profile="unconfined" name="lxc-container-default-with-mounting" pid=1202 comm="apparmor_parser"
# [Tue Aug 25 20:22:00 2026] audit: type=1400 audit(1787685720.473:126): apparmor="STATUS" operation="profile_replace" info="same as current profile, skipping" profile="unconfined" name="lxc-container-default-with-nesting" pid=1202 comm="apparmor_parser"
# [Tue Aug 25 20:22:02 2026] r8169 0000:03:00.0 nic0: Link is Up - 1Gbps/Full - flow control rx/tx
# [Tue Aug 25 20:22:02 2026] vmbr0: port 1(nic0) entered blocking state
# [Tue Aug 25 20:22:02 2026] vmbr0: port 1(nic0) entered forwarding state
# [Tue Aug 25 20:22:12 2026] tap100i0: entered promiscuous mode
# [Tue Aug 25 20:22:12 2026] vmbr0: port 2(fwpr100p0) entered blocking state
# [Tue Aug 25 20:22:12 2026] vmbr0: port 2(fwpr100p0) entered disabled state
# [Tue Aug 25 20:22:12 2026] fwpr100p0: entered allmulticast mode
# [Tue Aug 25 20:22:12 2026] fwpr100p0: entered promiscuous mode
# [Tue Aug 25 20:22:12 2026] vmbr0: port 2(fwpr100p0) entered blocking state
# [Tue Aug 25 20:22:12 2026] vmbr0: port 2(fwpr100p0) entered forwarding state
# [Tue Aug 25 20:22:12 2026] fwbr100i0: port 1(fwln100i0) entered blocking state
# [Tue Aug 25 20:22:12 2026] fwbr100i0: port 1(fwln100i0) entered disabled state
# [Tue Aug 25 20:22:12 2026] fwln100i0: entered allmulticast mode
# [Tue Aug 25 20:22:12 2026] fwln100i0: entered promiscuous mode
# [Tue Aug 25 20:22:12 2026] fwbr100i0: port 1(fwln100i0) entered blocking state
# [Tue Aug 25 20:22:12 2026] fwbr100i0: port 1(fwln100i0) entered forwarding state
# [Tue Aug 25 20:22:12 2026] fwbr100i0: port 2(tap100i0) entered blocking state
# [Tue Aug 25 20:22:12 2026] fwbr100i0: port 2(tap100i0) entered disabled state
# [Tue Aug 25 20:22:12 2026] tap100i0: entered allmulticast mode
# [Tue Aug 25 20:22:12 2026] fwbr100i0: port 2(tap100i0) entered blocking state
# [Tue Aug 25 20:22:12 2026] fwbr100i0: port 2(tap100i0) entered forwarding state
# [Tue Aug 25 20:22:21 2026] tap101i0: entered promiscuous mode
# [Tue Aug 25 20:22:21 2026] vmbr0: port 3(fwpr101p0) entered blocking state
# [Tue Aug 25 20:22:21 2026] vmbr0: port 3(fwpr101p0) entered disabled state
# [Tue Aug 25 20:22:21 2026] fwpr101p0: entered allmulticast mode
# [Tue Aug 25 20:22:21 2026] fwpr101p0: entered promiscuous mode
# [Tue Aug 25 20:22:21 2026] vmbr0: port 3(fwpr101p0) entered blocking state
# [Tue Aug 25 20:22:21 2026] vmbr0: port 3(fwpr101p0) entered forwarding state
# [Tue Aug 25 20:22:21 2026] fwbr101i0: port 1(fwln101i0) entered blocking state
# [Tue Aug 25 20:22:21 2026] fwbr101i0: port 1(fwln101i0) entered disabled state
# [Tue Aug 25 20:22:21 2026] fwln101i0: entered allmulticast mode
# [Tue Aug 25 20:22:21 2026] fwln101i0: entered promiscuous mode
# [Tue Aug 25 20:22:21 2026] fwbr101i0: port 1(fwln101i0) entered blocking state
# [Tue Aug 25 20:22:21 2026] fwbr101i0: port 1(fwln101i0) entered forwarding state
# [Tue Aug 25 20:22:21 2026] fwbr101i0: port 2(tap101i0) entered blocking state
# [Tue Aug 25 20:22:21 2026] fwbr101i0: port 2(tap101i0) entered disabled state
# [Tue Aug 25 20:22:21 2026] tap101i0: entered allmulticast mode
# [Tue Aug 25 20:22:21 2026] fwbr101i0: port 2(tap101i0) entered blocking state
# [Tue Aug 25 20:22:21 2026] fwbr101i0: port 2(tap101i0) entered forwarding state
# [Tue Aug 25 20:22:52 2026] tap102i0: entered promiscuous mode
# [Tue Aug 25 20:22:53 2026] vmbr0: port 4(tap102i0) entered blocking state
# [Tue Aug 25 20:22:53 2026] vmbr0: port 4(tap102i0) entered disabled state
# [Tue Aug 25 20:22:53 2026] tap102i0: entered allmulticast mode
# [Tue Aug 25 20:22:53 2026] vmbr0: port 4(tap102i0) entered blocking state
# [Tue Aug 25 20:22:53 2026] vmbr0: port 4(tap102i0) entered forwarding state
# [Wed Aug 26 09:46:57 2026] perf: interrupt took too long (2617 > 2500), lowering kernel.perf_event_max_sample_rate to 76000
```

The important part is:
```bash
some avg10=97.29 avg60=93.20 avg300=92.82
full avg10=92.09 avg60=88.42 avg300=87.70
```

That's extreme I/O starvation. full above 90% means that for most of the recent time, essentially all non-idle work in the guest has been stalled on I/O. And your configuration gives us a very strong suspect:
```bash
scsi0: local-lvm:vm-101-disk-1,iothread=1,size=100G
scsihw: virtio-scsi-single
```

So the next step is not to fight with the Ubuntu console. We need to inspect local-lvm and the physical device on the PVE host.

```bash
pvesm status
lvs -a -o lv_name,vg_name,lv_size,data_percent,metadata_percent,devices

# Name             Type     Status     Total (KiB)      Used (KiB) Available (KiB)        %
# local             dir     active        98497780         8470360        84977872    8.60%
# local-lvm     lvmthin     active       832888832        42060886       790827945    5.05%
#   LV              VG  LSize   Data%  Meta%  Devices          
#   data            pve 794.30g 5.05   0.40   data_tdata(0)    
#   [data_tdata]    pve 794.30g               /dev/sda3(26624) 
#   [data_tmeta]    pve   8.10g               /dev/sda3(229966)
#   [lvol0_pmspare] pve   8.10g               /dev/sda3(232040)
#   root            pve  96.00g               /dev/sda3(2048)  
#   swap            pve   8.00g               /dev/sda3(0)     
#   vm-100-disk-0   pve  16.00g 93.68                          
#   vm-101-disk-0   pve   4.00m 14.06                          
#   vm-101-disk-1   pve 100.00g 16.25                          
#   vm-102-disk-0   pve  32.00g 27.66                          
#   vm-102-disk-1   pve   4.00m 14.06
```

> [!tip]
> ```bash
> apt install sysstat -y
> ```

```bash
iostat -xz 1 5

# Linux 7.0.14-6-pve (pve)        08/26/2026      _x86_64_        (6 CPU)

# avg-cpu:  %user   %nice %system %iowait  %steal   %idle
#            2.63    0.00    0.55    7.04    0.00   89.79

# Device            r/s     rkB/s   rrqm/s  %rrqm r_await rareq-sz     w/s     wkB/s   wrqm/s  %wrqm w_await wareq-sz     d/s     dkB/s   drqm/s  %drqm d_await dareq-sz     f/s f_await  aqu-sz  %util
# dm-0             0.00      0.03     0.00   0.00   11.43    17.31    0.00      0.00     0.00   0.00    0.00     0.00    0.00      0.00     0.00   0.00    0.00     0.00    0.00    0.00    0.00   0.00
# dm-1             0.20      8.60     0.00   0.00  160.42    43.91    2.69     15.25     0.00   0.00   31.03     5.68    0.00      0.00     0.00   0.00    0.00     0.00    0.00    0.00    0.11   4.99
# dm-10            0.00      0.05     0.00   0.00   56.84    62.69    0.00      0.00     0.00   0.00   42.00     4.00    0.00      0.00     0.00   0.00    0.00     0.00    0.00    0.00    0.00   0.00
# dm-2             0.04      0.45     0.00   0.00   62.62    12.22    0.34      1.13     0.00   0.00    6.59     3.35    0.00      0.00     0.00   0.00    0.00     0.00    0.00    0.00    0.00   0.39
# dm-3            41.91   1819.50     0.00   0.00  332.99    43.41    7.25    104.81     0.00   0.00   19.47    14.46    0.00      0.00     0.00   0.00    0.00     0.00    0.00    0.00   14.10  11.46
# dm-4            41.91   1819.50     0.00   0.00  332.99    43.41    7.22    104.81     0.00   0.00   19.36    14.51    0.00      0.00     0.00   0.00    0.00     0.00    0.00    0.00   14.10  11.34
# dm-6             0.36      9.67     0.00   0.00   75.63    26.77    1.41     14.14     0.00   0.00   33.35    10.00    0.00      0.00     0.00   0.00    0.00     0.00    0.00    0.00    0.07   2.56
# dm-7            41.17   1801.13     0.00   0.00  341.68    43.75    4.43     61.20     0.00   0.00   18.59    13.81    0.00      0.00     0.00   0.00    0.00     0.00    0.00    0.00   14.15  10.38
# dm-8             0.00      0.05     0.00   0.00   14.65    64.00    0.00      0.00     0.00   0.00    1.00     4.00    0.00      0.00     0.00   0.00    0.00     0.00    0.00    0.00    0.00   0.00
# dm-9             0.41      9.09     0.00   0.00   27.30    22.07    1.37     28.84     0.00   0.00   52.11    21.01    0.00      0.00     0.00   0.00    0.00     0.00    0.00    0.00    0.08   1.68
# md0              0.00      0.04     0.00   0.00    2.31    18.98    0.00      0.00     0.00   0.00    0.00     0.00    0.00      0.00     0.00   0.00    0.00     0.00    0.00    0.00    0.00   0.00
# sda             16.74   1879.91    25.81  60.66  230.71   112.29    8.92    121.19     1.36  13.22   16.73    13.59    0.00      0.00     0.00   0.00    0.00     0.00    1.76   39.03    4.08  12.49
# sdb              0.03     13.93     0.00   0.32   13.10   413.63    0.01      0.06     0.00   0.00   14.79     5.38    0.00      0.00     0.00   0.00    0.00     0.00    0.00   34.36    0.00   0.04
# sdc              0.04      1.96     0.00   0.17   26.65    53.99    0.01      0.06     0.00   0.00   26.30     5.38    0.00      0.00     0.00   0.00    0.00     0.00    0.00   61.12    0.00   0.05


# avg-cpu:  %user   %nice %system %iowait  %steal   %idle
#            1.71    0.00    0.68   95.39    0.00    2.22

# Device            r/s     rkB/s   rrqm/s  %rrqm r_await rareq-sz     w/s     wkB/s   wrqm/s  %wrqm w_await wareq-sz     d/s     dkB/s   drqm/s  %drqm d_await dareq-sz     f/s f_await  aqu-sz  %util
# dm-3           676.00  18844.00     0.00   0.00  173.81    27.88    1.00      4.00     0.00   0.00  238.00     4.00    0.00      0.00     0.00   0.00    0.00     0.00    0.00    0.00  117.73 100.00
# dm-4           676.00  18844.00     0.00   0.00  173.81    27.88    1.00      4.00     0.00   0.00  238.00     4.00    0.00      0.00     0.00   0.00    0.00     0.00    0.00    0.00  117.73 100.00
# dm-7           676.00  18844.00     0.00   0.00  174.66    27.88    0.00      0.00     0.00   0.00    0.00     0.00    0.00      0.00     0.00   0.00    0.00     0.00    0.00    0.00  118.07 100.00
# dm-9             0.00      0.00     0.00   0.00    0.00     0.00    1.00      4.00     0.00   0.00  238.00     4.00    0.00      0.00     0.00   0.00    0.00     0.00    0.00    0.00    0.24  61.60
# sda            432.00  18844.00   288.00  40.00  136.49    43.62    1.00      4.00     0.00   0.00   99.00     4.00    0.00      0.00     0.00   0.00    0.00     0.00    0.00    0.00   59.06  99.90


# avg-cpu:  %user   %nice %system %iowait  %steal   %idle
#            1.70    0.00    0.34   97.96    0.00    0.00

# Device            r/s     rkB/s   rrqm/s  %rrqm r_await rareq-sz     w/s     wkB/s   wrqm/s  %wrqm w_await wareq-sz     d/s     dkB/s   drqm/s  %drqm d_await dareq-sz     f/s f_await  aqu-sz  %util
# dm-3           459.00  17224.00     0.00   0.00  318.31    37.53    3.00     12.00     0.00   0.00  311.33     4.00    0.00      0.00     0.00   0.00    0.00     0.00    0.00    0.00  147.04 100.00
# dm-4           459.00  17224.00     0.00   0.00  318.31    37.53    3.00     12.00     0.00   0.00  311.33     4.00    0.00      0.00     0.00   0.00    0.00     0.00    0.00    0.00  147.04 100.00
# dm-7           459.00  17224.00     0.00   0.00  318.89    37.53    0.00      0.00     0.00   0.00    0.00     0.00    0.00      0.00     0.00   0.00    0.00     0.00    0.00    0.00  146.37 100.00
# dm-9             0.00      0.00     0.00   0.00    0.00     0.00    3.00     12.00     0.00   0.00  336.33     4.00    0.00      0.00     0.00   0.00    0.00     0.00    0.00    0.00    1.01  63.10
# sda            219.00  17224.00   227.00  50.90  256.99    78.65    3.00     12.00     0.00   0.00  221.00     4.00    0.00      0.00     0.00   0.00    0.00     0.00    2.00  203.00   57.35 100.00


# avg-cpu:  %user   %nice %system %iowait  %steal   %idle
#            2.04    0.00    0.68   97.28    0.00    0.00

# Device            r/s     rkB/s   rrqm/s  %rrqm r_await rareq-sz     w/s     wkB/s   wrqm/s  %wrqm w_await wareq-sz     d/s     dkB/s   drqm/s  %drqm d_await dareq-sz     f/s f_await  aqu-sz  %util
# dm-3           657.00  21816.00     0.00   0.00  236.48    33.21    0.00      0.00     0.00   0.00    0.00     0.00    0.00      0.00     0.00   0.00    0.00     0.00    0.00    0.00  155.37 100.00
# dm-4           657.00  21816.00     0.00   0.00  236.48    33.21    0.00      0.00     0.00   0.00    0.00     0.00    0.00      0.00     0.00   0.00    0.00     0.00    0.00    0.00  155.37 100.00
# dm-7           657.00  21816.00     0.00   0.00  237.77    33.21    0.00      0.00     0.00   0.00    0.00     0.00    0.00      0.00     0.00   0.00    0.00     0.00    0.00    0.00  156.22 100.00
# sda            362.00  21816.00   319.00  46.84  173.93    60.27    0.00      0.00     0.00   0.00    0.00     0.00    0.00      0.00     0.00   0.00    0.00     0.00    0.00    0.00   62.96  97.10


# avg-cpu:  %user   %nice %system %iowait  %steal   %idle
#            2.37    0.00    0.68   94.58    0.00    2.37

# Device            r/s     rkB/s   rrqm/s  %rrqm r_await rareq-sz     w/s     wkB/s   wrqm/s  %wrqm w_await wareq-sz     d/s     dkB/s   drqm/s  %drqm d_await dareq-sz     f/s f_await  aqu-sz  %util
# dm-3           714.85  28015.84     0.00   0.00  225.69    39.19    0.00      0.00     0.00   0.00    0.00     0.00    0.00      0.00     0.00   0.00    0.00     0.00    0.00    0.00  161.34  99.01
# dm-4           714.85  28015.84     0.00   0.00  225.69    39.19    0.00      0.00     0.00   0.00    0.00     0.00    0.00      0.00     0.00   0.00    0.00     0.00    0.00    0.00  161.34  99.01
# dm-7           714.85  28015.84     0.00   0.00  226.87    39.19    0.00      0.00     0.00   0.00    0.00     0.00    0.00      0.00     0.00   0.00    0.00     0.00    0.00    0.00  162.18  99.01
# sda            311.88  28015.84   536.63  63.24  197.85    89.83    0.00      0.00     0.00   0.00    0.00     0.00    0.00      0.00     0.00   0.00    0.00     0.00    0.00    0.00   61.71 101.39
```

This is now pretty conclusive: the problem is on the PVE host's sda storage path, not primarily inside VM 101.

The key evidence is:

sda  ...  %util 99–101%
      iowait 94–98%
      r_await ~174–257 ms
      aqu-sz ~57–63


and the mapped devices show:

dm-3/dm-4/dm-7
~460–715 read IOPS
~17–28 MB/s
r_await ~174–319 ms
aqu-sz ~118–162
%util 100%


That's terrible latency for a local storage device, and it explains why VM 101's guest PSI is >90% and its console is effectively frozen.

Also, your LVM-thin pool is healthy from a capacity perspective:

Data% = 5.05%
Meta% = 0.40%


So this is not LVM-thin space exhaustion.

The next question: why is /dev/sda so slow?

The really interesting clue is that the workload is predominantly reads:

~700 reads/sec
~20–28 MB/s
r_await 225–319 ms


That's an enormous queue for such a modest throughput.

I would investigate the physical sda immediately.

1. Identify exactly what /dev/sda is

Run:
```bash
lsblk -o NAME,MODEL,SERIAL,SIZE,ROTA,TYPE,FSTYPE,MOUNTPOINTS

# NAME                         MODEL                SERIAL         SIZE ROTA TYPE  FSTYPE            MOUNTPOINTS
# sda                          WDC WD10SPZX-35Z10T0 WX51A7940TEV 931.5G    1 disk                    
# ├─sda1                                                          1007K    1 part                    
# ├─sda2                                                             1G    1 part  vfat              
# └─sda3                                                         930.5G    1 part  LVM2_member       
#   ├─pve-swap                                                       8G    1 lvm   swap              [SWAP]
#   ├─pve-root                                                      96G    1 lvm   ext4              /
#   ├─pve-data_tmeta                                               8.1G    1 lvm                     
#   │ └─pve-data-tpool                                           794.3G    1 lvm                     
#   │   ├─pve-data                                               794.3G    1 lvm                     
#   │   ├─pve-vm--100--disk--0                                      16G    1 lvm                     
#   │   ├─pve-vm--101--disk--1                                     100G    1 lvm                     
#   │   ├─pve-vm--101--disk--0                                       4M    1 lvm                     
#   │   ├─pve-vm--102--disk--0                                      32G    1 lvm                     
#   │   └─pve-vm--102--disk--1                                       4M    1 lvm                     
#   └─pve-data_tdata                                             794.3G    1 lvm                     
#     └─pve-data-tpool                                           794.3G    1 lvm                     
#       ├─pve-data                                               794.3G    1 lvm                     
#       ├─pve-vm--100--disk--0                                      16G    1 lvm                     
#       ├─pve-vm--101--disk--1                                     100G    1 lvm                     
#       ├─pve-vm--101--disk--0                                       4M    1 lvm                     
#       ├─pve-vm--102--disk--0                                      32G    1 lvm                     
#       └─pve-vm--102--disk--1                                       4M    1 lvm                     
# sdb                          ST4000LM024-2U817V   WCKCFQ6M       3.6T    1 disk                    
# ├─sdb1                                                            16M    1 part                    
# └─sdb2                                                           3.6T    1 part  linux_raid_member 
#   └─md0                                                          3.6T    1 raid1 ext4              
# sdc                          ST4000LM024-2AN17V   WCJ92BKJ       3.6T    1 disk                    
# ├─sdc1                                                            16M    1 part                    
# └─sdc2                                                           3.6T    1 part  linux_raid_member 
#   └─md0                                                          3.6T    1 raid1 ext4
```


and:
```bash
smartctl -a /dev/sda

# smartctl 7.5 2025-04-30 r5714 [x86_64-linux-7.0.14-6-pve] (local build)
# Copyright (C) 2002-25, Bruce Allen, Christian Franke, www.smartmontools.org

# === START OF INFORMATION SECTION ===
# Model Family:     Western Digital Blue Mobile (SMR)
# Device Model:     WDC WD10SPZX-35Z10T0
# Serial Number:    REDACTED
# LU WWN Device Id: 5 0014ee 266cc55a9
# Firmware Version: 04.01A04
# User Capacity:    1,000,204,886,016 bytes [1.00 TB]
# Sector Sizes:     512 bytes logical, 4096 bytes physical
# Rotation Rate:    5400 rpm
# Form Factor:      2.5 inches
# TRIM Command:     Available, deterministic
# Device is:        In smartctl database 7.5/5706
# ATA Version is:   ACS-3 T13/2161-D revision 5
# SATA Version is:  SATA 3.1, 6.0 Gb/s (current: 6.0 Gb/s)
# Local Time is:    Wed Aug 26 14:25:34 2026 WEST
# SMART support is: Available - device has SMART capability.
# SMART support is: Enabled

# === START OF READ SMART DATA SECTION ===
# SMART overall-health self-assessment test result: PASSED

# General SMART Values:
# Offline data collection status:  (0x00) Offline data collection activity
#                                         was never started.
#                                         Auto Offline Data Collection: Disabled.
# Self-test execution status:      (   0) The previous self-test routine completed
#                                         without error or no self-test has ever 
#                                         been run.
# Total time to complete Offline 
# data collection:                (10140) seconds.
# Offline data collection
# capabilities:                    (0x71) SMART execute Offline immediate.
#                                         No Auto Offline data collection support.
#                                         Suspend Offline collection upon new
#                                         command.
#                                         No Offline surface scan supported.
#                                         Self-test supported.
#                                         Conveyance Self-test supported.
#                                         Selective Self-test supported.
# SMART capabilities:            (0x0003) Saves SMART data before entering
#                                         power-saving mode.
#                                         Supports SMART auto save timer.
# Error logging capability:        (0x01) Error logging supported.
#                                         General Purpose Logging supported.
# Short self-test routine 
# recommended polling time:        (   2) minutes.
# Extended self-test routine
# recommended polling time:        ( 173) minutes.
# Conveyance self-test routine
# recommended polling time:        (   2) minutes.
# SCT capabilities:              (0x3035) SCT Status supported.
#                                         SCT Feature Control supported.
#                                         SCT Data Table supported.

# SMART Attributes Data Structure revision number: 16
# Vendor Specific SMART Attributes with Thresholds:
# ID# ATTRIBUTE_NAME          FLAG     VALUE WORST THRESH TYPE      UPDATED  WHEN_FAILED RAW_VALUE
#   1 Raw_Read_Error_Rate     0x002f   200   200   051    Pre-fail  Always       -       0
#   3 Spin_Up_Time            0x0027   194   187   021    Pre-fail  Always       -       1283
#   4 Start_Stop_Count        0x0032   095   095   000    Old_age   Always       -       5609
#   5 Reallocated_Sector_Ct   0x0033   200   200   140    Pre-fail  Always       -       0
#   7 Seek_Error_Rate         0x002e   200   200   000    Old_age   Always       -       0
#   9 Power_On_Hours          0x0032   094   094   000    Old_age   Always       -       4666
#  10 Spin_Retry_Count        0x0032   100   100   000    Old_age   Always       -       0
#  11 Calibration_Retry_Count 0x0032   100   100   000    Old_age   Always       -       0
#  12 Power_Cycle_Count       0x0032   098   098   000    Old_age   Always       -       2241
# 191 G-Sense_Error_Rate      0x0032   001   001   000    Old_age   Always       -       494
# 192 Power-Off_Retract_Count 0x0032   200   200   000    Old_age   Always       -       649
# 193 Load_Cycle_Count        0x0032   162   162   000    Old_age   Always       -       116840
# 194 Temperature_Celsius     0x0022   100   089   000    Old_age   Always       -       43
# 196 Reallocated_Event_Count 0x0032   200   200   000    Old_age   Always       -       0
# 197 Current_Pending_Sector  0x0032   200   200   000    Old_age   Always       -       0
# 198 Offline_Uncorrectable   0x0030   100   253   000    Old_age   Offline      -       0
# 199 UDMA_CRC_Error_Count    0x0032   200   200   000    Old_age   Always       -       162
# 200 Multi_Zone_Error_Rate   0x0008   100   253   000    Old_age   Offline      -       0

# SMART Error Log Version: 1
# No Errors Logged

# SMART Self-test log structure revision number 1
# No self-tests have been logged.  [To run self-tests, use: smartctl -t]

# SMART Selective self-test log data structure revision number 1
#  SPAN  MIN_LBA  MAX_LBA  CURRENT_TEST_STATUS
#     1        0        0  Not_testing
#     2        0        0  Not_testing
#     3        0        0  Not_testing
#     4        0        0  Not_testing
#     5        0        0  Not_testing
# Selective self-test flags (0x0):
#   After scanning selected spans, do NOT read-scan remainder of disk.
# If Selective self-test is pending on power-up, resume after 0 minute delay.

# The above only provides legacy SMART information - try 'smartctl -x' for more
```

> [!tip] If smartctl isn't installed:
> ```bash
> apt install smartmontools
> ```

Don't run a SMART self-test yet. We first want the existing health/error counters.

Also:
```bash
dmesg -T | egrep -i 'sda|ata|error|fail|timeout|reset|I/O'
```

This is the most important next diagnostic.

2. Check whether sda is an HDD or SSD

The ROTA field above will tell us.

If it's an HDD, ~200–300 ms latency under a few hundred random reads/sec is entirely plausible when the disk is being hammered by random I/O.

If it's an SSD/NVMe-class device, those latencies are highly abnormal and I'd become much more suspicious of:

failing SSD
SATA link/controller problems
thermal throttling
firmware/device errors
USB/SATA bridge problems, if applicable
another pathological workload
3. Find which LV is generating the I/O

Your dm-* devices are device-mapper layers, so let's map them:

ls -l /dev/mapper/


and:

dmsetup ls --tree


This should reveal which dm-* corresponds to vm-101-disk-1.

You can also ask LVM:

lvs -a -o lv_name,lv_attr,lv_size,data_percent,metadata_percent,devices


The interesting question is whether VM 101 is responsible for those ~700 reads/sec, or whether another VM/container is hammering the same physical disk.

4. Find the actual process causing the reads

On the PVE host:

iotop -oPa


If iotop isn't installed:

apt install iotop


Then look for the QEMU process corresponding to VM 101 and other heavy consumers.

You can also do:

ps -eo pid,stat,wchan:32,cmd | grep -E '[q]emu|[k]vm'

5. There's an important clue in your topology

You have:

local-lvm -> /dev/sda3


and VM 101's 100 GB disk is:

vm-101-disk-1 -> local-lvm -> LVM thin -> sda3 -> sda


So the complete path is approximately:

Docker workload
      ↓
Ubuntu VM 101
      ↓
virtio-scsi
      ↓
QEMU
      ↓
LVM-thin
      ↓
/dev/sda3
      ↓
/dev/sda
      ↓
      😵 200–300 ms read latency


That is exactly consistent with the guest's:

some avg10=97.29%
full avg10=92.09%

One thing I would NOT do yet

Don't start changing VM disk settings, disabling iothread, converting SCSI → VirtIO, etc.

Your VM configuration:

scsihw: virtio-scsi-single
scsi0: ...,iothread=1


is perfectly reasonable. Changing the virtual disk controller won't fix a physical disk that is currently taking ~250 ms per read.

What I want to see next

Run these on the PVE host:

lsblk -o NAME,MODEL,SERIAL,SIZE,ROTA,TYPE,FSTYPE,MOUNTPOINTS
smartctl -a /dev/sda
dmesg -T | egrep -i 'sda|ata|error|fail|timeout|reset|I/O'
dmsetup ls --tree
iotop -oPa


The SMART + dmesg output is especially important.

If /dev/sda turns out to be an HDD, we may be looking at a pathological random-read workload. If it's an SSD, I would investigate possible hardware/link failure very seriously before doing anything destructive to VM 101.

---

Yep. We have the culprit now.

VM 101 is sitting on a 5400-RPM SMR laptop HDD (WDC WD10SPZX) and that disk is being driven to ~100% utilization with ~200–300 ms read latency. The VM's 90%+ PSI is a consequence of that.

What the evidence says

Your path is:

VM 101
  ↓
virtio-scsi
  ↓
LVM-thin
  ↓
/dev/sda3
  ↓
WDC WD10SPZX 1 TB
  ↓
5400 RPM + SMR


The host is spending 94–98% of CPU time in I/O wait while this is happening.

The disk itself is:

5400 RPM
SMR
2.5" laptop HDD
~4,666 power-on hours
116,840 load cycles
43°C
SMART overall health: PASSED
0 reallocated sectors
0 pending sectors
0 uncorrectable sectors

So I don't see evidence that the disk is failing right now.

The important distinction is:

SMART PASSED does not mean this disk is suitable for this workload.

A 5400-RPM SMR HDD can become catastrophically slow under random I/O, especially underneath a VM running Docker.

The smoking gun

You measured roughly:

~200–300 ms read latency
~400–700 read IOPS
~20–28 MB/s
~100% disk utilization


For a 5400-RPM disk, that combination screams random I/O queue saturation.

And because the VM is doing its I/O through LVM-thin, the guest can experience severe latency amplification.

That's why:

Guest PSI:
some  ~97%
full  ~92%


and the console becomes almost unusable.

I would NOT reboot VM 101 yet

Before doing anything disruptive, determine what is generating those reads.

On the PVE host, run:

iotop -oPa


If that's not installed:

apt install iotop
iotop -oPa


I'm particularly interested in whether the heavy I/O belongs to:

kvm for VM 101
another VM
an LXC container
a host process
lvm/device-mapper activity
Then identify the exact dm-* mapping

Run:

dmsetup ls --tree


and:

lvs -a -o lv_name,lv_size,data_percent,metadata_percent,devices


We already know vm-101-disk-1 is 100 GB, but this will let us correlate the dm-3/dm-4/dm-7 activity you saw with the actual LV.

There's another interesting clue: SMR

The WD10SPZX is an SMR drive.

SMR is particularly unhappy with workloads involving lots of small/random writes because the drive may have to perform internal read-modify-write work and reorganize tracks.

Your current sample happens to be heavily read-oriented, so SMR isn't necessarily the immediate trigger, but this is absolutely not a good primary datastore for a busy Docker VM.

I'd consider moving VM 101 to an SSD/NVMe-backed PVE storage as the actual fix.

Even a modest SATA SSD would be an enormous improvement.

Check the other disks

Interestingly, you also have:

sdb -> ST4000LM024 4 TB
sdc -> ST4000LM024 4 TB
       ↓
      md0 RAID1


Those are also mechanical laptop-style HDDs.

But VM 101 is not on those disks according to your configuration; it's on sda3 → local-lvm.

So don't chase md0 yet.

One SMART item I'd keep an eye on

This:

UDMA_CRC_Error_Count = 162


is worth investigating, although it isn't enough by itself to explain the current latency.

Check the SATA connection/cable/backplane if applicable, and see whether the CRC count increases over time:

smartctl -A /dev/sda | grep -E '5|187|188|197|198|199'


Run it again later and compare attribute 199.

But the current data does not look like a classic failing-drive situation.

My next move

While VM 101 is still suffering, run:

iotop -oPa
dmsetup ls --tree


Don't change anything yet.

If you paste those two outputs, we can identify who is generating the ~700 reads/sec. That will tell us whether the immediate problem is a Docker workload inside 101 or something else sharing /dev/sda.



```bash

Total DISK READ:        26.56 M/s | Total DISK WRITE:         0.00 B/s
Current DISK READ:      26.56 M/s | Current DISK WRITE:       0.00 B/s
    PID  PRIO  USER     DISK READ DISK WRITE>    COMMAND                                                                            
   1211 be/4 root          0.00 B    524.00 K pmxcfs
    366 be/4 root          0.00 B    400.00 K systemd-journald
   1440 be/4 root          0.00 B    132.00 K kvm -id 100 -name omv -no-shutdown -charde~t_tunnel=off -machine hpet=off,type=pc+pve0
   1764 be/4 root          0.00 B     95.00 K kvm -id 102 -name home-assitant -no-shutdo~lash1=drive-efidisk0,hpet=off,type=q35+pve0
   1581 be/4 root       1050.46 M     88.00 K kvm -id 101 -name docker-host -no-shutdown~lash1=drive-efidisk0,hpet=off,type=q35+pve0
    316 be/3 root          0.00 B     80.00 K [jbd2/dm-1-8]
    922 be/4 root          0.00 B     24.00 K rrdcached -g
 179590 be/4 www-data      0.00 B      8.00 K pveproxy worker
 184553 be/4 www-data      0.00 B      4.00 K pveproxy worker

 pve-data (252:5)
 └─pve-data-tpool (252:4)
    ├─pve-data_tdata (252:3)
    │  └─ (8:3)
    └─pve-data_tmeta (252:2)
       └─ (8:3)
pve-root (252:1)
 └─ (8:3)
pve-swap (252:0)
 └─ (8:3)
pve-vm--100--disk--0 (252:6)
 └─pve-data-tpool (252:4)
    ├─pve-data_tdata (252:3)
    │  └─ (8:3)
    └─pve-data_tmeta (252:2)
       └─ (8:3)
pve-vm--101--disk--0 (252:8)
 └─pve-data-tpool (252:4)
    ├─pve-data_tdata (252:3)
    │  └─ (8:3)
    └─pve-data_tmeta (252:2)
       └─ (8:3)
pve-vm--101--disk--1 (252:7)
 └─pve-data-tpool (252:4)
    ├─pve-data_tdata (252:3)
    │  └─ (8:3)
    └─pve-data_tmeta (252:2)
       └─ (8:3)
pve-vm--102--disk--0 (252:9)
 └─pve-data-tpool (252:4)
    ├─pve-data_tdata (252:3)
    │  └─ (8:3)
    └─pve-data_tmeta (252:2)
       └─ (8:3)
pve-vm--102--disk--1 (252:10)
 └─pve-data-tpool (252:4)
    ├─pve-data_tdata (252:3)
    │  └─ (8:3)
    └─pve-data_tmeta (252:2)
       └─ (8:3)

         LV              LSize   Data%  Meta%  Devices          
  data            794.30g 5.05   0.40   data_tdata(0)    
  [data_tdata]    794.30g               /dev/sda3(26624) 
  [data_tmeta]      8.10g               /dev/sda3(229966)
  [lvol0_pmspare]   8.10g               /dev/sda3(232040)
  root             96.00g               /dev/sda3(2048)  
  swap              8.00g               /dev/sda3(0)     
  vm-100-disk-0    16.00g 93.68                          
  vm-101-disk-0     4.00m 14.06                          
  vm-101-disk-1   100.00g 16.25                          
  vm-102-disk-0    32.00g 27.66                          
  vm-102-disk-1     4.00m 14.06

```


---

That nails it further.

VM 101 is the dominant I/O consumer. iotop shows its QEMU process:

PID 1581  kvm -id 101 -name docker-host
DISK READ: 1050.46 M


while the host is currently doing about:

26.56 MB/s reads
0 B/s writes


So VM 101 is responsible for essentially the entire sustained read workload.

And dmsetup confirms vm-101-disk-1 is going through the same thin pool backed directly by /dev/sda3.

What's happening

You have a classic random-read workload overwhelming a 5400-RPM SMR disk:

Docker / VM 101
       ↓
~20–28 MB/s reads
~400–700 IOPS
       ↓
LVM thin
       ↓
WD10SPZX 5400 RPM SMR
       ↓
~200–300 ms read latency
       ↓
queue depth ~60+
       ↓
VM processes block in I/O
       ↓
PSI some ~97%
PSI full ~92%
       ↓
console becomes unusable


The particularly telling number is the disk's ~200–300 ms r_await. The disk isn't bandwidth-starved; it's latency/IOPS-starved.

I would now look inside VM 101's workload

Since the guest console is unreliable, use the QEMU guest agent from the PVE host.

You have:

agent: 1


Try:

qm agent 101 ping


If that works, we can execute commands inside the guest without relying on its console.

For example:

qm agent 101 exec --timeout 10 -- /bin/sh -c 'ps -eo pid,ppid,stat,wchan:32,%cpu,%mem,comm,args --sort=-%cpu | head -30'


And:

qm agent 101 exec --timeout 10 -- /bin/sh -c 'cat /proc/pressure/io'


The most useful next command is to find the Docker processes generating the reads:

qm agent 101 exec --timeout 10 -- /bin/sh -c 'ps -eo pid,ppid,stat,wchan:32,comm,args | head -100'


If qm agent 101 ping doesn't respond, don't keep hammering the guest—the VM is probably too I/O-starved for the agent to get scheduled.

One thing I'd check before killing anything

Because this is named docker-host, a common culprit is something like:

database container doing a large scan
Docker overlay filesystem
container logging
backup/indexing process
media scanner
find/updatedb
Elasticsearch/OpenSearch
database checkpoint/recovery
Docker image/container storage activity

If you can get into the guest via the agent, we can identify the exact process.

Immediate recovery option

If the machine is effectively unusable and you need VM 101 back, the real solution is to move its disk to faster storage.

If you have an SSD/NVMe-backed PVE storage available, that's what I'd do rather than trying to tune the HDD.

Before that, though, I'd like to establish what workload is causing the reads, because stopping that workload may immediately bring the VM back without any migration.

Try this first:

qm agent 101 ping


If it returns successfully, tell me the result and we'll use the guest agent to identify the offending process without touching the VM's console.

```bash
QEMU guest agent is not running
```

---

Right — then agent: 1 only means the QEMU guest-agent integration is enabled in PVE; it doesn't mean the agent daemon is actually running inside Ubuntu.

Given how badly VM 101 is I/O-starved, I wouldn't try to install/start it right now. We can diagnose this entirely from the PVE host.

First: identify what QEMU is actually reading

Run this on the PVE host:

cat /proc/1581/io


The important fields are:

read_bytes:
write_bytes:
cancelled_write_bytes:


Then check the QEMU process's open files:

ls -l /proc/1581/fd | head -50


You should see the VM disk represented by a /dev/mapper/... device or similar.

More useful: trace the VM's I/O at the host

Because PID 1581 is VM 101:

pidstat -d -p 1581 1 10


This will confirm that QEMU itself is continuously issuing the reads.

Then check the other QEMU processes:

pidstat -d -p 1440,1581,1764 1 10


This will tell us whether VM 101 is overwhelmingly responsible or whether the other VMs contribute meaningfully.

But I think we should find the workload inside Docker

The VM is effectively frozen because the host's HDD has run out of random I/O capacity. Don't keep generating diagnostics that read from the VM's disk—they just add more pressure.

If you can SSH into VM 101, try that instead of the console:

ssh <user>@<vm101-ip>


If SSH works, immediately run:

sudo iotop -oPa


or:

sudo pidstat -d 1


Then:

docker stats --no-stream


and:

docker ps


That should get us to the actual offending container.

If SSH also doesn't work

At that point I'd seriously consider temporarily stopping the workload rather than repeatedly probing the disk.

From PVE, you can at least see whether VM 101 is consuming CPU:

ps -p 1581 -o pid,stat,%cpu,%mem,wchan:32,cmd


And inspect its QEMU I/O counters:

cat /proc/1581/io
sleep 10
cat /proc/1581/io


If read_bytes jumps by hundreds of MB in 10 seconds, we've confirmed that VM 101 is continuously pulling data from the disk.

The bigger fix

Even if we identify the container, I'd strongly recommend moving VM 101's 100 GB disk off this WD10SPZX.

That drive is:

5400 RPM + SMR + hosting the PVE OS + LVM-thin + a Docker VM.

That's a very poor combination for random I/O.

The SMART results are reassuring regarding imminent mechanical failure, but they don't change the fundamental performance limitation.

If you have an SSD/NVMe available on this PVE host, tell me what pvesm status shows for the other storage pools. I can give you the safest way to move vm-101-disk-1 to the faster storage while preserving the VM.

```bash
rchar: 75330480
wchar: 102361782
syscr: 8085659
syscw: 12792634
read_bytes: 155896997888
write_bytes: 2698146816
cancelled_write_bytes: 0


total 0
lrwx------ 1 root root 64 Aug 26 14:44 0 -> /dev/null
lrwx------ 1 root root 64 Aug 26 14:44 1 -> /dev/null
lrwx------ 1 root root 64 Aug 26 14:44 10 -> anon_inode:[eventfd]
lrwx------ 1 root root 64 Aug 26 14:44 100 -> anon_inode:[eventfd]
lrwx------ 1 root root 64 Aug 26 14:44 101 -> anon_inode:[eventfd]
lrwx------ 1 root root 64 Aug 26 14:44 102 -> anon_inode:[eventfd]
lrwx------ 1 root root 64 Aug 26 14:44 103 -> anon_inode:[eventfd]
lrwx------ 1 root root 64 Aug 26 14:44 104 -> anon_inode:[eventfd]
lrwx------ 1 root root 64 Aug 26 14:44 105 -> anon_inode:[eventfd]
lrwx------ 1 root root 64 Aug 26 14:44 106 -> anon_inode:[eventfd]
lrwx------ 1 root root 64 Aug 26 14:44 107 -> anon_inode:[eventfd]
lrwx------ 1 root root 64 Aug 26 14:44 108 -> anon_inode:[eventfd]
lrwx------ 1 root root 64 Aug 26 14:44 109 -> anon_inode:[eventfd]
l-wx------ 1 root root 64 Aug 26 14:44 11 -> pipe:[11702]
lrwx------ 1 root root 64 Aug 26 14:44 110 -> anon_inode:[eventfd]
lrwx------ 1 root root 64 Aug 26 14:44 111 -> anon_inode:[eventfd]
lrwx------ 1 root root 64 Aug 26 14:44 112 -> anon_inode:[eventfd]
lrwx------ 1 root root 64 Aug 26 14:44 113 -> anon_inode:[eventfd]
lrwx------ 1 root root 64 Aug 26 14:44 114 -> anon_inode:[eventfd]
lrwx------ 1 root root 64 Aug 26 14:44 115 -> anon_inode:[eventfd]
lrwx------ 1 root root 64 Aug 26 14:44 116 -> anon_inode:[eventfd]
lrwx------ 1 root root 64 Aug 26 14:44 117 -> anon_inode:[eventfd]
lrwx------ 1 root root 64 Aug 26 14:44 118 -> anon_inode:[eventfd]
lrwx------ 1 root root 64 Aug 26 14:44 119 -> anon_inode:[eventfd]
lr-x------ 1 root root 64 Aug 26 14:44 12 -> pipe:[11755]
lrwx------ 1 root root 64 Aug 26 14:44 120 -> anon_inode:[eventfd]
lrwx------ 1 root root 64 Aug 26 14:44 121 -> anon_inode:[eventfd]
lrwx------ 1 root root 64 Aug 26 14:44 122 -> anon_inode:[eventfd]
lrwx------ 1 root root 64 Aug 26 14:44 123 -> anon_inode:[eventfd]
lrwx------ 1 root root 64 Aug 26 14:44 124 -> anon_inode:[eventfd]
lrwx------ 1 root root 64 Aug 26 14:44 125 -> anon_inode:[eventfd]
lrwx------ 1 root root 64 Aug 26 14:44 126 -> anon_inode:[eventfd]
lrwx------ 1 root root 64 Aug 26 14:44 127 -> anon_inode:[eventfd]
lrwx------ 1 root root 64 Aug 26 14:44 128 -> anon_inode:[eventfd]
lrwx------ 1 root root 64 Aug 26 14:44 129 -> anon_inode:[eventfd]
lrwx------ 1 root root 64 Aug 26 14:44 13 -> anon_inode:[io_uring]
lrwx------ 1 root root 64 Aug 26 14:44 130 -> anon_inode:[eventfd]
lrwx------ 1 root root 64 Aug 26 14:44 131 -> anon_inode:[eventfd]
lrwx------ 1 root root 64 Aug 26 14:44 14 -> anon_inode:[eventfd]
lrwx------ 1 root root 64 Aug 26 14:44 15 -> anon_inode:[eventfd]
lrwx------ 1 root root 64 Aug 26 14:44 16 -> anon_inode:[io_uring]
lrwx------ 1 root root 64 Aug 26 14:44 17 -> anon_inode:[eventfd]
lrwx------ 1 root root 64 Aug 26 14:44 18 -> socket:[16106]
lrwx------ 1 root root 64 Aug 26 14:44 19 -> socket:[16107]
lrwx------ 1 root root 64 Aug 26 14:44 2 -> socket:[11096]
lrwx------ 1 root root 64 Aug 26 14:44 20 -> socket:[11056]
lr-x------ 1 root root 64 Aug 26 14:44 21 -> /usr/share/pve-edk2-firmware/OVMF_CODE_4M.secboot.fd
lrwx------ 1 root root 64 Aug 26 14:44 22 -> /dev/dm-8
lr-x------ 1 root root 64 Aug 26 14:44 23 -> /var/lib/vz/template/iso/ubuntu-26.04-live-server-amd64.iso

```

---

Yes — this is now pretty conclusive.

What the numbers tell us

QEMU PID 1581 has accumulated:

read_bytes:  155,896,997,888   ≈ 145 GiB
write_bytes:   2,698,146,816   ≈ 2.5 GiB


That's ~145 GiB of actual block-device reads from VM 101.

And /proc/1581/fd shows:

22 -> /dev/dm-8


So QEMU is directly holding the VM's block device open. From your earlier mapping, dm-8 is:

pve-vm--101--disk--0


Important: that's the tiny 4 MiB EFI disk, not the 100 GB vm-101-disk-1.

So we need to be careful here: the /proc/PID/io counters prove QEMU is doing enormous I/O, but they don't tell us which virtual disk is generating it.

Your earlier dmsetup/iostat output strongly points at the 100 GB disk (dm-7), but let's map the QEMU file descriptors properly.

Do this next — very useful

Run:

ls -l /proc/1581/fd | grep '/dev/dm'


Then:

for x in /dev/dm-*; do
    printf '%-12s ' "$x"
    dmsetup info -c --noheadings -o name "$x" 2>/dev/null
done


And most importantly:

qm config 101


We already know the relevant config is:

scsi0: local-lvm:vm-101-disk-1


but I want to correlate the actual QEMU block devices.

Even better: inspect QEMU's command line

Run:

tr '\0' '\n' < /proc/1581/cmdline | grep -E 'drive|file=|vm-101'


You should get the mappings QEMU is using for the disks.

One thing jumps out from your earlier iostat

This is the smoking gun:

sda  ...  r/s 362 ... r_await 173.93 ... %util 97-100%


and:

dm-3 / dm-4 / dm-7
~400-700 reads/s
~170-320 ms read latency
~100% utilization


That is not normal LVM-thin behavior. The underlying physical disk is simply drowning in random reads.

The fact that the workload is only around 17–28 MB/s but produces ~100% utilization is exactly what you'd expect from a slow mechanical disk handling lots of small/random reads.

Your WD10SPZX is a 5400-RPM SMR laptop HDD. It can deliver reasonable sequential throughput, but random I/O under virtualization can absolutely collapse like this.

I would NOT run a SMART long test right now

Your SMART data doesn't show an obvious failing disk:

Reallocated:       0
Pending:           0
Offline uncorrectable: 0
SMART: PASSED


So this currently looks much more like performance saturation than imminent disk failure.

A long SMART test would itself hammer the disk and potentially make VM 101 even less responsive.

We can identify the actual guest culprit without the guest agent

There is another trick.

Because QEMU is reading the virtual disk, we can inspect the guest's virtual disk I/O pattern from the host, but identifying the process inside the guest requires either:

guest agent,
SSH,
guest console,
or temporarily reducing the workload until one becomes usable.

If SSH to VM 101 still works, that's the best option.

Try:

ssh <vm101-user>@<vm101-ip>


If you get in, don't run iotop yet. First run:

sudo cat /proc/pressure/io


then:

sudo docker stats --no-stream


and:

sudo ps -eo pid,stat,%cpu,%mem,comm,args --sort=-%cpu | head -30


If Docker is responsible, docker stats should give us a strong clue.

If SSH is dead too

Then stop trying to interrogate VM 101 from inside.

At that point I'd do one of two things:

If VM 101 can tolerate downtime: shut it down from PVE and move its 100 GB disk to SSD/NVMe.
If it cannot: identify which host-side operation is causing the reads and throttle/stop that workload.

Given your hardware, my strong suspicion is that VM 101 is running a workload such as a database, Docker storage operation, media/indexing workload, or filesystem scan that is generating hundreds of random reads/sec.

The next output I want is simply:

qm config 101
tr '\0' '\n' < /proc/1581/cmdline | grep -E 'drive|file=|vm-101'
ls -l /proc/1581/fd | grep '/dev/dm'


With those three outputs, we can pin down which virtual disk is being hammered before doing anything destructive.

---

Problem location

/dev/sda is the bottleneck.

VM 101
  ↓
vm-101-disk-1
  ↓
pve-data-tpool
  ↓
/dev/sda3
  ↓
WDC WD10SPZX 1TB SMR HDD


Evidence:

sda hits ~97–100% utilization
Read latency reaches ~200–340 ms
Host CPU reaches 95–98% iowait
VM 101 is generating the majority of the reads
SMART shows no bad sectors, but this is a 5400 RPM SMR HDD

md0 / sdb / sdc are not the problem.

The immediate issue is therefore VM 101's disk workload stalling on the slow SMR sda. QEMU guest agent/SSH is a separate issue.

---

```bash
root@pve:~# qm config 101
pvesm status
agent: 1
balloon: 3072
bios: ovmf
boot: order=scsi0;ide2;net0
cores: 4
cpu: host
efidisk0: local-lvm:vm-101-disk-0,efitype=4m,ms-cert=2023k,pre-enrolled-keys=1,size=4M
ide2: local:iso/ubuntu-26.04-live-server-amd64.iso,media=cdrom,size=2850194K
machine: q35
memory: 6144
meta: creation-qemu=11.0.2,ctime=1785747085
name: docker-host
net0: virtio=BC:24:11:03:17:20,bridge=vmbr0,firewall=1
numa: 0
onboot: 1
ostype: l26
scsi0: local-lvm:vm-101-disk-1,iothread=1,size=100G
scsihw: virtio-scsi-single
smbios1: uuid=REDACTED
sockets: 1
startup: order=2,up=30,down=120
vmgenid: REDACTED
Name             Type     Status     Total (KiB)      Used (KiB) Available (KiB)        %
local             dir     active        98497780         8473460        84974772    8.60%
local-lvm     lvmthin     active       832888832        42060886       790827945    5.05%
```