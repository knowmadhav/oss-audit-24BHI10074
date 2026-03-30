#!/bin/bash
# Script 5: Open Source Manifesto Generator
# Author: Madhav Agarwal | Course: Open Source Software
# This script interactively collects user values to generate a signed manifesto.

# --- Alias Concept (Demonstration) ---
# In a real shell, I would add: alias gen_manifesto='./manifesto.sh' 
# This would allow me to run this script by just typing 'gen_manifesto'.

echo "===================================================="
echo "      OPEN SOURCE MANIFESTO GENERATOR"
echo "===================================================="
echo "Please answer the following questions to draft your statement:"
echo ""

# --- Interactive Input (read) ---
read -p "1. Name one open-source tool you use every day: " TOOL
read -p "2. In one word, what does 'freedom' mean to you? " FREEDOM
read -p "3. Name one thing you would build and share freely: " BUILD

# --- Data Processing ---
DATE=$(date '+%d %B %Y')
USER_NAME=$(whoami)
OUTPUT="manifesto_${USER_NAME}.txt"

# --- Composing the Paragraph (String Concatenation) ---
# We use the > operator to create/overwrite the file with the header
echo "--- OPEN SOURCE MANIFESTO ---" > "$OUTPUT"
echo "Generated on: $DATE" >> "$OUTPUT"
echo "" >> "$OUTPUT"

# Composing the core statement using the variables $TOOL, $FREEDOM, and $BUILD
STATEMENT="As a developer, I believe that tools like $TOOL are essential for progress. To me, open source is defined by '$FREEDOM'—the right to learn and grow without barriers. In the spirit of the community, I commit to building $BUILD and sharing it freely with the world."

# Writing the final paragraph to the file
echo "$STATEMENT" >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "Signed, $USER_NAME" >> "$OUTPUT"

# --- Final Display ---
echo "----------------------------------------------------"
echo "Success! Your personalized manifesto has been saved to $OUTPUT"
echo "----------------------------------------------------"
echo "PREVIEW OF YOUR MANIFESTO:"
cat "$OUTPUT"
echo "===================================================="

