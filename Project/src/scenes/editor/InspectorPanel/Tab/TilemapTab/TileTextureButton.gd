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

signal pressed_id(tile_id, tile_texture)
signal mouse_entered_btn(texture, tileset_name, tile_id)
signal mouse_exited_btn(texture)

#-------------------------------------------------
#      Constants
#-------------------------------------------------

#-------------------------------------------------
#      Properties
#-------------------------------------------------

export var tile_id : int
var tileset_name : String

#-------------------------------------------------
#      Notifications
#-------------------------------------------------

func _ready() -> void:
	connect("mouse_entered", self, "_on_mouse_entered")
	connect("mouse_exited", self, "_on_mouse_exited")

func _pressed() -> void:
	emit_signal("pressed_id", tile_id, texture_normal)

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
	emit_signal("mouse_entered_btn", texture_normal, tileset_name, tile_id)

func _on_mouse_exited():
	emit_signal("mouse_exited_btn", texture_normal)

#-------------------------------------------------
#      Private Methods
#-------------------------------------------------

#-------------------------------------------------
#      Setters & Getters
#-------------------------------------------------
