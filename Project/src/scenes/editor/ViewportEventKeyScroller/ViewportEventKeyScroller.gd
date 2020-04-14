# ViewportEventKeyScroller
# Written by: First

extends Control

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

signal moving(velocity)

#-------------------------------------------------
#      Constants
#-------------------------------------------------

#-------------------------------------------------
#      Properties
#-------------------------------------------------

export (float) var default_scroll_speed = 20

var speed_modifier : float

#-------------------------------------------------
#      Notifications
#-------------------------------------------------

func _process(delta: float) -> void:
	speed_modifier = default_scroll_speed * (1 + int(Input.is_key_pressed(KEY_SHIFT)))
	
	if Input.is_action_pressed("ui_left"):
		emit_signal("moving", Vector2.LEFT * speed_modifier)
	if Input.is_action_pressed("ui_right"):
		emit_signal("moving", Vector2.RIGHT * speed_modifier)
	if Input.is_action_pressed("ui_up"):
		emit_signal("moving", Vector2.UP * speed_modifier)
	if Input.is_action_pressed("ui_down"):
		emit_signal("moving", Vector2.DOWN * speed_modifier)

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

#-------------------------------------------------
#      Setters & Getters
#-------------------------------------------------

