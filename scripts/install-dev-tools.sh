#!/bin/bash

# ========== 1. Add 1GB Swap ==========
# Create a 1GB swap file
echo "Creating 1GB swap file at /swapfile..."
sudo fallocate -l 1G /swapfile || sudo dd if=/dev/zero of=/swapfile bs=1M count=1024

# Set correct permissions
echo "Setting permissions..."
sudo chmod 600 /swapfile

# Make it a swap file
echo "Configuring swap..."
sudo mkswap /swapfile

# Enable swap
sudo swapon /swapfile

# Add to /etc/fstab for automatic mount on reboot
echo "Persisting swap in /etc/fstab..."
echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab

# Reduce swappiness (prefer RAM)
echo "Setting vm.swappiness to 10 (default is 60)..."
echo 'vm.swappiness=10' | sudo tee -a /etc/sysctl.conf
sudo sysctl -p

# Show result
echo "✅ wap added:"
free -h

# ========== 2. Install tools ==========
set -e

echo "Updating package list..."
sudo apt update
sudo apt upgrade -y

echo "Installing essential build tools (gcc, g++, make)..."
sudo apt install -y build-essential

echo "Installing debugging tools (gdb, valgrind)..."
sudo apt install -y gdb valgrind

echo "Installing Clang/LLVM toolchain (optional)..."
sudo apt install -y clang

echo "Installing Git version control..."
sudo apt install -y git

echo "Installing file navigation and terminal tools..."
sudo apt install -y tree wget curl unzip nano vim 

# ========== 3. (Optional) VS Code settings guidance ==========
echo ""
echo "Reminder:"
echo "To disable VS Code Remote auto-updates, open VS Code settings (Ctrl+Shift+P) -> Preferences: Open Remote Settings (JSON)"
echo "and add the following to your settings.json:"
echo ""
cat <<'EOF'
{
  "remote.SSH.useLocalServer": false,
  "remote.SSH.remoteServerListenOnSocket": false,
  "remote.SSH.enableRemoteServerDownload": false
}
EOF

echo ""
echo "🎉 Development environment is ready!"