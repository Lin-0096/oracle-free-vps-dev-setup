#!/bin/bash

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

echo "Development environment is ready!"
