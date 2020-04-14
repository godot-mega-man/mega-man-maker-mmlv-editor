# ExitUnsavedDialog
# Written by: First

extends AcceptDialog

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

enum PendingRequest {
	NEW_FILE,
	OPEN,
	EXIT_APP
}

const ACTION_SAVE_EXIT = "saveexit"
const ACTION_NOSAVE = "nosave"
const ACTION_CANCEL = "cancel"

const TEXT_SAVEEXIT = "Yes"
const TEXT_NOSAVE = "No"
const TEXT_CANCEL = "Cancel"

const SAVE_DIALOG = "Save changes to level?"

#-------------------------------------------------
#      Properties
#-------------------------------------------------

export (PendingRequest) var pending_request

#-------------------------------------------------
#      Notifications
#-------------------------------------------------

func _ready() -> void:
	_set_title()
	_set_save_exit_button()
	_add_dont_save_btn()
	_add_cancel_btn()
	connect("custom_action", self, "_on_custom_action")

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

#Connect from _ready()
func _on_custom_action(action : String):
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

func _add_cancel_btn():
	add_button(TEXT_CANCEL, true, ACTION_CANCEL)


#-------------------------------------------------
#      Setters & Getters
#-------------------------------------------------
