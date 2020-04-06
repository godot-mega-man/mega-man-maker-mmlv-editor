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

#-------------------------------------------------
#      Properties
#-------------------------------------------------

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
		set_global_position(get_global_mouse_position())

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
	
	if left_mouse_down: #Set tile by current tile id
		set_tile(current_tile_id)
	if right_mouse_down: #Remove
		set_tile(-1)

#Set tile to a tilemap.
#If nodepath to tilemap is not specified, nothing will happen.
func set_tile(tile_id : int):
	if tilemap == null:
		return
	
	tilemap.set_cellv(tilemap.world_to_map(self.get_global_position()), tile_id)

#-------------------------------------------------
#      Connections
#-------------------------------------------------

#-------------------------------------------------
#      Private Methods
#-------------------------------------------------

#-------------------------------------------------
#      Setters & Getters
#-------------------------------------------------

func set_follow_mouse_pointer(val):
	follow_mouse_pointer = val
	set_process(val)

func set_tilemap(val):
	tilemap = val

func set_current_tile_id(val):
	current_tile_id = val
