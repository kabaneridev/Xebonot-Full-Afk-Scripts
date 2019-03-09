# Xebonot Full Afk Scripts
Full Afk Scripts for Xenobot contains RL Tibia Map places

To launch script: 

first of all download an .Xbst file from directory github.com/kabaneridev/Xebonot-Full-Afk-Scripts/settings (ex. [EK] Poi Vats.xbst)

put downloaded file xbst into folder Settings located in C:\\Users\%username\Documents\Xenobot (ex. C:\\Users\Michal\Documents\Xenobot )

Launch Tibia, Xenobot
Click on Tibia's client with right mouse button the green dot, click Settings > select downloaded file xbst (ex. [EK] Poi Vats.xbst) and then click Load.

Right now Xenobot have loaded the settings and loaded config file. To access config file go to C:\\Users\%username\Documents\Xenobot\Scripts
(ex. C:\\Users\%username\Documents\Xenobot\Scripts\[EK] Vats CONFIG.lua )
and open this lua file with Notepad (I recommend to use Notepad++)

On top of this file you will find some variables that you can edit. For example, if you want script to buy great health potions against supreme health potions, you need to change the ID of variable called HealthID 
(ex. before changing variable got default ID, 

HealthID = 23375 
// supreme health potion = 23375
which is ID of supreme health potion, if you change it to 

HealthID = 239 
// great health potion = 239
now script will be buying great health potions against supremes. Extremely easy to understand.

To change amounts of max buying potions for respawn or amount of potions that after character will return to city for refill, just change variables 

MinMana, MaxMana for mana potions
MinHealth, MaxHealth for healing potions

with runes too, just look at IDs.

Some of scripts uses SoftBoots refiller function, but if you won't use soft boots just change the variable 

SoftBoots = true
to
SoftBoots = false

then your character will be not refilling soft boots at NPC.

To setup Backpacks just change the values of variables, like MainBp, GoldBp, RareBp, SuppliesBp to backpacks that your characters is using.

If you finished setting up config file, save it and then go to Tibia's client, click green dot with right mouse button, click Scripts > Reload All. Now we have to save fully prepared full afk script so do the same on Tibia's client but click the Settings > Save All. If you have finished those steps you are ready to launch full afk script. To run script click Walker > enabled and get out home or meet some girls :) To run script click > 
