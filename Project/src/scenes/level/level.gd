# Level
# Written by: First

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

signal cleared_level

#-------------------------------------------------
#      Constants
#-------------------------------------------------

const PREVIEW_GAME_OBJ = preload("res://src/gameobj/preview_object/preview_game_object.tscn")

#-------------------------------------------------
#      Properties
#-------------------------------------------------

export (bool) var close setget set_close
export (bool) var copy_save_data setget set_copy_save_data

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
export (float) var default_background_color = 29.000000 setget set_default_background_color
export (float) var boss_portrait = -1.000000
export (float) var bosses_count = 0.000000
export (PoolIntArray) var weapons = [0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1]
export (float) var music_track_id = 1.000000
export (float) var music_game_id = 1.000000
export (float) var val_p = 0.000000
export (float) var val_q = 0.000000
export (float) var val_r = 0.000000
export (float) var val_s = 0.000000
export (Array) var data_bosses
export (PoolVector2Array) var disconnected_hscreens
export (PoolVector2Array) var disconnected_vscreens

onready var game_bg_tile = $GameBgTileDrawer
onready var game_tilemap = $GameTileMapDrawer
onready var game_ladder_tile = $GameLadderTileDrawer
onready var game_spike_tile = $GameSpikeTileDrawer
onready var game_objects = $Objects
onready var game_grid = $GameGrid
onready var game_tile_grid = $GameTileGrid
onready var game_active_screens = $GameActiveScreenTileDrawer

var game_data_builder : GameDataBuilder

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

func load_level(level_dir : String, level_file_path : String) -> int:
	#Check if file is .mmlv
	if not level_file_path.get_extension() == "mmlv":
		OS.alert("The file you're trying to load is not a .mmlv file. Please select a file with an extension of .mmlv.", "File Open Failure")
		return ERR_FILE_UNRECOGNIZED
	
	var dir = Directory.new()
	var dir_result = dir.open(level_dir)
	if dir_result != OK:
		OS.alert("An error occurred when trying to access the path. Returned " + str(dir_result), "Directory Open Failure")
		return dir_result
	
	var f = File.new()
	var open_result = f.open(level_file_path, File.READ)
	
	if open_result == OK:
		construct_level(f.get_as_text())
	else:
		OS.alert("Could not open the file. Returned " + str(open_result), "File open failed!")
	
	f.close()
	
	return OK

func save_level(level_dir : String, level_file_path : String) -> void:
	var dir = Directory.new()
	var dir_result = dir.open(level_dir)
	if dir_result != OK:
		OS.alert("An error occurred when trying to access the path. Returned " + str(dir_result), "Directory Open Failure")
		return
	
	var f = File.new()
	var open_result = f.open(level_file_path, File.WRITE)
	
	if open_result == OK:
		f.store_line(get_save())
	
	f.close()
	
	print("Level saved at path: " + level_file_path)

func construct_level(file_data : String):
	clear_level()
	
	game_data_builder = GameDataBuilder.new()
	game_data_builder.build(file_data)
	
	_init_level_data()
	_generate_objects()
	_generate_tilemap()
	_generate_spikes()
	_generate_ladders()
	_generate_bgs()
	_generate_active_screens()
	_update_bg_color()
	data_bosses = game_data_builder.get_data_bosses()
	disconnected_hscreens = game_data_builder.get_data_disconnected_hscreen_positions()
	disconnected_vscreens = game_data_builder.get_data_disconnected_vscreen_positions()

func clear_level():
	#Clear all TileMap(s)
	$GameTileMapDrawer.clear()
	$GameLadderTileDrawer.clear()
	$GameSpikeTileDrawer.clear()
	$GameBgTileDrawer.clear()
	$GameActiveScreenTileDrawer.set_all_cells_inactive()
	
	#Clear children from Objects
	for i in $Objects.get_children():
		i.queue_free()
	
	level_name = String()
	
	emit_signal("cleared_level")

