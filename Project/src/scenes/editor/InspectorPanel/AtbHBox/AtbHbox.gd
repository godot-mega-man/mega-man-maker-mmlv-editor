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

const PLACEHOLDER_EMPTY = ""
const PLACEHOLDER_MULTI_VALUES = "Multivalues"

#-------------------------------------------------
#      Properties
#-------------------------------------------------

export (bool) var missing_value_enabled = true
export (String) var property_name
export (String) var code

#-------------------------------------------------
#      Notifications
#-------------------------------------------------

func _ready() -> void:
	$PropertyLabel.text = property_name
	$CodeLabel.text = code
	
	$LineEdit.placeholder_text = PLACEHOLDER_EMPTY

#When the mouse button is clicked elsewhere, LineEdit automatically
#loses focus.
func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.is_pressed():
			lineedit_release_focus()

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
	$CodeLabel.visible = true
	$PropertyLabel.visible = false

func show_property():
	$PropertyLabel.visible = true
	$CodeLabel.visible = false

func set_value(val):
	if val == DataGameObject.MISSING_DATA:
		return
	
	$LineEdit.text = str(val)

func get_value() -> String:
	return $LineEdit.text

func clear_property():
	$LineEdit.text = ""
	set_placeholder_empty()

func set_placeholder_empty():
	$LineEdit.placeholder_text = PLACEHOLDER_EMPTY

func set_placeholder_multivalues():
	$LineEdit.placeholder_text = PLACEHOLDER_MULTI_VALUES

func is_placeholder_empty() -> bool:
	return $LineEdit.placeholder_text == PLACEHOLDER_EMPTY

func lineedit_release_focus():
	$LineEdit.release_focus()
	$LineEdit.deselect()

#-------------------------------------------------
#      Connections
#-------------------------------------------------

func _on_LineEdit_text_changed(new_text: String) -> void:
	if missing_value_enabled and new_text == "":
		$LineEdit.text = str(DataGameObject.MISSING_DATA)
	
	emit_signal("value_entered")
	$LineEdit.text = new_text

func _on_LineEdit_text_entered(new_text: String) -> void:
	lineedit_release_focus()

func _on_LineEdit_focus_entered() -> void:
	$LineEdit.call_deferred("select_all")

#-------------------------------------------------
#      Private Methods
#-------------------------------------------------

#-------------------------------------------------
#      Setters & Getters
#-------------------------------------------------
