# PreviewObject
# Written by: First

extends Node2D

class_name PreviewObject

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

const SHIFT_POS = Vector2(8, 8)

#-------------------------------------------------
#      Properties
#-------------------------------------------------

onready var highlight_anim = $HighlightAnim

#-------------------------------------------------
#      Notifications
#-------------------------------------------------

func _ready() -> void:
	SelectedObjects.connect("selected", self, "_on_SelectedObjects_selected")
	SelectedObjects.connect("deselected", self, "_on_SelectedObjects_deselected")

#-------------------------------------------------
#      Virtual Methods
#-------------------------------------------------

#-------------------------------------------------
#      Override Methods
#-------------------------------------------------

#-------------------------------------------------
#      Public Methods
#-------------------------------------------------

func shift_pos():
	position += SHIFT_POS

#-------------------------------------------------
#      Connections
#-------------------------------------------------

func _on_SelectedObjects_selected():
	if SelectedObjects.selected_objects.has(self):
		highlight_anim.play("Highlight", -1, rand_range(0.5, 1.5))

func _on_SelectedObjects_deselected():
	highlight_anim.play("Hide")

#-------------------------------------------------
#      Private Methods
#-------------------------------------------------

#-------------------------------------------------
#      Setters & Getters
#-------------------------------------------------
