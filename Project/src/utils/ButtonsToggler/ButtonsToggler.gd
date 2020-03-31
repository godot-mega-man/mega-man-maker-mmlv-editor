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
			i.connect("pressed", self, "_on_any_button_pressed")
	
	current_pressed_button = get_pressed_button()

#-------------------------------------------------
#      Virtual Methods
#-------------------------------------------------

#-------------------------------------------------
#      Override Methods
#-------------------------------------------------

#-------------------------------------------------
#      Public Methods
#-------------------------------------------------

func update_current_button_state():
	for i in parent.get_children():
		if i is BaseButton:
			if i.pressed and i != current_pressed_button:
				current_pressed_button = i
				break
	
	_release_all_buttons()
	
	current_pressed_button.set_pressed(true)

func get_pressed_button() -> BaseButton:
	for i in parent.get_children():
		if i is BaseButton:
			if i.pressed:
				return i
	
	return null

#-------------------------------------------------
#      Connections
#-------------------------------------------------

func _on_any_button_pressed():
	update_current_button_state()

#-------------------------------------------------
#      Private Methods
#-------------------------------------------------

func _release_all_buttons():
	for i in parent.get_children():
		if i is BaseButton:
			i.set_pressed(false)

#-------------------------------------------------
#      Setters & Getters
#-------------------------------------------------
