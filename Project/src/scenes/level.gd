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

export (float) var user_id = 1.000000 #0a
export (String) var level_version = "1.0" #0v
export (String) var level_name = "edited level" #1a
export (String) var user_name = "noname" #4a
export (float) var user_icon_id = 1.000000 #1b
export (float) var charge_shot_enable = 1.000000 #1c
export (float) var double_damage = 0.000000 #1ba
export (float) var proto_strike = 0.000000 #1ca
export (float) var double_jump = 0.000000 #1bb
export (float) var charge_shot_type = 4.000000 #1d, valid values: 4, 5, 6
export (float) var default_background_color = 29.000000 #1e
export (float) var boss_portrait = -1.000000 #1f

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

func clear_level():
	#Clear TileMap
	$GameTileMapDrawer.clear()
	
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
	var _level_data : Array = $GameObjectDataBuilder.get_level_data(file_data)
	#coming soon

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
	pass

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
