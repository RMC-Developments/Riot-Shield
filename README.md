**Shield Script for FiveM (by RMC Developments)**
Overview
This script allows players to equip and use a shield in your FiveM server. When the shield is activated, the player will hold a prop in their left hand and be protected from damage based on the configured settings. The shield can be toggled on and off by using an item (e.g., shield).

Please Note: You are responsible for testing this script thoroughly before using it in a live environment. I, RMC Developments, am not responsible for any issues or damages caused by using this script in your server.

**Features**
Shield Activation/Deactivation: Players can use an item to activate or deactivate the shield.
Custom Shield Prop: The shield prop will attach to the player's left hand.
Shield Animation: The player will hold the shield with a custom animation (can be changed).
Damage Reduction: While the shield is active, damage taken by the player is reduced based on the configured value.
Persistent Animation: The shield holding animation won't be interrupted by other actions like drawing weapons (unless the shield is deactivated).
Requirements
QBCore Framework (or any other compatible framework based on your setup).
Basic knowledge of how to install and configure scripts in FiveM.
Installation
**1. Download the Script**
You can download this script from GitHub by cloning the repository or downloading the ZIP file.

**2. Add the Script to Your Server**
Copy the folder rmc_shield into your server's resources directory.
add     

shield                     = { name = 'shield', label = 'Shield', weight = 1000, type = 'item', image = 'shield.png', unique = false, useable = true, description = 'A Useable BoomMic' },

To resources\[qb]\qb-core\shared\items.lua

Ensure rmc_shield is started in your server configuration file (server.cfg) by adding the following line:

**3. Configure the Script**
Inside the rmc_shield folder, you will find a config.lua file. You can configure various settings here, such as:

Shield model: The prop used for the shield.
Shield duration: The duration for which the shield remains active.
Damage reduction: How much damage is reduced while the shield is active.
Notifications: Customize the notifications shown when the shield is activated or deactivated.

**4. Ensure Dependencies Are Installed**
Make sure you have the QBCore framework installed and running on your server. This script uses the QBCore notification system and other basic functions.

**5. Set up Item Usage (Optional)**
Make sure you have an item in your inventory system (such as a shield) that players can use to activate and deactivate the shield. This item should trigger the rmc_shield:activate event.

**6. Start the Server**
Once the script is properly installed and configured, you can start your server and test the functionality. Players can use the assigned item to toggle the shield on and off.

Usage
To activate the shield, a player must use the designated item (e.g., shield) through their inventory system. When the item is used:

If the shield is not active, it will equip the shield and play the custom animation.
If the shield is already active, using the item again will remove the shield and stop the animation.
The shield will stay active for the configured duration (if set), and then automatically deactivate, or it can be manually deactivated.

**Customization**
You can customize the shield model, animation, and damage reduction in the config.lua file.

Configurable Options:
Config.Shield.model – The model for the shield prop (ensure this model is streamed and available on your server).
Config.Shield.duration – The duration for which the shield is active (in milliseconds).
Config.Shield.damageReduction – The percentage of damage reduction while the shield is active (e.g., 0.5 = 50% damage reduction).
Config.Notifications.shieldActivated – Notification text when the shield is activated.
Config.Notifications.shieldDeactivated – Notification text when the shield is deactivated.
**Disclaimer**
By using this script, you acknowledge that you understand the risks involved. RMC Developments is NOT responsible for any issues, bugs, or damage caused to your server or players by using this script. Always test scripts thoroughly before using them on live servers.

**License**
This script is released under the MIT License. Feel free to modify and redistribute it as you see fit, but please include appropriate credit to RMC Developments.



![image](https://github.com/user-attachments/assets/cc22bf7c-56b4-4df5-a668-21a2c974d7ed)

