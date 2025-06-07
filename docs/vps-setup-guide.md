
# ☁️ Oracle Cloud Free VPS Setup for C Development

This guide walks you through setting up a free Debian 12 VPS on Oracle Cloud, perfect for remote C/C++ development using VS Code.

---

## 📌 Prerequisites

- Oracle Cloud account (sign up [here](https://www.oracle.com/cloud/free/))
- Credit card for verification
- Visual Studio Code with the [Remote - SSH](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-ssh) extension

---

## 🧾 Oracle Cloud Account Registration

When visiting the [Oracle Cloud](https://www.oracle.com/cloud/) website, new users need to **register and log in**. During registration, you are required to **link a credit card** for identity verification.

Oracle provides a set of **Always Free** resources sufficient for personal VPS use. However, it also includes paid services.  
⚠️ **Be cautious not to exceed the free tier quota to avoid charges.**

> 💡 Tip: Start with basic configuration. Resources can be scaled later.

---

## 🌍 Selecting Your Home Region

After account registration and logging in, you will be prompted to select your **Home Region**.  
Your Home Region is where your resources and services will be primarily hosted.

- Choose a region **closest to your physical location** for better latency and performance.  
- For users in Finland, regions like **Frankfurt (eu-frankfurt-1)** or **Stockholm (eu-stockholm-1)** are good choices.  
- The Home Region can be changed later, but it requires additional steps, so pick carefully.

---

## 🏗️ Step-by-Step: Creating a VPS on Oracle Cloud

### 1. Log in and Navigate to **Compute > Instances**

📸 *Insert screenshot here*

---

### 2. Click **Create Instance**

📸 *Insert screenshot here*

---

### 3. Basic Info & Shape Selection

- **Name**: `42_server`
- **Image**: Debian 12 (ARM or AMD depending on availability)
- **Shape**:  
  - `VM.Standard.A1.Flex` (Ampere ARM — Always Free)  
  - `VM.Standard.E2.1.Micro` (AMD — Always Free)

📸 *Insert screenshot here*

---

### 4. Networking Settings

- **Create new virtual cloud network (VCN)**
- **Create new public subnet**
- Enable **Public IPv4 Address**
- Subnet Access: **Public**

📸 *Insert screenshot here*

---

### 5. Configure SSH and Boot Volume

- Paste your **SSH public key**
- Boot volume:
  - Size: `50 GB`
  - VPU: `10`

📸 *Insert screenshot here*

---

### 6. Add Ingress Rules for Port 22

Navigate to:

`Networking > Virtual Cloud Network > Subnet > Security Lists`

Add an ingress rule:

| Source CIDR | Protocol | Port |
|-------------|----------|------|
| 0.0.0.0/0   | TCP      | 22   |

📸 *Insert screenshot here*

---

## 🌐 Set Up Internet Gateway and Route Table

1. **Create Internet Gateway** in your VCN.
2. Go to the **Route Table** used by your Public Subnet.
3. Add a Route Rule:

- **Destination CIDR Block**: `0.0.0.0/0`  
- **Target Type**: Internet Gateway

📸 *Insert screenshot here*

---

## 🖥️ Connect to Your VPS from VS Code

Use the [Remote - SSH](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-ssh) plugin.

Example SSH config (`~/.ssh/config`):

```ssh
Host oracle-vps
  HostName <Your Public IP>
  User debian
  IdentityFile <key file>
```

Then connect using:

```bash
ssh oracle-vps
```

📸 *Insert screenshot here*

---

## ⚙️ Install C Development Tools

Create a script called `install-dev-tools.sh` on your VPS:

```bash
#!/bin/bash
sudo apt update
sudo apt install -y build-essential gdb valgrind git curl wget
```

Then run the script:

```bash
chmod +x install-dev-tools.sh
./install-dev-tools.sh
```

📸 *Insert screenshot here*

---

## ✅ Done!

You now have a free VPS running Debian 12 with C development tools installed, and remote SSH access via VS Code.

---

## 📌 License

This guide is free to use and distribute. Consider crediting the original author when sharing.
