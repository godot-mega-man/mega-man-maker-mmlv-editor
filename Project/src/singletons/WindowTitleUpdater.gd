# WindowTitleUpdater
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

const NEW_LEVEL_TITLE_NAME = "Untitled"

#-------------------------------------------------
#      Properties
#-------------------------------------------------

export (String) var current_level_file_path = "" setget set_current_level_file_path

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

func _update_title():
	var title : String
	
	if current_level_file_path.empty():
		title += NEW_LEVEL_TITLE_NAME
	else:
		title += _get_filename_from_path(current_level_file_path)
	
	title += str(
		" - ",
		ProjectSettings.get_setting("application/config/name"),
		" ",
		"v",
		ProjectSettings.get_setting("application/config/version")
	)
	
	
	OS.set_window_title(title)

func _get_filename_from_path(path : String):
	return (path.split("/") as Array).back()

#-------------------------------------------------
#      Setters & Getters
#-------------------------------------------------

func set_current_level_file_path(val : String) -> void:
	current_level_file_path = val
	_update_title()
