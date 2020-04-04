# Script_Name_Here
# Written by: 

extends Panel

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

func _on_ObjectBtn_pressed() -> void:
	EditMode.set_mode(EditMode.Mode.OBJECT)

func _on_TileMapBtn_pressed() -> void:
	EditMode.set_mode(EditMode.Mode.TILE)

func _on_BgBtn_pressed() -> void:
	EditMode.set_mode(EditMode.Mode.BACKGROUND)

func _on_ActiveScreenBtn_pressed() -> void:
	EditMode.set_mode(EditMode.Mode.ACTIVE_SCREEN)

func _on_LadderBtn_pressed() -> void:
	EditMode.set_mode(EditMode.Mode.LADDER)

func _on_SpikeBtn_pressed() -> void:
	EditMode.set_mode(EditMode.Mode.SPIKE)

func _on_ButtonsToggler_pressed() -> void:
	SelectedObjects.remove_all()

#-------------------------------------------------
#      Private Methods
#-------------------------------------------------

#-------------------------------------------------
#      Setters & Getters
#-------------------------------------------------


