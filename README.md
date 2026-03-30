# Open Source Audit: Python Ecosystem

**Student Name:** Madhav Agarwal  
**Registration Number:** 24BHI10074  
**Course:** Open Source Software  
**Institution:** VIT Bhopal University  

---

##  Project Overview
This repository contains a comprehensive audit of **Python**, exploring its origin, licensing, and ethical impact on the software industry. I have developed five automated shell scripts designed to monitor, analyze, and interact with a Linux-based environment where Python is deployed.

##  Prerequisites & Dependencies
To execute these scripts, a Linux environment (Ubuntu/Debian recommended) is required with the following packages installed:
* **Bash Shell** (v4.0 or higher)
* **Python 3**
* **Standard Linux Utilities:** `grep`, `awk`, `du`, `uptime`, `pgrep`, `nano`

### Installation of Dependencies (Ubuntu/Debian):
```bash
sudo apt update
sudo apt install  python3 procps coreutils
```
## Script Documentation & Analysis

### System Identity Report (systemId.sh)

Detailed Description: This script acts as a system "handshake" or dashboard. It programmatically interrogates the Linux kernel and filesystem to retrieve the environment's identity. By parsing /etc/os-release and calling uname, it provides a unified view of the host's distribution, kernel version, and current session data.

Key Logic: Uses Command Substitution to capture volatile system data into persistent shell variables for formatted output.

Audit Value: Essential for verifying that the target environment meets the software’s compatibility requirements.

### FOSS Package Inspector (pkgCheck.sh)

Detailed Description: A diagnostic utility that verifies the presence of a specific Open Source package (defaulting to Python). It checks if the binary exists in the system $PATH and retrieves its version number.

Key Logic: Employs a Case Statement to map package names to their historical "philosophy" and an If-Then-Else block for binary status checking.

Audit Value: Automates the "dependency check" phase of software deployment.

### Log File Analyzer (log_analyzer.sh)

Detailed Description: A stream-processing tool designed for large-scale log files. Unlike text editors that load an entire file into memory, this script reads the file line-by-line to find and count specific diagnostic keywords (e.g., "ERROR" or "CRITICAL").

Key Logic: Utilizes a While-Read Loop and Positional Parameters ($1, $2) to allow for dynamic, reusable file analysis.

Audit Value: Critical for "Post-Mortem" analysis after a software crash or system failure.

### Disk and Permission Auditor (diskAudit.sh)

Detailed Description: A security and resource-management auditor. It iterates through a predefined list of critical system directories to report on two things: physical disk space consumed and the security ownership/permissions of the folder.

Key Logic: Uses a For-Loop to iterate through an Array and employs awk for precise string extraction from the ls -ld command.

Audit Value: Identifies "Permission Denied" risks and storage bottlenecks that could cause Python applications to hang.

### Open Source Manifesto Generator (manifesto.sh)

Detailed Description: An interactive content-generation script. It engages the developer in a "dialogue" about their values regarding Free and Open Source Software (FOSS), then synthesizes those inputs into a formal, timestamped legal/philosophical statement.

Key Logic: Demonstrates Interactive I/O (Input/Output) via read and File Redirection (>) to generate persistent text artifacts.

Audit Value: Documents the developer's commitment to the four freedoms of open-source software.

## Execution Guide : 
Follow these steps to deploy and verify the audit suite on the Linux system.

Step 1: Environment Preparation
Ensure the scripts are placed in a dedicated project directory to maintain a clean workspace.

```bash
mkdir ~/oss_audit
mv *.sh ~/oss_audit/
cd ~/oss_audit
```

Step 2: Permission Escalation
By default, newly created scripts lack "Execute" permissions. I must explicitly grant this using chmod.

```bash
# Grant execution rights to all shell scripts in the folder
chmod +x systemId.sh pkgCheck.sh log_analyzer.sh manifesto.sh diskAudit.sh
```

Step 3: Sequential Script Execution
1. Generate System Identity:
```bash
./systemId.sh
# Verification: Ensure the Distro and Kernel versions match your system info.
```
2. Inspect Software Packages:
```bash
./pkgCheck.sh
# Verification: If Python is installed, the version and philosophy will appear.
```
3. Run the Infrastructure Audit:
```bash
./diskAudit.sh
# Verification: Check that permissions for directories are correctly displayed.
```
4. Perform Log Analysis:
First, create a dummy log for the script to analyze:
```bash
echo "ERROR: Database timeout at 12:00" > error.log
./log_analyzer.sh error.log ERROR
# Verification: The script should report 1 match and display the summary.
```
5. Sign the Manifesto:
```bash
./manifesto.sh
# Verification: Follow the prompts. After completion, verify the new file exists with:
cat manifesto_$(whoami).txt
```
