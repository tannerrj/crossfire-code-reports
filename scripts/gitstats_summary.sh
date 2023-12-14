#!/bin/bash

# Script: gitstats_summary.sh
# Author: Rick Tanner via ChatGPT
# Description: This script runs gitstats for various Crossfire projects and provides a summary of the execution time.
# Project URL: https://github.com/tannerrj/crossfire-code-reports
# License: MIT License

# Step 1: Function to run gitstats and display execution time
run_gitstats() {
    project_name=$1
    repo_path=$2

    echo "GITSTATS $project_name"
    if [ -d "$repo_path" ]; then
        time ./gitstats/gitstats "$project_name" "$repo_path/gitstats"
    else
        echo "Error: Repository not found at $repo_path"
    fi
}

# Step 2: Main script

# Step 2.1: Change to home directory
cd || exit

# Step 2.2: Run gitstats for each project
run_gitstats "ARCHETYPES" "/var/www/html/crossfire-website/git/crossfire-crossfire-arch"
run_gitstats "GTKv2 CLIENT" "/var/www/html/crossfire-website/git/crossfire-crossfire-client"
run_gitstats "SERVER" "/var/www/html/crossfire-website/git/crossfire-crossfire-server"
run_gitstats "MAPS" "/var/www/html/crossfire-website/git/crossfire-crossfire-maps"
run_gitstats "SOUNDS" "/var/www/html/crossfire-website/git/crossfire-crossfire-sounds"
run_gitstats "JXCLIENT" "/var/www/html/crossfire-website/git/crossfire-jxclient"
run_gitstats "METASERVER" "/var/www/html/crossfire-website/git/crossfire-metaserver"
run_gitstats "GRIDARTA" "/var/www/html/crossfire-website/git/gridarta"
run_gitstats "RETRO ARCH" "/var/www/html/crossfire-website/git/crossfire-arch-retro-code"
run_gitstats "SPELL SHUFFLE" "/var/www/html/crossfire-website/git/spell-shuffle"
run_gitstats "FLATHUB" "/var/www/html/crossfire-website/git/net-crossfireatlas-crossfire"

# Step 3: Return to home directory
cd || exit

# Step 4: Summary
echo "DONE"
