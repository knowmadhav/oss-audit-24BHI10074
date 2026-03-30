#!/bin/bash
# Script 3: Disk and Permission Auditor
# Author: Madhav Agarwal | Course: Open Source Software
# This script loops through key directories to audit disk usage and security permissions.

# --- Array of Directories to Audit ---
# I am including standard system paths and a custom path for Python
DIRS=("/etc" "/var/log" "/home" "/usr/bin" "/tmp")

# My Python software config/library directory (Common on Linux)
PYTHON_CONF="/usr/lib/python3"

echo "===================================================="
echo "          DIRECTORY AUDIT & SECURITY REPORT"
echo "===================================================="

# --- The For Loop ---
# This iterates through every item in the DIRS array
for DIR in "${DIRS[@]}"; do
    # Check if the directory actually exists (-d flag)
    if [ -d "$DIR" ]; then
        # Use ls -ld to get directory details
        # awk '{print $1, $3, $4}' extracts: Permissions, Owner, and Group
        PERMS=$(ls -ld "$DIR" | awk '{print $1, $3, $4}')
        
        # du -sh calculates 'Disk Usage' in 'Human-readable' format (KB/MB/GB)
        # 2>/dev/null hides 'Permission Denied' errors for sensitive folders
        SIZE=$(du -sh "$DIR" 2>/dev/null | cut -f1)
        
        echo "[FOUND] $DIR"
        echo "      -> Size: $SIZE | Permissions: $PERMS"
    else
        echo "[MISSING] $DIR does not exist on this system."
    fi
done

echo "----------------------------------------------------"

# --- Specific Software Check ---
echo "AUDITING PYTHON CONFIGURATION DIRECTORY:"
if [ -d "$PYTHON_CONF" ]; then
    INFO=$(ls -ld "$PYTHON_CONF" | awk '{print "Perms: "$1" | Owner: "$3}')
    echo "Python Path: $PYTHON_CONF"
    echo "Access Info: $INFO"
else
    echo "Python config directory not found at standard path."
fi

echo "===================================================="
