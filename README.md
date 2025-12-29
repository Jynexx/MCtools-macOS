# MC-Modding/commom issues-macOS
Common problems and fixes for macOS + helper scripts




mod_searcher_posix.sh
runs on bash 3.2

instructions:
1. place this script in the main folder of the modpack you'd like to search for entries in
2. use terminal, cd to your modpack path
3. run `chmod +x mod_searcher_posix.sh` to provide the script permission to search the entire folder structure
4. run `./mod_searcher_posix.sh` to execute the script. the script will index all mods present in the pack, and once ready will ask for a search term.

note: you will only need to run `chmod +x` once for that instance. if you need to use the script for another modpack, you will need to run `chmod +x` again. 
