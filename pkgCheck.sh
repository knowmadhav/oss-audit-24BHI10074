#!/bin/bash
# Script 2: FOSS Package Inspector
# Author: Madhav Agarwal | Course: Open Source Software
# This script checks for the presence of specific open-source tools and
# provides a philosophical summary of their role in the ecosystem.

# --- Variable ---
# We are checking for python3 as it is the modern standard
PACKAGE="python3"

echo "----------------------------------------------------"
echo "Searching for Open Source Package: $PACKAGE"
echo "----------------------------------------------------"

# --- Step 1: The If-Then-Else Check ---
# 'command -v' is a portable way to see if a program is in the system's PATH
if command -v $PACKAGE &>/dev/null; then
    echo "[STATUS]: $PACKAGE is installed."
    
    # Using a pipe with grep to find the version number specifically
    # 'python3 --version' usually outputs to stdout
    VERSION=$($PACKAGE --version)
    echo "Detected Version: $VERSION"
else
    echo "[STATUS]: $PACKAGE is NOT installed on this system."
fi

echo "----------------------------------------------------"

# --- Step 2: The Case Statement (The Philosophy) ---
# This block prints a unique note based on the package name
case $PACKAGE in
    python3)
        echo "Philosophy: Python is the 'glue' language, designed for human readability and speed of development."
        ;;
    httpd|apache2)
        echo "Philosophy: Apache is the foundation of the open web, serving millions of sites for decades."
        ;;
    mysql|mariadb)
        echo "Philosophy: The world's most popular open-source database, powering the data-driven internet."
        ;;
    vlc)
        echo "Philosophy: A triumph of community-driven multimedia, playing any format without restrictions."
        ;;
    *)
        echo "Philosophy: An unknown open-source tool, contributing its own value to the ecosystem."
        ;;
esac

echo "----------------------------------------------------"
