#!/bin/bash
# Script 2: Log File Analyzer
# Author: Madhav Agarwal | Course: Open Source Software
# This script parses a log file to count specific keywords and handles empty files.

# --- Variables & Arguments ---
# $1 is the first thing you type after the script name (the file path)
LOGFILE=$1
# ${2:-"error"} means: Use the 2nd argument, but if it's empty, default to "error"
KEYWORD=${2:-"error"}
COUNT=0

# --- File Validation ---
if [ ! -f "$LOGFILE" ]; then
    echo "Error: File '$LOGFILE' not found."
    echo "Usage: ./log_analyzer.sh [path_to_file] [keyword]"
    exit 1
fi

# --- Retry Logic (Check if file is empty) ---
# This acts like a 'do-while' loop checking for data
while [ ! -s "$LOGFILE" ]; do
    echo "Warning: $LOGFILE is currently empty. Waiting for logs..."
    sleep 2 # Wait 2 seconds before checking again
    # In a real scenario, you'd break here or wait for a process to write to it.
    echo "Proceeding with empty file analysis..."
    break
done

# --- The While-Read Loop ---
# IFS= read -r prevents leading/trailing whitespace from being trimmed
while IFS= read -r LINE; do
    # -i makes grep case-insensitive, -q makes it 'quiet' (it just returns true/false)
    if echo "$LINE" | grep -iq "$KEYWORD"; then
        COUNT=$((COUNT + 1))
    fi
done < "$LOGFILE"

# --- Output Summary ---
echo "----------------------------------------------------"
echo "LOG ANALYSIS SUMMARY"
echo "----------------------------------------------------"
echo "File checked : $LOGFILE"
echo "Keyword      : $KEYWORD"
echo "Total Matches: $COUNT"
echo "----------------------------------------------------"

# --- Extracting Recent Context ---
echo "Last 5 matching entries found:"
grep -i "$KEYWORD" "$LOGFILE" | tail -n 5

echo "===================================================="
