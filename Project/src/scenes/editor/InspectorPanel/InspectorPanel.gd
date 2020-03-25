# Inspector
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

#-------------------------------------------------
#      Constants
#-------------------------------------------------

#-------------------------------------------------
#      Properties
#-------------------------------------------------

onready var panel_open = $PanelOpen
onready var panel_close = $PanelClose
onready var inspector_show_btn = $PanelClose/InspectorShowBtn
onready var inspector_hide_btn = $PanelOpen/VBoxContainer/InspectorHideBtn

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

func _on_InspectorHideBtn_pressed() -> void:
	panel_open.visible = false
	panel_close.visible = true

func _on_InspectorShowBtn_pressed() -> void:
	panel_open.visible = true
	panel_close.visible = false

#-------------------------------------------------
#      Private Methods
#-------------------------------------------------

#-------------------------------------------------
#      Setters & Getters
#-------------------------------------------------

