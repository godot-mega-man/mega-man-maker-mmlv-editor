# AtbHBox
# Written by: First

extends HBoxContainer

class_name AtbHBox

"""
	Enter desc here.
"""

#-------------------------------------------------
#      Classes
#-------------------------------------------------

#-------------------------------------------------
#      Signals
#-------------------------------------------------

signal value_entered

#-------------------------------------------------
#      Constants
#-------------------------------------------------

enum DropdownInput {
	NONE,
	BOSS_PORTRAITS,
	COLOR_PALETTE
}

const PLACEHOLDER_EMPTY = "Empty"
const PLACEHOLDER_MULTI_VALUES = "Various"

#-------------------------------------------------
#      Properties
#-------------------------------------------------

export (bool) var missing_value_enabled = true
export (String) var property_name
export (String) var code
export (DropdownInput) var dropdown_input setget set_dropdown_input

onready var property_label = $PropertyLabel
onready var code_label = $CodeLabel
onready var lineedit = $LineEditHBox/LineEdit
onready var atb_dropdown_button_boss = $LineEditHBox/AtbDropdownButtonBoss

var string_value = ""

#-------------------------------------------------
#      Notifications
#-------------------------------------------------

func _ready() -> void:
	_update_dropdown_input()
	
	property_label.text = property_name
	code_label.text = code
	lineedit.placeholder_text = PLACEHOLDER_EMPTY

#-------------------------------------------------
#      Virtual Methods
#-------------------------------------------------

#-------------------------------------------------
#      Override Methods
#-------------------------------------------------

#-------------------------------------------------
#      Public Methods
#-------------------------------------------------

func show_code():
	code_label.visible = true
	property_label.visible = false

func show_property():
	property_label.visible = true
	code_label.visible = false

func set_value(val):
	if float(val) == DataGameObject.MISSING_DATA:
		return
	
	string_value = val
	lineedit.text = str(val)
	atb_dropdown_button_boss.set_curr_data_from_id(int(val))

func get_value() -> String:
	return string_value

func clear_property():
	set_value("")
	set_placeholder_empty()

func set_placeholder_empty():
	lineedit.placeholder_text = PLACEHOLDER_EMPTY

func set_placeholder_multivalues():
	lineedit.placeholder_text = PLACEHOLDER_MULTI_VALUES

func is_placeholder_empty() -> bool:
	return lineedit.placeholder_text == PLACEHOLDER_EMPTY

func lineedit_release_focus():
	lineedit.release_focus()
	lineedit.deselect()

#-------------------------------------------------
#      Connections
#-------------------------------------------------

func _on_LineEdit_text_changed(new_text: String) -> void:
	UnsaveChanges.set_activated()
	
	if missing_value_enabled and new_text == "":
		lineedit.text = str(DataGameObject.MISSING_DATA)
		emit_signal("value_entered")
		lineedit.text = new_text
		return
	
	string_value = new_text
	emit_signal("value_entered")
	
	_update_dropdown_input()

func _on_LineEdit_text_entered(new_text: String) -> void:
	lineedit_release_focus()

func _on_LineEdit_focus_entered() -> void:
	lineedit.call_deferred("select_all")

func _on_AtbDropdownButtonBoss_selected(id) -> void:
	UnsaveChanges.set_activated()
	set_value(id)
	lineedit.text = str(id)
	emit_signal("value_entered")

#-------------------------------------------------
#      Private Methods
#-------------------------------------------------

func _update_dropdown_input():
	if atb_dropdown_button_boss == null:
		return
	
	match dropdown_input:
		DropdownInput.NONE:
			atb_dropdown_button_boss.hide()
		DropdownInput.BOSS_PORTRAITS:
			atb_dropdown_button_boss.show()
			atb_dropdown_button_boss.set_curr_data_from_id(int(string_value))

#-------------------------------------------------
#      Setters & Getters
#-------------------------------------------------

func set_dropdown_input(val):
	dropdown_input = val
	_update_dropdown_input()
