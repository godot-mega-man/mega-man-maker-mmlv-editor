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

class TilemapsCurrentTileID:
	extends Reference
	
	# Dict structure:
	# {
	#    Tilemap1 : id,
	#    Tilemap2 : id,
	#    ...
	# }
	var _mapped_ids : Dictionary
	var current : int # Current tile id
	
	func save_id_by_tilemap(tilemap : TileMap, tile_id : int = current):
		_mapped_ids[tilemap] = tile_id
	
	# Sets the current id from the mapped ids.
	# If the tilemap has never been mapped before, the first id from the
	# tileset of a tilemap is used and then maps the newly fetched id into the
	# mapped ids.
	func get_from_mapped_ids(tilemap : TileMap) -> void:
		assert(tilemap != null)
		assert(tilemap.tile_set != null)
		
		if not _mapped_ids.has(tilemap):
			var first_tile_id = _get_first_tile_id(tilemap.tile_set)
			_mapped_ids[tilemap] = first_tile_id
			current = first_tile_id
			return
		
		current = _mapped_ids[tilemap]
	
	func _get_first_tile_id(tile_set : TileSet) -> int:
		assert(tile_set)
		
		var tiles_ids = tile_set.get_tiles_ids()
		
		if tiles_ids.empty():
			return 0
		
		return tiles_ids.front()

#-------------------------------------------------
#      Signals
#-------------------------------------------------

signal changed_tile_id(tilemap_tile_id)

#-------------------------------------------------
#      Constants
#-------------------------------------------------

const EYEDROP_MODIFIER_KEY = KEY_ALT
const UNDO_PAINT_TILE_ACTION_NAME = "Paint Tilemap"

#-------------------------------------------------
#      Properties
#-------------------------------------------------

onready var tilemap_preview = $TileMapPreview

var left_mouse_down : bool
var right_mouse_down : bool
var was_eyedrop_modifier_key_pressed : bool
var middle_click_press_moved : bool

var follow_mouse_pointer : bool setget set_follow_mouse_pointer
var tilemap : TileMap setget set_tilemap
var tilemaps_current_tile_id : TilemapsCurrentTileID = TilemapsCurrentTileID.new()

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
			
			if event.is_pressed():
				_register_undo_start()
			else:
				_register_undo_end()
		if event.button_index == BUTTON_RIGHT:
			right_mouse_down = event.is_pressed()
			
			if event.is_pressed():
				_register_undo_start()
			else:
				_register_undo_end()
		if event.button_index == BUTTON_MIDDLE:
			if event.is_pressed():
				middle_click_press_moved = false
			else:
				if not middle_click_press_moved:
					eyedrop()
	
	if event is InputEventMouseMotion:
		middle_click_press_moved = true
	
	if left_mouse_down:
		if Input.is_key_pressed(EYEDROP_MODIFIER_KEY):
			#Eyedropper
			eyedrop()
		else:
			#Set tile by current tile id
			set_tile(tilemaps_current_tile_id.current)
	if right_mouse_down: #Remove
		set_tile(-1)

#Set tile to a tilemap.
#If nodepath to tilemap is not specified, nothing will happen.
func set_tile(tile_id : int):
	if tilemap == null:
		return
	
	var cell_position = tilemap.world_to_map(self.get_global_position())
	var cell_tile_id_set = tile_id
	var cell_tile_id_undo = tilemap.get_cellv(cell_position)
	
	if cell_tile_id_set == cell_tile_id_undo:
		return
	
	LevelUndo.get_undo_redo().add_do_method(tilemap, "set_cellv", cell_position, cell_tile_id_set)
	LevelUndo.get_undo_redo().add_undo_method(tilemap, "set_cellv", cell_position, cell_tile_id_undo)
	tilemap.set_cellv(cell_position, cell_tile_id_set)
	
	UnsaveChanges.set_activated()

#Pick and update current tile from current mouse position.
func eyedrop():
	tilemaps_current_tile_id.current = tilemap.get_cellv(tilemap.world_to_map(self.get_global_position()))
	_update_tilemap_preview()
	emit_signal("changed_tile_id", tilemaps_current_tile_id.current)

func get_current_tile_id():
	return tilemaps_current_tile_id.current

func set_current_tile_id(id):
	tilemaps_current_tile_id.current = id
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
	tilemap_preview.set_cellv(Vector2(0, 0), tilemaps_current_tile_id.current)
	tilemap_preview.cell_size = tilemap.cell_size

func _register_undo_start():
	was_eyedrop_modifier_key_pressed = Input.is_key_pressed(EYEDROP_MODIFIER_KEY)
	if was_eyedrop_modifier_key_pressed:
		return
	
	LevelUndo.get_undo_redo().create_action(UNDO_PAINT_TILE_ACTION_NAME)

func _register_undo_end():
	if was_eyedrop_modifier_key_pressed:
		return
	
	LevelUndo.get_undo_redo().commit_action()

#-------------------------------------------------
#      Setters & Getters
#-------------------------------------------------

func set_follow_mouse_pointer(val):
	follow_mouse_pointer = val
	set_process(val)

func set_tilemap(val):
	tilemaps_current_tile_id.save_id_by_tilemap(tilemap)
	tilemap = val
	tilemaps_current_tile_id.get_from_mapped_ids(val)
	_update_tilemap_preview()
