#!/bin/sh

# Set color codes - using printf to store escaped sequences
BLACK=$(printf '\033[37;40m')

# Generate random color
CHANCECUBE=$(awk 'BEGIN{srand();print int(rand()*100)}')
if [ $CHANCECUBE -lt 50 ]; then
    RANDOMBACK=$(awk 'BEGIN{srand();print 41+int(rand()*6)}')
    RANDOCOLOR=$(printf '\033[97;%sm' "$RANDOMBACK")
else
    RANDOMBACK=$(awk 'BEGIN{srand();print 101+int(rand()*5)}')
    RANDOCOLOR=$(printf '\033[30;%sm' "$RANDOMBACK")
fi

# Reset color code for safety
RESET=$(printf '\033[0m')

printf "\n\n %sPreparing for search%s\n" "$RANDOCOLOR" "$BLACK"

# Check if mods directory exists
if [ ! -d "./mods" ]; then
    clear
    printf "\n\n\n\n %sOOPS - No folder named 'mods' was found.%s\n" "$RANDOCOLOR" "$BLACK"
    printf " %sTo work, this script needs to be copied to and run from the main folder of a profile.%s\n\n\n" "$RANDOCOLOR" "$BLACK"
    printf "Press Enter to exit..."
    read dummy
    exit 1
fi

cd "./mods"

# Create working directory if it doesn't exist
[ ! -d "mod_searcher_working" ] && mkdir mod_searcher_working

# Extract contents of JAR files to text files
for jar in *.jar; do
    echo "Processing: $jar"
    unzip -p "$jar" | grep -F -a . > "mod_searcher_working/${jar}.txt"
done

cd mod_searcher_working

printf "\n %sPreparation done%s\n" "$RANDOCOLOR" "$BLACK"

cont="Y"
while [ "$cont" = "Y" ]; do
    printf "\n\n\n"
    printf "%sEnter string to look for:%s " "$RANDOCOLOR" "$BLACK"
    read SEARCHFOR
    [ -z "$SEARCHFOR" ] && continue

    # Search for string in extracted files
    grep -F -l "$SEARCHFOR" *.jar.txt > mods_found.txt

    if [ ! -s mods_found.txt ]; then
        printf "%s No mods found with that search string.%s\n\n" "$RANDOCOLOR" "$BLACK"
        printf "%sPress [Y] to enter another search or [Q] to quit:%s " "$RANDOCOLOR" "$BLACK"
        read choice
        choice=$(echo "$choice" | tr '[:lower:]' '[:upper:]')
        if [ "$choice" = "Q" ]; then
            break
        elif [ "$choice" = "Y" ]; then
            clear
            continue
        fi
    else
        printf "%s Found mods that contain %s:%s\n\n" "$RANDOCOLOR" "$SEARCHFOR" "$BLACK"
        
        while read -r line; do
            printf "\t%s%s%s\n" "$RANDOCOLOR" "$(echo "$line" | sed 's/\.txt$//')" "$BLACK"
        done < mods_found.txt

        printf "\n%sPress [Y] to enter another search or [Q] to quit:%s " "$RANDOCOLOR" "$BLACK"
        read choice
        choice=$(echo "$choice" | tr '[:lower:]' '[:upper:]')
        [ "$choice" = "Q" ] && cont="N"
        [ "$choice" = "Y" ] && clear
    fi
done

# Cleanup
cd ..
rm -rf mod_searcher_working