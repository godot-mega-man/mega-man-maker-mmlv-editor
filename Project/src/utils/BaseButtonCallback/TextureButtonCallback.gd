# TextureButtonCallback
# Written by: First

extends TextureButton

class_name TextureButtonCallback

"""
	A virtual TextureButton class. When the button is either pressed, down, or
	released, the signal is emitted by passing the emitter.
"""

#-------------------------------------------------
#      Signals
#-------------------------------------------------

signal button_down_from(button)
signal button_up_from(button)
signal pressed_from(button)

#-------------------------------------------------
#      Properties
#-------------------------------------------------

#-------------------------------------------------
#      Notifications
#-------------------------------------------------

func _ready() -> void:
	connect("button_up", self, "_on_BaseButton_button_up")
	connect("button_down", self, "_on_BaseButton_button_down")
	connect("pressed", self, "_on_BaseButton_pressed")

#-------------------------------------------------
#      Connections
#-------------------------------------------------

func _on_BaseButton_button_up():
	emit_signal("button_up_from", self)

func _on_BaseButton_button_down():
	emit_signal("button_down_from", self)

func _on_BaseButton_pressed():
	emit_signal("pressed_from", self)
