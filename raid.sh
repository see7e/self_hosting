# check raid metadata
mdadm --examine /dev/sdb

# assemble
mdadm --assemble --run /dev/md0 /dev/sdb2 
# mdadm: /dev/md0 has been started with 1 drive (out of 2).

# check partitions
lsblk -f
# NAME               FSTYPE            FSVER    LABEL       UUID                                   FSAVAIL FSUSE% MOUNTPOINTS
# sdb                                                                                                             
# ├─sdb1                                                                                                          
# └─sdb2             linux_raid_member 1.2      serverino:0 62043088-c665-dd6e-c511-e522afa7bfd2                  
#   └─md0            ext4              1.0                  5a2a7709-6542-4c38-8ec0-9fdbafc3af54                  

# Mounting point
mkdir -p /mnt/recovery
mount /dev/md0 /mnt/recovery
ls -lah /mnt/recovery # check
# total 36K
# drwxr-xr-x  6 root root  4.0K Dec 15  2024 .
# drwxr-xr-x  3 root root  4.0K Jul 24 11:44 ..
# drwxrwsr-x 10 root users 4.0K Dec 15  2024 compose
# drwx------  2 root root   16K Dec  7  2024 lost+found
# drwxr-xr-x  3 root root  4.0K Dec 15  2024 serv_hared
# drwxrwsr-x 11 root users 4.0K Dec 14  2024 serv_shared

# copy files
rsync -avh --mkpath --progress /mnt/recovery/compose/ ~/serverino_recover/compose/


