# SubtileSelectPopup
# Written by: First

extends WindowDialog

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

signal subtile_spike_selected(tile_id)

#-------------------------------------------------
#      Constants
#-------------------------------------------------

#-------------------------------------------------
#      Properties
#-------------------------------------------------

#-------------------------------------------------
#      Notifications
#-------------------------------------------------

func _ready() -> void:
	#Connect all buttons
	for i in $MarginContainer/Control/PreviewTextureRect.get_children():
		if i is TileTextureButton:
			i.connect("pressed_id", self, "_on_btn_pressed_id")

#-------------------------------------------------
#      Virtual Methods
#-------------------------------------------------

#-------------------------------------------------
#      Override Methods
#-------------------------------------------------

#-------------------------------------------------
#      Public Methods
#-------------------------------------------------

func set_preview_texture(texture : Texture):
	$MarginContainer/Control/PreviewTextureRect.texture = texture

func set_spike_name(tileset_name : String):
	$MarginContainer/Control/LabelVBox/NameLabel.text = tileset_name

func set_spike_id(tileset_id : int):
	$MarginContainer/Control/LabelVBox/IDLabel.text = str("ID: ", tileset_id)

#-------------------------------------------------
#      Connections
#-------------------------------------------------

func _on_btn_pressed_id(id : int, texture : Texture):
	emit_signal("subtile_spike_selected", id)
	print_debug("subtile: " + str(id))
	hide()

#-------------------------------------------------
#      Private Methods
#-------------------------------------------------

#-------------------------------------------------
#      Setters & Getters
#-------------------------------------------------
