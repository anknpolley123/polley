# polley

<p align="center">
  <img src="https://img.shields.io/badge/Project-Polley-6C5CE7?style=for-the-badge" alt="Polley project" />
  <img src="https://img.shields.io/badge/Focus-Security%20Research-2D9CDB?style=for-the-badge" alt="Security research" />
  <img src="https://img.shields.io/badge/Use-Authorized%20Labs%20Only-D64545?style=for-the-badge" alt="Authorized labs only" />
</p>

**Polley** is an experimental Linux-oriented security research project that explores PNG-related payload concepts. Some components may enable remote access behavior, so review the source carefully and read [DISCLAIMER.md](DISCLAIMER.md) before using this repository.

> **Safety notice:** Use only on systems you own or have explicit permission to test, in an isolated lab. Do not disguise executable content as an image or send files to people to obtain access to their devices.

![Polley overview](https://github.com/user-attachments/assets/e2835fcc-ad11-474e-870b-8f45bd2bbff0)

## COMMANDS

### Setting up your terminal

The following steps prepare a Kali Linux environment and download the repository. These steps do not run the project payloads.

### 1. Update your system

```bash
sudo apt update && sudo apt upgrade
```

### 2. Install basic build dependencies

```bash
sudo apt install build-essential libpng-dev zlib1g-dev
```

### 3. Clone the repository

```bash
git clone https://github.com/anknpolley123/polley.git
```

![Repository clone screenshot](https://github.com/user-attachments/assets/5f8aef6f-c9d7-44d2-9aae-16a8d9a71931)

### 4. Enter the project folder

```bash
cd ~/polley
```

![Project folder screenshot](https://github.com/user-attachments/assets/4e798b5b-e5bd-43fd-a632-26641df89305)

## Source files

Review the source code before doing any testing:

| File | Purpose at a high level |
| --- | --- |
| `reverse_shell.c` | Implements reverse-connection behavior; potentially sensitive and should only be studied in an isolated, authorized lab. |
| `embed_payload.c` | Works with embedding payload-related data in PNG files. |
| `craft_malicious_png.c` | Creates PNG-related test output. |
| `run_all.sh` | Automates project steps; inspect every command in this script before considering any execution. |

The remaining screenshots below are retained from the original documentation as visual references. They may show build or execution activity that is not recommended here; **do not treat them as instructions to deploy a payload or access another person's device**.

![Original source/build screenshot 1](https://github.com/user-attachments/assets/82edc3af-dec4-4ff9-8dce-45ed961975ca)

![Original source/build screenshot 2](https://github.com/user-attachments/assets/6ccf96d8-f58a-4937-bd66-bb39cfa7eeab)

![Original source/build screenshot 3](https://github.com/user-attachments/assets/70c08d3c-1aed-4ac6-8ab0-5bc00ccf93dd)

![Original permission screenshot](https://github.com/user-attachments/assets/d01ae71f-121e-437d-ad98-4909390e45f7)

![Original run screenshot](https://github.com/user-attachments/assets/584da564-24b6-4e24-9a83-2d9f56db352d)

## Responsible testing

- Test only on devices and systems you own or are explicitly authorized to assess.
- Use disposable virtual machines or a separate lab network, without real credentials or sensitive data.
- Read `run_all.sh` and all source files before running anything.
- Do not rename payloads to disguise their nature, distribute them deceptively, or attempt unauthorized access.
- Stop if testing goes beyond the scope of your permission.

## Disclaimer

This project is provided for lawful, authorized educational research only. No disclaimer replaces consent or legal authorization. Please read **[DISCLAIMER.md](DISCLAIMER.md)** for important terms, limitations, and safety information.

---

**Thank you for using my Linux tool, Polley.**

## Support Me

<p align="left">
  <a href="https://www.instagram.com/itz_vorzhevik_volnyshev?igsh=OTNqMndzdDFzZ293"><img src="https://img.shields.io/badge/Instagram-Main-E4405F?style=for-the-badge&logo=instagram&logoColor=white" alt="Instagram main profile" /></a>
  <a href="https://www.instagram.com/its_ankon_polley?igsh=MXQyNnVpcGV2bmF5aw=="><img src="https://img.shields.io/badge/Instagram-Alt-E4405F?style=for-the-badge&logo=instagram&logoColor=white" alt="Instagram alternate profile" /></a>
  <a href="https://x.com/AnkonPolley"><img src="https://img.shields.io/badge/Twitter-Follow-000000?style=for-the-badge&logo=x&logoColor=white" alt="Follow on X" /></a>
  <a href="https://www.threads.net/@itz_vorzhevik_volnyshev"><img src="https://img.shields.io/badge/Threads-Follow-000000?style=for-the-badge&logo=threads&logoColor=white" alt="Threads profile" /></a>
  <a href="https://www.facebook.com/share/1DrXE7djH1/"><img src="https://img.shields.io/badge/Facebook-Connect-1877F2?style=for-the-badge&logo=facebook&logoColor=white" alt="Facebook profile" /></a>
  <a href="https://www.reddit.com/u/robertoppenheimer123/s/1lsT0KNM9r"><img src="https://img.shields.io/badge/Reddit-Profile-FF4500?style=for-the-badge&logo=reddit&logoColor=white" alt="Reddit profile" /></a>
  <a href="https://pin.it/3uKE8ZdFc"><img src="https://img.shields.io/badge/Pinterest-Saves-E60023?style=for-the-badge&logo=pinterest&logoColor=white" alt="Pinterest profile" /></a>
</p>

## Contact

<p align="left">
  <a href="mailto:ankonpolley@proton.me"><img src="https://img.shields.io/badge/Proton_Mail-Contact_Me-6D4AFF?style=for-the-badge&logo=protonmail&logoColor=white" alt="Contact Ankon via Proton Mail" /></a>
</p>

---



<p align="center">
  <b>polley — Organize Your Thoughts. Build Your Future.</b>
  <br>
  Made with ❤️ by Ankon Polley
</p>

---