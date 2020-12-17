# AtbDropdownButton
# Written by: First

extends Button

class_name AtbDropdownButton

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

onready var popup_panel = $PopupPanel

#-------------------------------------------------
#      Notifications
#-------------------------------------------------

func _pressed() -> void:
	popup_panel.popup(
		Rect2(
			_get_dropdown_popup_position_shift_left(),
			popup_panel.rect_size # The size of the popup remains as it is
		)
	)

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

# Returns the position of the popup that would appear under the dropdown button
func _get_dropdown_popup_position_shift_left() -> Vector2:
	return (
		rect_global_position + # The position of the button
		Vector2(
			-popup_panel.rect_size.x + rect_size.x,
			rect_size.y
		)
	)

#-------------------------------------------------
#      Setters & Getters
#-------------------------------------------------