func get_save() -> String:
	var txt_pool : PoolStringArray
	
	#Save level settings
	txt_pool.append(_combine_code_line_text("0a", user_id))
	txt_pool.append(_combine_code_line_text("0v", level_version))
	txt_pool.append(_combine_code_line_text("1a", level_name))
	txt_pool.append(_combine_code_line_text("4a", user_name))
	txt_pool.append(_combine_code_line_text("4b", user_icon_id))
	txt_pool.append(_combine_code_line_text("1b", sliding))
	txt_pool.append(_combine_code_line_text("1c", charge_shot_enable))
	txt_pool.append(_combine_code_line_text("1ba", double_damage))
	txt_pool.append(_combine_code_line_text("1ca", proto_strike))
	txt_pool.append(_combine_code_line_text("1bb", double_jump))
	txt_pool.append(_combine_code_line_text("1d", charge_shot_type))
	txt_pool.append(_combine_code_line_text("1e", default_background_color))
	txt_pool.append(_combine_code_line_text("1f", boss_portrait))
	txt_pool.append(_combine_code_line_text("1bc", bosses_count))
	
	#Bosses
	#TODO: Fix dismatching boss index
	var idx : int = 0
	for boss in data_bosses:
		boss = boss as DataGameBoss
		txt_pool.append(_combine_code_line_text("1xc" + str(idx), boss.pos.x))
		txt_pool.append(_combine_code_line_text("1yc" + str(idx), boss.pos.y))
		txt_pool.append(_combine_code_line_text("1ga" + str(idx), boss.primary_weak_enabled))
		txt_pool.append(_combine_code_line_text("1g" + str(idx), boss.primary_weak_wp_slot_id))
		txt_pool.append(_combine_code_line_text("1ha" + str(idx), boss.secondary_weak_enabled))
		txt_pool.append(_combine_code_line_text("1h" + str(idx), boss.secondary_weak_wp_slot_id))
		txt_pool.append(_combine_code_line_text("1i" + str(idx), boss.immune_enabled))
		txt_pool.append(_combine_code_line_text("1j" + str(idx), boss.immune_wp_slot_id))
		txt_pool.append(_combine_code_line_text("1ua" + str(idx), boss.drop_item_on_death))
		txt_pool.append(_combine_code_line_text("1u" + str(idx), boss.drop_item_id))
		txt_pool.append(_combine_code_line_text("1va" + str(idx), boss.drop_wp_on_death))
		txt_pool.append(_combine_code_line_text("1v" + str(idx), boss.drop_mode))
		txt_pool.append(_combine_code_line_text("1w" + str(idx), boss.drop_wp_slot_id))
		txt_pool.append(_combine_code_line_text("1xa" + str(idx), boss.change_player_enabled))
		txt_pool.append(_combine_code_line_text("1x" + str(idx), boss.change_player_id))
		txt_pool.append(_combine_code_line_text("1n" + str(idx), boss.music_category))
		txt_pool.append(_combine_code_line_text("1o" + str(idx), boss.music_id))
		
		idx += 1
	
	#Weapons
	idx = 0
	for i in weapons:
		if i == -1: #Nothing. Don't save.
			continue
		
		txt_pool.append(_combine_code_line_text("1k" + str(idx), i))
		
		idx += 1
	
	#Level (cont.)
	txt_pool.append(_combine_code_line_text("1l", music_track_id))
	txt_pool.append(_combine_code_line_text("1m", music_game_id))
	txt_pool.append(_combine_code_line_text("1p", val_p))
	txt_pool.append(_combine_code_line_text("1q", val_q))
	txt_pool.append(_combine_code_line_text("1r", val_r))
	txt_pool.append(_combine_code_line_text("1s", val_s))
	
	#Screen disconnections
	for pos in disconnected_hscreens:
		pos = pos as Vector2
		txt_pool.append(_combine_code_line_text("2b", 0, pos))
	for pos in disconnected_vscreens:
		pos = pos as Vector2
		txt_pool.append(_combine_code_line_text("2c", 1, pos))
	
	#Active screens
	for i in GameGrid.LEVEL_SIZE.x:
		for j in GameGrid.LEVEL_SIZE.y:
			var map_to_world_pos = $GameActiveScreenTileDrawer.map_to_world(Vector2(i, j))
			
			if $GameActiveScreenTileDrawer.get_cell(i, j) == TileMap.INVALID_CELL:
				txt_pool.append(_combine_code_line_text("2a", 1, map_to_world_pos))
	
	#Backgrounds
	for i in $GameBgTileDrawer.get_used_cells():
		var map_to_world_pos = $GameBgTileDrawer.map_to_world(i)
		var cell_id = $GameBgTileDrawer.get_cellv(i)
		
		txt_pool.append(_combine_code_line_text("2d", cell_id, map_to_world_pos))
	
	#Save all objects (not including tile, ladder, and spikes)
	for i in get_tree().get_nodes_in_group("PreviewGameObject"):
		i = i as PreviewGameObject
		
		txt_pool.append(_combine_code_line_text("a", 1, i.position))
		if i.obj_vector_x != DataGameObject.MISSING_DATA:
			txt_pool.append(_combine_code_line_text("b", i.obj_vector_x, i.position))
		if i.obj_vector_y != DataGameObject.MISSING_DATA:
			txt_pool.append(_combine_code_line_text("c", i.obj_vector_y, i.position))
		if i.obj_type != DataGameObject.MISSING_DATA:
			txt_pool.append(_combine_code_line_text("d", i.obj_type, i.position))
		if i.obj_id != DataGameObject.MISSING_DATA:
			txt_pool.append(_combine_code_line_text("e", i.obj_id, i.position))
		if i.obj_appearance != DataGameObject.MISSING_DATA:
			txt_pool.append(_combine_code_line_text("f", i.obj_appearance, i.position))
		if i.obj_direction != DataGameObject.MISSING_DATA:
			txt_pool.append(_combine_code_line_text("g", i.obj_direction, i.position))
		if i.obj_timer != DataGameObject.MISSING_DATA:
			txt_pool.append(_combine_code_line_text("h", i.obj_timer, i.position))
		if i.obj_tex_h_offset != DataGameObject.MISSING_DATA:
			txt_pool.append(_combine_code_line_text("j", i.obj_tex_h_offset, i.position))
		if i.obj_tex_v_offset != DataGameObject.MISSING_DATA:
			txt_pool.append(_combine_code_line_text("k", i.obj_tex_v_offset, i.position))
		if i.obj_destination_x != DataGameObject.MISSING_DATA:
			txt_pool.append(_combine_code_line_text("m", i.obj_destination_x, i.position))
		if i.obj_destination_y != DataGameObject.MISSING_DATA:
			txt_pool.append(_combine_code_line_text("n", i.obj_destination_y, i.position))
		if i.obj_option != DataGameObject.MISSING_DATA:
			txt_pool.append(_combine_code_line_text("o", i.obj_option, i.position))
	
	#Save Tiles
	for i in $GameTileMapDrawer.get_used_cells():
		var map_to_world_pos = $GameTileMapDrawer.map_to_world(i)
		var cell_id = $GameTileMapDrawer.get_cellv(i)
		
		txt_pool.append(_combine_code_line_text("a", 1, map_to_world_pos))
		txt_pool.append(_combine_code_line_text("e", floor(cell_id / GameTileSetData.TILE_COUNT), map_to_world_pos))
		txt_pool.append(_combine_code_line_text("i", 1, map_to_world_pos))
		txt_pool.append(_combine_code_line_text("j", GameTileSetData.SUBTILE_POSITION_IDS.keys()[cell_id % GameTileSetData.TILE_COUNT].x, map_to_world_pos))
		txt_pool.append(_combine_code_line_text("k", GameTileSetData.SUBTILE_POSITION_IDS.keys()[cell_id % GameTileSetData.TILE_COUNT].y, map_to_world_pos))
	
	#Save Spikes
	for i in $GameSpikeTileDrawer.get_used_cells():
		var map_to_world_pos = $GameSpikeTileDrawer.map_to_world(i)
		var cell_id = $GameSpikeTileDrawer.get_cellv(i)
		
		txt_pool.append(_combine_code_line_text("a", 1, map_to_world_pos))
		txt_pool.append(_combine_code_line_text("e", floor(cell_id / GameSpikeData.SPIKE_TILE_COUNT), map_to_world_pos))
		txt_pool.append(_combine_code_line_text("i", 2, map_to_world_pos))
		txt_pool.append(_combine_code_line_text("l", cell_id % GameSpikeData.SPIKE_TILE_COUNT, map_to_world_pos))
	
	#Save Ladders
	for i in $GameLadderTileDrawer.get_used_cells():
		var map_to_world_pos = $GameLadderTileDrawer.map_to_world(i)
		var cell_id = $GameLadderTileDrawer.get_cellv(i)
		
		txt_pool.append(_combine_code_line_text("a", 1, map_to_world_pos))
		txt_pool.append(_combine_code_line_text("e", cell_id, map_to_world_pos))
		txt_pool.append(_combine_code_line_text("i", 3, map_to_world_pos))
	
	#Config header
	txt_pool.append("[Level]")
	
	txt_pool.invert()
	
	return txt_pool.join("\n")

