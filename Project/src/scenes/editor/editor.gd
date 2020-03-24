# Editor
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

onready var level = $Level
onready var file_access_ctrl = $CanvasLayer/Control/FileAccessCtrl

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

func _on_MenuPanel_new_file() -> void:
	level.clear_level()
func _on_MenuPanel_opening_file() -> void:
	file_access_ctrl.open_file()
func _on_MenuPanel_saving_file() -> void:
	file_access_ctrl.save_file()
func _on_MenuPanel_saving_file_as() -> void:
	file_access_ctrl.save_file_as()
func _on_MenuPanel_opening_preferences() -> void:
	pass # Replace with function body.
func _on_MenuPanel_exiting() -> void:
	get_tree().quit()

# ---

func _on_FileAccessCtrl_opened_file(dir, path) -> void:
	var load_result = level.load_level(dir, path)
	
	if load_result == OK:
		file_access_ctrl.update_current_level_path(dir, path)

func _on_FileAccessCtrl_saved_file(dir, path) -> void:
	level.save_level(dir, path)

#New level
func _on_Level_cleared_level() -> void:
	file_access_ctrl.clear_current_level_path()

#-------------------------------------------------
#      Private Methods
#-------------------------------------------------

#-------------------------------------------------
#      Setters & Getters
#-------------------------------------------------




