Welcome. You must be here because you encountered the dreaded: 
`A JavaScript error occurred in the main process`
`Error: ENOENT: no such file or directory, stat` blah blah insert issues related to .js, electron, resource locations. 


These are my own tried and tested fixes. I experienced this issue on my Macbook Pro M1, and figured out a perm fix (At least has been for me. I've helped a handful of other users within the CF server now with the above issue). 

Step 1. 
Ensure CurseForge's App is completely closed, not just hidden in the background. Do not have any instances of Minecraft open during this period either.

Step 2. 
If you need to backup any modpacks, saves of modpacks, or anything important to you from the CurseForge app in particular, I suggest doing so now, preferably on a different part of your Drive than where CF's files are located (anywhere but Documents is typically good). The following steps will involve completely deleting CurseForge. You can always bring modpacks into CF at a later time, but we cannot recover anything permanentally deleted. 

Step 3. 
Delete the CurseForge app in the `Applications` folder within `Finder`.

`rm -rf ~/Library/Application\ Support/CurseForge`
`rm -rf ~/Library/Application\ Support/com.overwolf.curseforge`
`rm -rf ~/Library/Application\ Support/minecraft/webcache2`

Run each of these lines one by one, hit enter each time you put one into Terminal. 

If run successfully, it should not say anything (minus your mac/username and time), and generates a blank line. 

# Note: *If you see an error such as *