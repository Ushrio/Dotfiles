#!/usr/bin/env bash
#set -euo pipefail

# Because certain programs like to insert their own newlines and fuck up my format (im looking at you thunderbird)
# we need to crunch each input to ensure that each component is its own line in the log file
crunch_appname=$(echo "$1" | sed  '/^$/d')
crunch_summary=$(echo "$2" | sed  '/^$/d' | tr $'\n' ' ')
crunch_body=$(echo "$3" | sed  '/^$/d' | tr $'\n' ' ')
crunch_icon=$(echo "$4" | sed  '/^$/d')
crunch_urgency=$(echo "$5" | sed  '/^$/d')
timestamp=$(date +"%I:%M %p")

if [[ "$crunch_appname" == "Spotify" ]]; then
    random_name=$(mktemp --suffix ".png")
    artlink=$(playerctl metadata mpris:artUrl | sed -e 's/open.spotify.com/i.scdn.co/g')
    curl -s "$artlink" -o "$random_name"
    crunch_icon=$random_name
fi
    
echo -en "$timestamp\n$crunch_urgency\n$crunch_icon\n$crunch_body\n$crunch_summary\n$crunch_appname\n" >> /tmp/dunstlog


#echo "$crunch_appname\n$crunch_summary\n$crunch_body\n$crunch_icon\n$crunch_urgency\x0f" >> /tmp/dunstlog

