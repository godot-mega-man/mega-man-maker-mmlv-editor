# ObjectSelector
# Written by: First

extends Node2D

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

onready var highlight_rect = $HighlightRect

var selecting : bool
var select_begin_pos : Vector2

#-------------------------------------------------
#      Notifications
#-------------------------------------------------

#-------------------------------------------------
#      Virtual Methods
#-------------------------------------------------

#-------------------------------------------------
#      Override Methods
#-------------------------------------------------

#-------------------------------------------------
#      Public Methods
#-------------------------------------------------

#-------------------------------------------------
#      Connections
#-------------------------------------------------

#-------------------------------------------------
#      Private Methods
#-------------------------------------------------

func process_input(event : InputEvent):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT:
			selecting = event.is_pressed()
			if event.is_pressed():
				select_begin_pos = get_global_mouse_position()
				highlight_rect.rect_size = Vector2.ZERO
		
		highlight_rect.visible = selecting
	
	if event is InputEventMouseMotion:
		var rect : Rect2
		
		# Set rect position
		rect.position = select_begin_pos
		
		# Set rect size
		rect.size = get_global_mouse_position() - select_begin_pos
		
		highlight_rect.rect_global_position = rect.position
		highlight_rect.rect_size = rect.size.abs()
		
		# Since rect_size of ReferenceRect can't go negative, the solution
		# for this is to make position mirrored.
		if rect.size.x < 0:
			highlight_rect.rect_position.x += rect.size.x # Positive position plus negative value
		if rect.size.y < 0:
			highlight_rect.rect_position.y += rect.size.y # Positive position plus negative value

#-------------------------------------------------
#      Setters & Getters
#-------------------------------------------------

