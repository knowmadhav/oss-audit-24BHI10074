#!/bin/bash
# Script 1: System Identity Report
# Author: Madhav Agarwal | Course: Open Source Software
# This script gathers core system data to introduce the Linux environment.

# --- Variables ---
STUDENT_NAME="Madhav Agarwal"
SOFTWARE_CHOICE="Python"

# --- System Info Gathering (Command Substitution) ---
# $(...) executes a command and saves its output into a variable
KERNEL=$(uname -r)
USER_NAME=$(whoami)
USER_HOME=$HOME
UPTIME=$(uptime -p)
CURRENT_DATE=$(date "+%A, %d %B %Y, %T")

# To get the Distro name, we read the /etc/os-release file
# 'grep' finds the line, and 'cut' removes the label to show only the name
DISTRO=$(grep "^PRETTY_NAME=" /etc/os-release | cut -d '"' -f 2)

# --- Display Logic ---
echo "===================================================="
echo "    OPEN SOURCE AUDIT — $STUDENT_NAME"
echo "===================================================="
echo "System Identity Report for: $SOFTWARE_CHOICE"
echo "----------------------------------------------------"
echo "Linux Distribution : $DISTRO"
echo "Kernel Version     : $KERNEL"
echo "Current User       : $USER_NAME"
echo "Home Directory     : $USER_HOME"
echo "System Uptime      : $UPTIME"
echo "Current Date/Time  : $CURRENT_DATE"
echo "----------------------------------------------------"

# Identifying the OS License (Most Linux Distros are under GPL)
echo "LICENSE NOTICE:"
echo "This operating system is covered under the GNU General"
echo "Public License (GPL), granting you the four freedoms"
echo "of Free Software."
echo "===================================================="
