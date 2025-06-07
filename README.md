# oracle-free-vps-dev-setup
A step-by-step guide to set up a free Debian VPS on Oracle Cloud for C/C++ development using VS Code.

# Oracle Free VPS for C Development

Set up a free Debian-based cloud development environment on Oracle Cloud Infrastructure (OCI) and connect to it with VS Code. Ideal for students, especially those working on 42 projects or learning C programming remotely.

---

## 🚀 Features

- ✅ Free-tier eligible ARM/AMD virtual machines (OCI)
- 🐧 Debian 12 cloud image setup
- 🔐 SSH key authentication
- 💻 Remote development with VS Code
- ⚙️ Installation of essential C/C++ build tools

---

## 📌 Prerequisites

- Oracle Cloud account with Always Free quota
- Basic terminal knowledge
- VS Code installed with the [Remote - SSH](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-ssh) extension
- An SSH key pair (`.key` or `.pem` file)

---

## ⚙️ [Step-by-Step Guide](/docs/vps-setup-guide.md/)

### 1. Provision a Free VPS

- Log in to [Oracle Cloud Console](https://cloud.oracle.com/)
- Go to **Compute → Instances → Create Instance**
- Choose:
  - **Shape**: `VM.Standard.A1.Flex` (ARM, Always Free) or `VM.Standard.E2.1.Micro` (AMD, Always Free)
  - **Image**: Debian 12 ARM or AMD
  - **Network**: Create new VCN and subnet (public)
  - **SSH key**: Paste your public key
- Under `Advanced → Networking`, ensure:
  - Public IPv4 address is enabled
  - Security list allows **port 22 (SSH)** from `0.0.0.0/0`
  - Route table uses an Internet Gateway for `0.0.0.0/0`

### 2. Connect via SSH (VS Code)

- In VS Code, open the Command Palette → `Remote-SSH: Connect to Host...`
- Use the following config in `~/.ssh/config`:

```ssh
Host <Your Server Name>
    HostName <YOUR PUBLIC IP>
    User debian
    IdentityFile ~/path/to/your/private-key.key
