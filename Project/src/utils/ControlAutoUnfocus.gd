# ControlAutoUnfocus

extends Node

"""
	A helper node that automatically releases focus when the user
	leaves, e.g. clicked somewhere.
	
	The main use is, especially for LineEdit, which has a problem when the focus
	is always there even when the user clicked outside of it.
	
	Instance this node under Control node to make it work.
"""

#-------------------------------------------------
#      Notifications
#-------------------------------------------------

func _input(event: InputEvent) -> void:
	_try_release_parent_focus(event)

#-------------------------------------------------
#      Private Methods
#-------------------------------------------------

# Release input focus when the mouse is clicked elsewhere.
func _try_release_parent_focus(event : InputEvent):
	if not event.is_pressed():
		return
	if not (
		event is InputEventMouseButton or
		(
			event is InputEventKey and (
				event.scancode == KEY_ESCAPE or
				event.scancode == KEY_ENTER
			)
		)
		):
		return
	
	(get_parent() as Control).release_focus()
	
	if get_parent() is LineEdit:
		get_parent().deselect()

#-------------------------------------------------
#      Setters & Getters
#-------------------------------------------------
