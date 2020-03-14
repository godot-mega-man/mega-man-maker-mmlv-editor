# Level
# Written by: First

tool
extends Node

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

const PREVIEW_GAME_OBJ = preload("res://src/gameobj/preview_object/preview_game_object.tscn")

#-------------------------------------------------
#      Properties
#-------------------------------------------------

export (String) var level_path = "C:/Users/Acer/AppData/Local/MegaMaker/Levels"
export (String) var level_file_name = "level"

export (bool) var load_file setget load_file
export (bool) var save setget set_save
export (bool) var close setget set_close

#--Level Settings

export (float) var user_id = 1.000000
export (String) var level_version = "1.0"
export (String) var level_name = "edited level"
export (String) var user_name = "noname"
export (float) var user_icon_id = 1.000000
export (float) var sliding = 1.000000
export (float) var charge_shot_enable = 1.000000
export (float) var double_damage = 0.000000
export (float) var proto_strike = 0.000000
export (float) var double_jump = 0.000000
export (float) var charge_shot_type = 4.000000
export (float) var default_background_color = 29.000000
export (float) var boss_portrait = -1.000000
export (float) var bosses_count = 0.000000
export (PoolIntArray) var weapons = [0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1]
export (float) var music_track_id = 1.000000
export (float) var music_game_id = 1.000000
export (float) var val_p = 0.000000
export (float) var val_q = 0.000000
export (float) var val_r = 0.000000
export (float) var val_s = 0.000000

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

func construct_level(file_data : String):
	clear_level()
	_init_level_data(file_data)
	_generate_objects(file_data)
	_generate_tilemap(file_data)
	_generate_bgs(file_data)
	_generate_active_screens(file_data)

func clear_level():
	#Clear all TileMap(s)
	$GameTileMapDrawer.clear()
	$GameBgTileDrawer.clear()
	$GameActiveScreenTileDrawer.set_all_cells_inactive()
	
	#Clear children from Objects
	for i in $Objects.get_children():
		i.queue_free()
	
	level_name = String()

#-------------------------------------------------
#      Connections
#-------------------------------------------------

#-------------------------------------------------
#      Private Methods
#-------------------------------------------------

func _init_level_data(file_data : String):
	var _gamelv_data : DataGameLevel = $GameObjectDataBuilder.get_game_level_data(file_data)
	
	user_id = _gamelv_data.user_id
	level_version = _gamelv_data.level_version
	level_name = _gamelv_data.level_name
	user_name = _gamelv_data.user_name
	user_icon_id = _gamelv_data.user_icon_id
	sliding = _gamelv_data.sliding
	charge_shot_enable = _gamelv_data.charge_shot_enable
	double_damage = _gamelv_data.double_damage
	proto_strike = _gamelv_data.proto_strike
	double_jump = _gamelv_data.double_jump
	charge_shot_type = _gamelv_data.charge_shot_type
	default_background_color = _gamelv_data.default_background_color
	boss_portrait = _gamelv_data.boss_portrait
	bosses_count = _gamelv_data.bosses_count
	weapons = _gamelv_data.weapons
	music_track_id = _gamelv_data.music_track_id
	music_game_id = _gamelv_data.music_game_id
	val_p = _gamelv_data.val_p
	val_q = _gamelv_data.val_q
	val_r = _gamelv_data.val_r
	val_s = _gamelv_data.val_s


func _get_value_from_line(val):
	val = val.replace("\"", "")
	return val.split(val, "=")[1]

func _generate_objects(file_data : String):
	var _gameobj_data : Array = $GameObjectDataBuilder.get_gameobj_data(file_data)
	
	for i in _gameobj_data:
		i = i as DataGameObject
		
		var prev_obj = PREVIEW_GAME_OBJ.instance()
		$Objects.add_child(prev_obj)
		prev_obj.global_position = i.pos
		prev_obj.obj_vector_x = i.obj_vector_x
		prev_obj.obj_vector_y = i.obj_vector_y
		prev_obj.obj_type = i.obj_type
		prev_obj.obj_id = i.obj_id
		prev_obj.obj_appearance = i.obj_appearance
		prev_obj.obj_timer = i.obj_timer
		prev_obj.set_owner(get_tree().edited_scene_root)

func _generate_tilemap(file_data : String):
	var _tile_data : Array = $GameObjectDataBuilder.get_tile_data(file_data)
	$GameTileMapDrawer.draw_from_game_data_tiles(_tile_data)

func _generate_bgs(file_data : String):
	var _bg_tile_data : Array = $GameObjectDataBuilder.get_bg_data(file_data)
	$GameBgTileDrawer.draw_from_game_bg_data(_bg_tile_data)

func _generate_active_screens(file_data : String):
	$GameActiveScreenTileDrawer.draw_from_vectors($GameObjectDataBuilder.get_active_screens_data(file_data))

#-------------------------------------------------
#      Setters & Getters
#-------------------------------------------------

func load_file(val : bool) -> void:
	if not val:
		return
	
	var dir = Directory.new()
	var dir_result = dir.open(level_path)
	if dir_result != OK:
		OS.alert("An error occurred when trying to access the path. Returned " + str(dir_result), "Directory Open Failure")
		return
	
	var f = File.new()
	var open_result = f.open(level_path.plus_file(level_file_name + ".mmlv"), File.READ)
	
	if open_result == OK:
		construct_level(f.get_as_text())
	else:
		OS.alert("Could not open the file. Returned " + str(open_result), "File open failed!")
	
	f.close()

func set_save(val : bool) -> void:
	if not val:
		return
	
	if level_name.empty():
		OS.alert("Please enter a level name before saving a level.", "Save")
		return
	
	OS.alert("Level saved!", "Saved")

func set_close(val : bool) -> void:
	if not val:
		return
	
	clear_level()