func toggle_screen_grid():
	game_grid.visible = !game_grid.visible
func toggle_tile_grid():
	game_tile_grid.visible = !game_tile_grid.visible
func toggle_game_tile():
	game_tilemap.visible = !game_tilemap.visible
func toggle_game_bg_tile():
	game_bg_tile.visible = !game_bg_tile.visible
func toggle_game_objects():
	game_objects.visible = !game_objects.visible
func toggle_game_active_screens():
	game_active_screens.visible = !game_active_screens.visible
func toggle_game_spike_tile():
	game_spike_tile.visible = !game_spike_tile.visible
func toggle_game_ladder_tile():
	game_ladder_tile.visible = !game_ladder_tile.visible

func get_player_position() -> Vector2:
	for i in $Objects.get_children():
		if i is PreviewGameObject:
			if i.obj_type == 4:
				return i.global_position
	
	return Vector2.ZERO

#-------------------------------------------------
#      Connections
#-------------------------------------------------

#-------------------------------------------------
#      Private Methods
#-------------------------------------------------

func _combine_code_line_text(code : String, value, position = null) -> String:
	var line : String
	
	line += code
	
	if position != null:
		position = position as Vector2
		line += str(position.x)
		line += ","
		line += str(position.y)
	
	line += "="
	line += "\""
	line += str(value)
	line += "\""
	
	return line

