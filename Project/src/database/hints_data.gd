# HintsData

extends Reference

class_name DataHints

"""
	Contains all helpful hints related to the editor.
"""

#-------------------------------------------------
#      Constants
#-------------------------------------------------

const LIST = [
	"Hold Alt to use eyedropper tool on an already placed tile, or even on a background to quickly select it. Middle clicking also works the same way." ,
	"There are many ways to move around the map: Through directional keys, WASD, middle click & drag, or holding space key." ,
	"Selected objects can be moved with the mouse." ,
	"You can drag & drop a level file from the OS file manager to load the level instantly." ,
	"The program checks for an update on a regular basis. You can turn it on or off in the setting." ,
	"Try pressing number 1-6 on the keyboard to quickly change the current edit mode." ,
	"The icon at the top-right corner indicates whether an update is available." ,
	"A black tile named 'Endless11' can be useful in many situations for decorating levels." ,
	"Objects cannot be overlapped with the tiles, spikes, and ladders." ,
	"Objects that are larger than 1x1 in size can be placed close to each other." ,
	"If you saved a level in Mega Man Maker while the editor is still opening that level, the program automatically reloads it for you." ,
	"You can filter tilesets and backgrounds through a search box in the inspector panel." ,
	"To select multiple objects, hold down shift key and click on an object you want to select." ,
	"Clicking on the inspector label moves the entire panel to the side." ,
	"Inspector panel's width can be resized, allowing more/less space for the map to be edited." ,
	"Don't like user interface animations? You can turn on reduced motion in the setting." ,
	"Curious when and what the new features will be released in the future? Go to Help > Our Roadmap to see them all." ,
	"Found a bug? Have a suggestion? We'd love to hear it. Send us your feedback at Help > Send Us Feedback." ,
	"Want to try out new features before anyone else? Download the source code and try it out (the source link is at Help > About > View source code in GitHub)." ,
	"Want to contribute to help improve our program? Check out Help > About in the menu bar." ,
]

#-------------------------------------------------
#      Public Methods
#-------------------------------------------------

static func get_random_hint() -> String:
	return LIST[randi() % LIST.size()]
