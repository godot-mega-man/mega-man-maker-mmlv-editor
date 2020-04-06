# DebugSceneTilePreviewer
# Written by: First

extends Control

#class_name optional

"""
	A debug scene mainly used for making tileset database.
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

var current_page : int

#-------------------------------------------------
#      Notifications
#-------------------------------------------------

func _ready() -> void:
	update_preview()

#-------------------------------------------------
#      Virtual Methods
#-------------------------------------------------

#-------------------------------------------------
#      Override Methods
#-------------------------------------------------

#-------------------------------------------------
#      Public Methods
#-------------------------------------------------

func update_preview():
	#hide all
	for i in $Tiles.get_children():
		i.hide()
	
	#show by current page
	$Tiles.get_child(wrapi(current_page, 0, $Tiles.get_child_count())).show()
	$HBoxContainer/TilesetName.text = $Tiles.get_child(wrapi(current_page, 0, $Tiles.get_child_count())).name

#-------------------------------------------------
#      Connections
#-------------------------------------------------

func _on_PrevButton_button_down() -> void:
	current_page -= 1
	update_preview()

func _on_NextButton_button_down() -> void:
	current_page += 1
	update_preview()

func _on_SpinBox_value_changed(value: float) -> void:
	current_page = value
	update_preview()

#-------------------------------------------------
#      Private Methods
#-------------------------------------------------

#-------------------------------------------------
#      Setters & Getters
#-------------------------------------------------
