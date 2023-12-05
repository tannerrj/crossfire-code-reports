#!/bin/bash

# Script: gitlog_summary.sh
# Author: Rick Tanner via ChatGPT
# Description: This script runs `git-log-html` for various Crossfire code repositories, saves the output to the website directory, and provides a summary of the execution time.

# Step 1: Function to handle errors
handle_error() {
  echo "Error: $1"
  exit 1
}

# Step 2: Function to perform git operations and log to HTML
perform_git_operation() {
  local directory=$1
  local log_file=$2
  local destination=$3

  cd "$directory" || handle_error "Could not change directory to $directory"
  echo "GIT-LOG $directory"
  
  # Run git-log-html and redirect the output to a file
  git-log-html > "$log_file" || handle_error "Failed to generate git-log HTML for $directory"
  
  # Copy the generated HTML file to the destination
  cp "$log_file" "$destination" || handle_error "Failed to copy $log_file to $destination"
  
  cd - || handle_error "Could not change back to the previous directory"
}

# Main script

# Crossfire repositories
perform_git_operation "crossfire-crossfire-arch/" "crossfire-crossfire-arch.html" "/var/www/html/crossfire-website/git/crossfire-crossfire-arch/gitlog/"
perform_git_operation "crossfire-crossfire-client/" "crossfire-crossfire-client.html" "/var/www/html/crossfire-website/git/crossfire-crossfire-client/gitlog/"
perform_git_operation "crossfire-crossfire-server/" "crossfire-crossfire-server.html" "/var/www/html/crossfire-website/git/crossfire-crossfire-server/gitlog/"
perform_git_operation "crossfire-crossfire-maps/" "crossfire-crossfire-maps.html" "/var/www/html/crossfire-website/git/crossfire-crossfire-maps/gitlog/"
perform_git_operation "crossfire-crossfire-sounds/" "crossfire-crossfire-sounds.html" "/var/www/html/crossfire-website/git/crossfire-crossfire-sounds/gitlog/"
perform_git_operation "crossfire-jxclient/" "crossfire-jxclient.html" "/var/www/html/crossfire-website/git/crossfire-jxclient/gitlog/"
perform_git_operation "crossfire-metaserver/" "crossfire-metaserver.html" "/var/www/html/crossfire-website/git/crossfire-metaserver/gitlog/"

# Other repositories
perform_git_operation "gridarta-gridarta" "gridarta-git-log.html" "/var/www/html/crossfire-website/git/gridarta/gitlog/"
perform_git_operation "crossfire-arch-retro-code/" "crossfire-arch-retro-git-log.html" "/var/www/html/crossfire-website/git/crossfire-arch-retro/gitlog"
perform_git_operation "Spell_shuffle/" "spell-shuffle-git-log.html" "/var/www/html/crossfire-website/git/spell-shuffle/gitlog/"
perform_git_operation "net.crossfireatlas.crossfire" "net-crossfireatlas-crossfire.html" "/var/www/html/crossfire-website/git/net-crossfireatlas-crossfire/gitlog"

# Summary
echo "DONE"
