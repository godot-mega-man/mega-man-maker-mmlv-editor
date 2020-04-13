# ExitUnsavedDialog
# Written by: First

extends ConfirmationDialog

class_name ExitUnsavedDialog

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

const ACTION_SAVE_EXIT = "saveexit"
const ACTION_NOSAVE = "nosave"

const TEXT_SAVEEXIT = "Save & Close"
const TEXT_NOSAVE = "Don\'t Save"

const SAVE_DIALOG = "Save changes to level?"

#-------------------------------------------------
#      Properties
#-------------------------------------------------

#-------------------------------------------------
#      Notifications
#-------------------------------------------------

func _ready() -> void:
	_set_title()
	_set_save_exit_button()
	_add_dont_save_btn()

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

#Connect from _add_dont_save_btn()
func _on_custom_action(action : String):
	match action:
		ACTION_NOSAVE:
			hide()

#-------------------------------------------------
#      Private Methods
#-------------------------------------------------

func _set_title():
	dialog_text = SAVE_DIALOG

func _set_save_exit_button():
	get_ok().text = TEXT_SAVEEXIT
	get_ok().grab_focus()

func _add_dont_save_btn():
	add_button(TEXT_NOSAVE, true, ACTION_NOSAVE)
	connect("custom_action", self, "_on_custom_action")

#-------------------------------------------------
#      Setters & Getters
#-------------------------------------------------
