Show me a bash script with error checking and summary documentation for the following commands:

```shell

cd;echo GITSTATS ARCHETYPES;time ./gitstats/gitstats crossfire-crossfire-arch /var/www/html/crossfire-website/git/crossfire-crossfire-arch/gitstats;echo GITSTATS GTKv2 CLIENT;time ./gitstats/gitstats crossfire-crossfire-client /var/www/html/crossfire-website/git/crossfire-crossfire-client/gitstats;echo GITSTATS SERVER; time ./gitstats/gitstats crossfire-crossfire-server /var/www/html/crossfire-website/git/crossfire-crossfire-server/gitstats;echo GITSTATS MAPS;time ./gitstats/gitstats crossfire-crossfire-maps /var/www/html/crossfire-website/git/crossfire-crossfire-maps/gitstats;echo GITSTATS SOUNDS; time ./gitstats/gitstats crossfire-crossfire-sounds /var/www/html/crossfire-website/git/crossfire-crossfire-sounds/gitstats;echo GITSTATS JXCLIENT; time ./gitstats/gitstats crossfire-jxclient /var/www/html/crossfire-website/git/crossfire-jxclient/gitstats;echo GITSTATS METASERVER; time ./gitstats/gitstats crossfire-metaserver /var/www/html/crossfire-website/git/crossfire-metaserver/gitstats;cd;echo GITSTATS GRIDARTA;time ./gitstats/gitstats gridarta-gridarta/ /var/www/html/crossfire-website/git/gridarta/gitstats;cd;echo GITSTATS RETRO ARCH;time ./gitstats/gitstats crossfire-arch-retro-code/ /var/www/html/crossfire-website/git/crossfire-arch-retro/gitstats;cd;echo SPELL SHUFFLE;time ./gitstats/gitstats Spell_shuffle/ /var/www/html/crossfire-website/git/spell-shuffle/gitstats;echo FLATHUB; time ./gitstats/gitstats net.crossfireatlas.crossfire /var/www/html/crossfire-website/git/net-crossfireatlas-crossfire/gitstats;echo DONE

```

----

Certainly! Below is a Bash script with error checking and summary documentation for the provided commands:

```bash

#!/bin/bash

# Script: gitstats_summary.sh
# Author: Your Name
# Description: This script runs gitstats for various Crossfire projects and provides a summary of the execution time.

# Function to run gitstats and display execution time
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

# Main script

# Change to home directory
cd || exit

# Run gitstats for each project
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

# Return to home directory
cd || exit

echo "DONE"

```

Make sure to replace "Your Name" with your actual name. The script uses a function `run_gitstats` to run gitstats for each project and checks if the repository directory exists before executing the command. The script also provides an error message if the repository is not found. The overall execution `time` for each gitstats command is displayed using the time command. The script returns to the home directory after completing the tasks and prints "DONE" at the end.