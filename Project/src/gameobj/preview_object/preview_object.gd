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
	SelectedObjects.connect("selected_obj", self, "_on_SelectedObjects_selected_obj")
	SelectedObjects.connect("deselected", self, "_on_SelectedObjects_deselected")
	SelectedObjects.connect("deselected_obj", self, "_on_SelectedObjects_deselected_obj")

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

func play_highlight_anim():
	highlight_anim.play("Highlight", -1, rand_range(0.5, 1.5))

func play_hide_anim():
	highlight_anim.play("Hide")

#-------------------------------------------------
#      Connections
#-------------------------------------------------

func _on_SelectedObjects_selected():
	if SelectedObjects.selected_objects.has(self):
		play_highlight_anim()

func _on_SelectedObjects_selected_obj(obj):
	if obj == self:
		play_highlight_anim()

func _on_SelectedObjects_deselected_obj(obj):
	if obj == self:
		play_hide_anim()

func _on_SelectedObjects_deselected():
	play_hide_anim()

#-------------------------------------------------
#      Private Methods
#-------------------------------------------------

#-------------------------------------------------
#      Setters & Getters
#-------------------------------------------------
