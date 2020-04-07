# TilePainter
# Written by: First

extends Node2D

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

const EYEDROP_MODIFIER_KEY = KEY_ALT

#-------------------------------------------------
#      Properties
#-------------------------------------------------

onready var tilemap_preview = $TileMapPreview

var left_mouse_down : bool = false
var right_mouse_down : bool = false

var follow_mouse_pointer : bool setget set_follow_mouse_pointer
var tilemap : TileMap setget set_tilemap
var current_tile_id : int setget set_current_tile_id 

#-------------------------------------------------
#      Notifications
#-------------------------------------------------

func _process(delta: float) -> void:
	if follow_mouse_pointer:
		global_position = get_global_mouse_position()
		
		#Snap position to the tilemap (if possible)
		if tilemap != null:
			position -= (tilemap.cell_size * 0.5)
			position = position.snapped(tilemap.cell_size)

#-------------------------------------------------
#      Virtual Methods
#-------------------------------------------------

#-------------------------------------------------
#      Override Methods
#-------------------------------------------------

#-------------------------------------------------
#      Public Methods
#-------------------------------------------------

func process_input(event : InputEvent):
	#Set mouse being pressed or not
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT:
			left_mouse_down = event.is_pressed()
		if event.button_index == BUTTON_RIGHT:
			right_mouse_down = event.is_pressed()
	
	if left_mouse_down:
		if Input.is_key_pressed(EYEDROP_MODIFIER_KEY):
			#Eyedropper
			eyedrop()
		else:
			#Set tile by current tile id
			set_tile(current_tile_id)
	if right_mouse_down: #Remove
		set_tile(-1)

#Set tile to a tilemap.
#If nodepath to tilemap is not specified, nothing will happen.
func set_tile(tile_id : int):
	if tilemap == null:
		return
	
	tilemap.set_cellv(tilemap.world_to_map(self.get_global_position()), tile_id)

#Pick and update current tile from current mouse position.
func eyedrop():
	current_tile_id = tilemap.get_cellv(tilemap.world_to_map(self.get_global_position()))
	_update_tilemap_preview()

#-------------------------------------------------
#      Connections
#-------------------------------------------------

#-------------------------------------------------
#      Private Methods
#-------------------------------------------------

func _update_tilemap_preview():
	if tilemap == null:
		return
	
	tilemap_preview.tile_set = tilemap.tile_set
	tilemap_preview.set_cellv(Vector2(0, 0), current_tile_id)
	tilemap_preview.cell_size = tilemap.cell_size

#-------------------------------------------------
#      Setters & Getters
#-------------------------------------------------

func set_follow_mouse_pointer(val):
	follow_mouse_pointer = val
	set_process(val)

func set_tilemap(val):
	tilemap = val
	_update_tilemap_preview()

func set_current_tile_id(val):
	current_tile_id = val
	_update_tilemap_preview()
