# ButtonsToggler
# Written by: First

extends Node

#class_name optional

"""
	Enter desc here.
"""

#-------------------------------------------------
#      Classes
#-------------------------------------------------

#-------------------------------------------------
#      Signals
#-------------------------------------------------

signal pressed

#-------------------------------------------------
#      Constants
#-------------------------------------------------

#-------------------------------------------------
#      Properties
#-------------------------------------------------

var parent : Node
var current_pressed_button : BaseButton

#-------------------------------------------------
#      Notifications
#-------------------------------------------------

func _ready() -> void:
	#Init parent
	parent = get_parent()
	
	#Connect all buttons emitting signal 'pressed'
	for i in parent.get_children():
		if i is BaseButton:
			i.pressed = EditorConfig.locked_keyboard
	

