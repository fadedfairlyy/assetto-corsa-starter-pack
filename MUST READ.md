# To use this file, you must have Assetto Corsa downloaded in your steam folder or elserwhere, if it is not in the steam folder please adjust the file location to where your Assetto Corsa is installed in the 15th line. For the No Hesi option, you probably might need all the DLC for Assetto Corsa cars. 

# How to run the menu automatically: 
The automatic version of running this is opening up a powershell window as an administrator, and typing in the following code: 
iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/fadedfairlyy/assetto-corsa-starter-pack/main/assetto_corsa_starter_pack.ps1')) 
it will take a while, but eventually the menu will in fact open. 

# How to manually install the menu: 
Install the main file (assetto_corsa_starter_pack.ps1) and Right-click it, then run with powershell. Allow it to make changes to your device. Second manual way is to download the .LNK file (it is a shortcut) and double-click it. The BAT file is for curious developers.

# Steps to Create a Shortcut that activates the menu on your desktop:
First, Right-click on your desktop (or wherever you want the shortcut to be)
Select New -> Shortcut
In the "Type the location of the item" field, enter the following code:
powershell.exe -NoExit -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/fadedfairlyy/assetto-corsa-starter-pack/main/assetto_corsa_starter_pack.ps1'))"
This will download and execute the PowerShell script directly from GitHub.
Click Next
Give the shortcut a name (eg: Assetto Corsa Starter Pack)
Click finish to create the shortcut.
Double-click on the shortcut and the menu will open.

# How to Run the shortcut as an Administrator:
Right-click the shortcut you just created and select Properties.
In the shortcut tab, click the advanced button.
Check the Run as administrator box/
Click OK, then Apply.
