# FOODit
Some notes about the implementation:

I've focused on working with persistance in the device with Core Data. 
Core Data has a model prepared to have more than one Order (it was not a requirement but would be nice).
Photos in Core Data are a separate entity with the option of external Storage enabled for better performance

JSON mapping to CORE DATA is done with AFNetworking. 
The download of all pictures is done in the background async (not blocking)
I set the server address in my appDelegate, after the #imports


CORE DATA Autosave option is enabled. Can be changed in:
 “Supporting files > settings.h”
	#define AUTO_SAVE YES

The application will load from the network the JSON once, and then will store a flag so the next execution will load data from core data. 
To make it load again:
1-from the network from the simulator menu “iOS Simulator -> Reset content and settings..”
2-from the device, delete the app


Missing Features:

- When the mobile is online, the application should cache the [menu data](/data/menu.json) in the mobile data store and periodically check for updates ——> How to detect the update? there is no timestamp to check if there’s something new? Is the ID of each meal going to change when there is some update on the server side. Otherwise we should check and compare field by field if there is any difference from the last JSON.


in List of Meals ViewController:
·Tag icons are not displayed graphically, but they are listed from the Database. 

·3 dots to expand the description.

·Alert View displaying the number of meals the user wants to order and the "Notes for the kitchen". I forced all new added meals to the order were one unit and "No chilli" was the note. This was not on the screenshots, but I would add it.

Links:
https://github.com/FOODit/FOODit-MobileTest

https://github.com/KTMarc/FOODit


