# ReloadLevelDialog
# Written by: 

extends ConfirmationDialog

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

const DIALOG_TEXT_RELOAD = "This file has been modified by another program.\nDo you want to reload it?"
const DIALOG_TEXT_RELOAD_UNSAVED = "This file has been modified by another program.\nDo you want to reload it and lose the changes made in "

#-------------------------------------------------
#      Properties
#-------------------------------------------------

var dialog_text_file_path : String setget set_dialog_text_file_path
var unsaved_changes : bool setget set_unsaved_changes, has_unsaved_changes

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

func _on_ReloadLevelDialog_about_to_show() -> void:
	_update_dialog_text()

#-------------------------------------------------
#      Private Methods
#-------------------------------------------------

func _update_dialog_text():
	dialog_text = ""
	
	dialog_text += dialog_text_file_path
	dialog_text += "\n"
	dialog_text += "\n"
	if has_unsaved_changes():
		dialog_text += DIALOG_TEXT_RELOAD_UNSAVED
		dialog_text += ProjectSettings.get_setting("application/config/name")
		dialog_text += "?"
	else:
		dialog_text += DIALOG_TEXT_RELOAD

#-------------------------------------------------
#      Setters & Getters
#-------------------------------------------------

func set_dialog_text_file_path(text : String):
	dialog_text_file_path = text

func set_unsaved_changes(val : bool):
	unsaved_changes = val

func has_unsaved_changes() -> bool:
	return unsaved_changes
