### Step 1: Clear Docker Source Entries

To remove all Docker-related source entries, run:

```bash
sudo rm -f /etc/apt/sources.list.d/docker.list
sudo rm -f /etc/apt/sources.list.d/archive_uri-https_download_docker_com_linux_ubuntu-bookworm.list
```

### Step 2: Add the Correct Docker Repository for Debian

Now, set up the correct Docker repository specifically for Debian:

1. **Re-add Docker’s GPG Key:**

   ```bash
   sudo install -m 0755 -d /etc/apt/keyrings
   curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
   ```

2. **Create a Repository File with the Correct Debian Path:**

   ```bash
   echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian bookworm stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
   ```

### Step 3: Update Package Lists and Install Docker

1. **Update package lists to include the new Docker source:**

   ```bash
   sudo apt update
   ```

2. **Attempt Docker Installation:**

   ```bash
   sudo apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
   ```

### Step 4: Verify Docker Installation

After installing Docker, check if it’s correctly installed with:

```bash
sudo docker --version
```

This should resolve the conflicting entries and allow the installation of Docker packages on Debian "Bookworm". Let me know if this works for you!
