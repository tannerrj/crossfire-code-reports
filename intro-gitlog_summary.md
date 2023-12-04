Show me a bash script with error checking and summary documentation for the following commands:

```shell

cd;cd crossfire-crossfire-arch/;echo GIT-LOG ARCHETYPES;git-log-html > crossfire-crossfire-arch.html; cp crossfire-crossfire-arch.html /var/www/html/crossfire-website/git/crossfire-crossfire-arch/gitlog/;cd ../crossfire-crossfire-client/;echo GIT-LOG CLIENT;git-log-html > crossfire-crossfire-client.html; cp crossfire-crossfire-client.html /var/www/html/crossfire-website/git/crossfire-crossfire-client/gitlog/;cd ../crossfire-crossfire-server/;echo GIT-LOG SERVER;git-log-html > crossfire-crossfire-server.html; cp crossfire-crossfire-server.html /var/www/html/crossfire-website/git/crossfire-crossfire-server/gitlog/;cd ../crossfire-crossfire-maps/;echo GIT-LOG MAPS;git-log-html > crossfire-crossfire-maps.html; cp crossfire-crossfire-maps.html /var/www/html/crossfire-website/git/crossfire-crossfire-maps/gitlog/;cd ../crossfire-crossfire-sounds/;echo GIT-LOG SOUNDS;git-log-html > crossfire-crossfire-sounds.html; cp crossfire-crossfire-sounds.html /var/www/html/crossfire-website/git/crossfire-crossfire-sounds/gitlog/;cd ../crossfire-jxclient/;echo GIT-LOG JXCLIENT;git-log-html > crossfire-jxclient.html; cp crossfire-jxclient.html /var/www/html/crossfire-website/git/crossfire-jxclient/gitlog/;cd ../crossfire-metaserver/;echo GIT-LOG METASERVER;git-log-html > crossfire-metaserver.html; cp crossfire-metaserver.html /var/www/html/crossfire-website/git/crossfire-metaserver/gitlog/;cd;cd gridarta-gridarta;echo GIT-LOG GRIDARTA;git-log-html > gridarta-git-log.html; cp gridarta-git-log.html /var/www/html/crossfire-website/git/gridarta/gitlog/;cd;cd crossfire-arch-retro-code/;echo GIT-LOG RETRO;git-log-html > crossfire-arch-retro-git-log.html; cp crossfire-arch-retro-git-log.html /var/www/html/crossfire-website/git/crossfire-arch-retro/gitlog;cd;echo SPELL SHUFFLE;cd Spell_shuffle/;git-log-html > spell-shuffle-git-log.html;cp spell-shuffle-git-log.html /var/www/html/crossfire-website/git/spell-shuffle/gitlog/;cd ../net.crossfireatlas.crossfire;echo FLATHUB; git-log-html > net-crossfireatlas-crossfire.html;cp net-crossfireatlas-crossfire.html /var/www/html/crossfire-website/git/net-crossfireatlas-crossfire/gitlog;cd;echo DONE

```

----

Here is a bash script with error checking and summary documentation for the provided commands:

```bash

#!/bin/bash

# Function to handle errors
handle_error() {
  echo "Error: $1"
  exit 1
}

# Function to perform git operations and log to HTML
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

```

This script defines two functions, `handle_error` to handle errors gracefully, and `perform_git_operation` to execute the provided git operations and log the output to HTML. The main script then calls these functions for each repository, with proper error checking. Finally, it prints "DONE" as a summary.