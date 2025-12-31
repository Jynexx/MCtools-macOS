Tahoe (26.0+)

# Permissions/Key State issues

Tahoe has a few finicky ways of handling permissions when it comes to applications. If you update from Sonoma or a previous OS version to Tahoe, apps you've given permissions to previously may reset. Some common identifiers of this issue may look like:

**ex 1.**
### SecureTokenStorage_Mac.mm(200)] Error while deleting key - CODE: -25244
### AccountData.cpp(429)] STS Error while adding/updating token: 112

**ex 2.**
### `failed to read/load profile preferences` or `access to directory is denied`


Ways to safely reset permissions for Curseforge and Minecraft/the Minecraft that CF will install. This fix should be universal for any future modpack instances.
*Please note: users will need to be the Admin/Power user, or the sole user on the Mac with full system control permissions.* 

**Step 1.**
Open terminal (you can find this by using the search in your launchpad)

**Step 2.** 
Ensure you are the admin user/sole user on the Mac. You will need to know your Mac password (the one used for login)

**Step 3.** 
Run these commands one by one. You can copy paste them into Terminal. Hit enter after each one. These are just permission resets for specific apps. In this case, CurseForge and Minecraft.
`tccutil reset All com.mojang.minecraft`
`tccutil reset All com.overwolf.curseforge`

**Step 4.**
Running these should prompt a password entry. Please note that Terminal will not display your password, you will just need to type and pray. Once it's been typed in, hit enter. Close Terminal, if you do not get a prompt to restart your Mac, please do so yourself. 


*In the offchance the above 2 commands do not work, please try this next one.* Run this command the same as the first 2 in step 3.  
```diskutil resetUserPermissions / `id -u` ```

(Sonoma users should **skip** this step. This should never apply to y'all. Spoken by a hardstuck Sonoma user who refuses to change.)

Repeat step 4. If you see a Y/N prompt related to restarting your Mac during this step, press Y. This command will reset any access to folders or permissions that might be messed up. You should have total permissions access to CurseForge and Minecraft, and should no longer have the above issues. 


You may need to repair your Minecraft install via CurseForge after this. 

Other more testing required commands:
`sudo xattr -rd com.apple.quarantine /Applications/CurseForge.app`