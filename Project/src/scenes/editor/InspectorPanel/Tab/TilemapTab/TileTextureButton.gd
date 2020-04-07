# TileTextureButton
# Written by: First

extends TextureButton

class_name TileTextureButton

"""
	Enter desc here.
"""

#-------------------------------------------------
#      Classes
#-------------------------------------------------

#-------------------------------------------------
#      Signals
#-------------------------------------------------

signal pressed_id(tile_id)
signal mouse_entered_btn(texture, tileset_name)
signal mouse_exited_btn(texture)

#-------------------------------------------------
#      Constants
#-------------------------------------------------

#-------------------------------------------------
#      Properties
#-------------------------------------------------

var tile_id : int
var tileset_name : String

#-------------------------------------------------
#      Notifications
#-------------------------------------------------

func _ready() -> void:
	connect("mouse_entered", self, "_on_mouse_entered")
	connect("mouse_exited", self, "_on_mouse_exited")

func _pressed() -> void:
	emit_signal("pressed_id", tile_id)

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

func _on_mouse_entered():
	emit_signal("mouse_entered_btn", _get_texture_from_atlas(texture_normal), tileset_name)

func _on_mouse_exited():
	emit_signal("mouse_exited_btn", _get_texture_from_atlas(texture_normal))

#-------------------------------------------------
#      Private Methods
#-------------------------------------------------

func _get_texture_from_atlas(atlas : AtlasTexture) -> Texture:
	return atlas.atlas

#-------------------------------------------------
#      Setters & Getters
#-------------------------------------------------