func _init_level_data():
	var _gamelv_data : DataGameLevel = game_data_builder.get_data_game_level()
	
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

func _generate_objects():
	var _gameobj_data = game_data_builder.get_data_game_objects()
	
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
		prev_obj.obj_direction = i.obj_direction
		prev_obj.obj_timer = i.obj_timer
		prev_obj.obj_tex_h_offset = i.obj_tex_h_offset
		prev_obj.obj_tex_v_offset = i.obj_tex_v_offset
		prev_obj.obj_destination_x = i.obj_destination_x
		prev_obj.obj_destination_y = i.obj_destination_y
		prev_obj.obj_option = i.obj_option
		prev_obj.set_owner(get_tree().edited_scene_root)

func _generate_tilemap():
	var _tile_data : Array = game_data_builder.get_data_tiles()
	$GameTileMapDrawer.draw_from_game_data_tiles(_tile_data)

func _generate_spikes():
	var _spike_tiles_data : Array = game_data_builder.get_data_spikes()
	$GameSpikeTileDrawer.draw_from_game_data_spikes(_spike_tiles_data)

func _generate_ladders():
	var _ladder_tiles_data : Array = game_data_builder.get_data_ladders()
	$GameLadderTileDrawer.draw_from_game_data_ladders(_ladder_tiles_data)

func _generate_bgs():
	var _bg_tile_data : Array = game_data_builder.get_data_bgs()
	$GameBgTileDrawer.draw_from_game_bg_data(_bg_tile_data)

func _generate_active_screens():
	$GameActiveScreenTileDrawer.draw_from_vectors(game_data_builder.get_data_active_screen_positions())

func _update_bg_color():
	$Bg.color = Color(GameBgColorData.COLORS[int(default_background_color)])

#-------------------------------------------------
#      Setters & Getters
#-------------------------------------------------

func set_close(val : bool) -> void:
	if not val:
		return
	
	clear_level()

func set_copy_save_data(val : bool) -> void:
	if not val:
		return
	
	print(get_save())
	OS.set_clipboard(get_save())
	OS.alert("Save data copied to clipboard.", "Message")

func set_default_background_color(val : float) -> void:
	default_background_color = val
	_update_bg_color()
