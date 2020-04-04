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

#-------------------------------------------------
#      Connections
#-------------------------------------------------

func _on_SelectedObjects_selected():
	if SelectedObjects.selected_objects.has(self):
		highlight_anim.play("Highlight")

func _on_SelectedObjects_deselected():
	highlight_anim.play("Hide")

#-------------------------------------------------
#      Private Methods
#-------------------------------------------------

#-------------------------------------------------
#      Setters & Getters
#-------------------------------------------------
