# FOODit
Initial requirements of the proof of concept:
The solution should take into account the following:

It should be as true to the designs as possible, but candidates should feel free to add anything that improves the flow/design, using touch and gestures where applicable.

When the mobile is online, the application should cache the menu data in the mobile data store and periodically check for updates.

The Application should continue to work while offline.

The contents of the basket will be retained after the mobile or application has been restarted.

A solution should show an understanding of the problems involved and make use of the tech stack to solve them.

Some notes about my implementation:

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

·When adding a meal: the Alert View asks for a message to send to the kitchen. The message can be empty. 


Usage:
To reset Core Data Stack and start from Scratch you can use the small reset button in the top left corner.
That will delete everything and then you should exit the app and open it again to have it fresh.

Links:
https://github.com/FOODit/FOODit-MobileTest

https://github.com/KTMarc/FOODit


