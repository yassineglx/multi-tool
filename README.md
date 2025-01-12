
# 🔐 Advanced Penetration Testing Toolkit

![Toolkit Banner](https://via.placeholder.com/1000x200?text=Advanced+Penetration+Testing+Toolkit) <!-- Replace with an actual banner image URL -->

**A comprehensive multi-tool for ethical hackers, penetration testers, and network administrators.**  
This toolkit combines powerful scripts for network reconnaissance, Wi-Fi monitoring, rogue device detection, and mitigation, all within a single script.

---

## 🚀 **Features**
### 🔍 **Network Scanning & Reconnaissance**
- Inspect network configurations and ARP tables.
- View active network connections.

### 🔑 **Password Attacks**
- Dump credentials and password hashes using **Mimikatz**.
- Extract Wi-Fi passwords.

### 📈 **Privilege Escalation**
- Simulate **UAC bypass**.
- Identify misconfigured services for potential escalation.

### 💻 **Exploitation**
- Generate custom payloads with `msfvenom`.
- Execute commands remotely with **PsExec**.

### 🛠️ **Post-Exploitation**
- Automate persistence and extract sensitive data.

### 📡 **Wi-Fi Tools**
- Retrieve stored Wi-Fi passwords.
- Monitor for rogue devices and deauthentication attacks.

### 🔒 **Wi-Fi Detection & Mitigation**
- Detect **ARP spoofing** and **deauthentication attacks**.
- Automatically block rogue devices using SNMP.

### 📝 **Logging & Reporting**
- Save logs for attacks, rogue devices, bandwidth usage, and mitigation actions.

---

## 📋 **Requirements**
### **General Requirements**
- **Operating System**: Windows 7, 8, 10, or 11 (Admin privileges required).
- **Execution Environment**: Command Prompt with admin rights and PowerShell.

### **Required Tools**
| Tool                  | Purpose                                              | Link                                                                 |
|-----------------------|------------------------------------------------------|----------------------------------------------------------------------|
| **Wireshark & TShark**| Packet capture and analysis                          | [Download](https://www.wireshark.org/)                              |
| **Mimikatz**          | Credential dumping                                   | [Download](https://github.com/gentilkiwi/mimikatz)                  |
| **PsExec**            | Remote command execution                            | [Download](https://learn.microsoft.com/en-us/sysinternals/)         |
| **SNMP Tools**        | Automated blocking of rogue devices                 | Included in [Net-SNMP](https://sourceforge.net/projects/net-snmp/)  |
| **Router with SNMP**  | Required for blocking rogue devices via automation.  | Check your router's documentation for SNMP support.                 |

---

## 🛠️ **Installation**
1. **Install Required Tools**:
   - Install Wireshark, TShark, and other dependencies listed above.
   - Ensure executables (e.g., `tshark.exe`, `snmpset.exe`) are in the system `PATH`.

2. **Enable SNMP on Router**:
   - Log into your router and enable SNMP.
   - Configure community strings (e.g., `public` for read-only, `private` for read-write).

3. **Run the Script**:
   - Save the script as `PenTestToolkit.bat`.
   - Right-click the file and select **Run as Administrator**.

---

## 📖 **Usage**
### **Main Menu**
Select from the following options:
1. **Network Scanning**: Inspect configurations, active connections, and ARP tables.
2. **Password Attacks**: Dump credentials using Mimikatz.
3. **Privilege Escalation**: Simulate UAC bypass and find vulnerable services.
4. **Exploitation**: Generate payloads with `msfvenom` and execute remotely.
5. **Post-Exploitation**: Automate persistence and sensitive data extraction.
6. **Wi-Fi Tools**: Retrieve stored Wi-Fi passwords and monitor activity.
7. **Wi-Fi Detection & Mitigation**:
   - Detect:
     - Deauthentication attacks.
     - ARP spoofing (e.g., SelfishNet).
     - Rogue devices.
   - Mitigate:
     - Block rogue devices using SNMP.
     - Log findings for future analysis.
8. **Logging & Reporting**: Save activity logs for analysis.

---

## 📂 **Log Files**
| File Name            | Description                                              |
|----------------------|----------------------------------------------------------|
| **wifi_attack_log.txt** | Logs detected Wi-Fi attacks (e.g., deauthentication).    |
| **arp_spoof_log.txt**  | Logs ARP spoofing attempts (duplicate MAC detection).     |
| **rogue_devices.txt**  | Lists unauthorized devices on the network.               |
| **block_log.txt**      | Logs all blocked MAC addresses with timestamps.           |
| **bandwidth_log.txt**  | Tracks unusual network traffic patterns and bandwidth.    |

---

## 💡 **Examples**
### **1. Detect ARP Spoofing (e.g., SelfishNet)**:
1. Run the script and select **Wi-Fi Detection & Mitigation** > **Detect ARP Spoofing**.
2. Check `arp_spoof_log.txt` for detected attacks.
3. Manually or automatically block suspicious devices.

### **2. Block Rogue Devices Automatically**:
1. Ensure SNMP is enabled on your router.
2. Add unauthorized devices to `rogue_devices.txt`.
3. Select **Wi-Fi Detection & Mitigation** > **Automatically Block Rogue Devices**.
4. Check `block_log.txt` for confirmation of blocked devices.

### **3. Monitor Wi-Fi Deauthentication Attacks**:
1. Ensure TShark is installed.
2. Select **Wi-Fi Detection & Mitigation** > **Detect Deauthentication Packets**.
3. Review detected packets in `wifi_attack_log.txt`.

---

## ⚠️ **Limitations**
- **Legal Compliance**: Ensure you have proper authorization to test the network.
- **Router Compatibility**: Automated blocking requires SNMP-compatible routers.
- **Dependencies**: Ensure required tools (Wireshark, TShark, SNMP utilities) are installed.

---

## 🛡️ **Disclaimer**
This toolkit is for **educational and ethical purposes only**. Unauthorized use is prohibited and may violate local laws or regulations. Always obtain proper permissions before testing any network.

---

## 📬 **Support**
- **Issues**: Report issues or request features via the GitHub [Issues](https://github.com/your-repo/issues) page.
- **Email**: support@example.com
- **Documentation**: [Project Docs](https://example.com/docs) (replace with your link).

---

## ⭐ **Contribute**
Contributions are welcome! Please fork this repository, create a feature branch, and submit a pull request.

---

## 📜 **License**
This project is licensed under the **MIT License**. See the `LICENSE` file for details.
