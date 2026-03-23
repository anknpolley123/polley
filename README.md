# polley

A linux tool which is used to control a device with a image or hack ethically with a image [with reverse_shell payloads within the PNG images]

## COMMANDS 

# Setting up terminal

To use this tool, copy and paste these commands into your Kali Linux terminal:
'''bash
# 1. Update Your Terminal 
sudo apt update && sudo apt upgrade

# 2. Install Necessary Tools
sudo apt install build-essential libpng-dev 
sudo apt install zlib1g-dev

# 3. Now, Clone The Respiratory (polley)
git clone https://github.com/anknpolley123/polley.git

# 4. Enter The Folder
cd polley

# 5. Then, Compile The File reverse_shell.c
gcc -o reverse_shell reverse_shell.c

# 6. Compile The File embed_payload.c
gcc -o embed_payload.c embed_payload -lpng

# 7. Compile The File craft_malicious_png
gcc -o craft_malicious_png craft_malicious_png.c -lpng

# 8. Now, Run The Command
sudo apt install netcat-traditional -y

# 9. Run The Final Command
./run_all.sh

# DISCLAIMER 
This Tool is only for Educational Purpose. We are not responsible for the Misuse or Any Harm by it.


[Thank You For Using My linux Tool 'polley']

For More Information You Can Contact me: ankonpolley@proton.me
Or My Instagram Id: @itz_vorzhevik_volnyshev ; alt: itz_ankon_polley
Support Me on Twitter'X': @AnkonPolley
Follow My Pinterest account: @ankonpolley
Support me also in Facebook: Ankon Polley
