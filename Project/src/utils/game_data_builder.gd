# GameDataBuilder
# Written by: First

tool
extends Reference

class_name GameDataBuilder

"""
	Enter desc here.
"""

#-------------------------------------------------
#      Classes
#-------------------------------------------------

class PoolStringReverse:
	extends Reference
	
	static func reverse(text : String) -> PoolStringArray:
		var reversed_poolstring = Array(text.split("\n", false))
		reversed_poolstring.invert()
		return reversed_poolstring

class TempObjectCodeData:
	extends Reference
	
	var a : float = DataGameObject.MISSING_DATA
	var b : float = DataGameObject.MISSING_DATA
	var c : float = DataGameObject.MISSING_DATA
	var d : float = DataGameObject.MISSING_DATA
	var e : float = DataGameObject.MISSING_DATA
	var f : float = DataGameObject.MISSING_DATA
	var g : float = DataGameObject.MISSING_DATA
	var h : float = DataGameObject.MISSING_DATA
	var i : float = 0
	var j : float = DataGameObject.MISSING_DATA
	var k : float = DataGameObject.MISSING_DATA
	var l : float = 0
	var m : float = DataGameObject.MISSING_DATA
	var n : float = DataGameObject.MISSING_DATA
	var o : float = DataGameObject.MISSING_DATA
	var pos : Vector2

class TempBossCodeData:
	extends Reference
	
	var _1xc = 0
	var _1yc = 0
	var _1ga
	var _1g
	var _1ha
	var _1h
	var _1i
	var _1j
	var _1ua
	var _1u
	var _1va
	var _1v
	var _1w
	var _1xa
	var _1x
	var _1n
	var _1o

#-------------------------------------------------
#      Signals
#-------------------------------------------------

#-------------------------------------------------
#      Constants
#-------------------------------------------------

enum BlockType {
	OBJECT = 0,
	TILE = 1,
	SPIKE = 2,
	LADDER = 3
}

#-------------------------------------------------
#      Properties
#-------------------------------------------------

var _data_game_level : DataGameLevel setget , get_data_game_level
var _data_bosses : Array setget , get_data_bosses
var _data_game_objects : Array setget , get_data_game_objects
var _data_tiles : Array setget , get_data_tiles
var _data_spikes : Array setget , get_data_spikes
var _data_ladders : Array setget , get_data_ladders
var _data_bgs : Array setget , get_data_bgs
var _data_active_screen_positions : PoolVector2Array setget , get_data_active_screen_positions
var _data_disconnected_hscreen_positions : PoolVector2Array setget , get_data_disconnected_hscreen_positions
var _data_disconnected_vscreen_positions : PoolVector2Array setget , get_data_disconnected_vscreen_positions

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

func build(file_data : String):
	clear_all_data()
	
	var _reversed_pool_file_data : PoolStringArray = PoolStringReverse.reverse(file_data)
	var temp_boss_code_data = TempBossCodeData.new()
	var temp_obj_code_data : TempObjectCodeData = null
	
	for i in _reversed_pool_file_data:
		i = i as String
		
		var _dataset : PoolStringArray
		
		#Level settings
		match i.left(2):
			"0a": #User id
				_dataset = _get_dataset_from_line_data(i, "0a")
				_data_game_level.user_id = float(_dataset[1])
			"0v": #Level version
				_dataset = _get_dataset_from_line_data(i, "0v")
				_data_game_level.level_version = str(_dataset[1])
			"1a": #Level name
				_dataset = _get_dataset_from_line_data(i, "1a")
				_data_game_level.level_name = str(_dataset[1])
			"4a": #Username
				_dataset = _get_dataset_from_line_data(i, "4a")
				_data_game_level.user_name = str(_dataset[1])
			"4b": #User icon (portrait)
				_dataset = _get_dataset_from_line_data(i, "4b")
				_data_game_level.user_icon_id = float(_dataset[1])
			"1b": #Sliding
				_dataset = _get_dataset_from_line_data(i, "1b")
				if not (
					_dataset[0] == "a" or
					_dataset[0] == "b" or
					_dataset[0] == "c"
				): #Must not be either '1ba', '1bb', or '1bc'
					_data_game_level.sliding = float(_dataset[1])
			"1c": #Charge shot enabled
				_dataset = _get_dataset_from_line_data(i, "1c")
				if not (_dataset[0] == "a"):
					_data_game_level.charge_shot_enable = float(_dataset[1])
			"1d": #Charge shot type
				_dataset = _get_dataset_from_line_data(i, "1d")
				_data_game_level.charge_shot_type = float(_dataset[1])
			"1e": #Default bg color id
				_dataset = _get_dataset_from_line_data(i, "1e")
				_data_game_level.default_background_color = float(_dataset[1])
			"1f": #Boss portrait
				_dataset = _get_dataset_from_line_data(i, "1f")
				_data_game_level.boss_portrait = float(_dataset[1])
			"1k": #Weapon slots
				_dataset = _get_dataset_from_line_data(i, "1k")
				_data_game_level.weapons[int(_dataset[0])] = float(_dataset[1])
			"1l": #Level track ID
				_dataset = _get_dataset_from_line_data(i, "1l")
				_data_game_level.music_track_id = float(_dataset[1])
			"1m": #Level music (game number)
				_dataset = _get_dataset_from_line_data(i, "1m")
				_data_game_level.music_game_id = float(_dataset[1])
			"1p": #Default bg color id
				_dataset = _get_dataset_from_line_data(i, "1p")
				_data_game_level.val_p = float(_dataset[1])
			"1q": #Default bg color id
				_dataset = _get_dataset_from_line_data(i, "1q")
				_data_game_level.val_q = float(_dataset[1])
			"1r": #Default bg color id
				_dataset = _get_dataset_from_line_data(i, "1r")
				_data_game_level.val_r = float(_dataset[1])
			"1s": #Default bg color id
				_dataset = _get_dataset_from_line_data(i, "1s")
				_data_game_level.val_s = float(_dataset[1])
		match i.left(3):
			"1ba":
				_dataset = _get_dataset_from_line_data(i, "1ba")
				_data_game_level.double_damage = float(_dataset[1])
			"1ca":
				_dataset = _get_dataset_from_line_data(i, "1ba")
				_data_game_level.proto_strike = float(_dataset[1])
			"1bb":
				_dataset = _get_dataset_from_line_data(i, "1bb")
				_data_game_level.double_jump = float(_dataset[1])
			"1bc":
				_dataset = _get_dataset_from_line_data(i, "1bc")
				_data_game_level.bosses_count = float(_dataset[1])
		
		#Boss data
		match i.left(3):
			"1xc":
				_dataset = _get_dataset_from_line_data(i, "1xc")
				temp_boss_code_data._1xc = float(_dataset[1])
			"1yc":
				_dataset = _get_dataset_from_line_data(i, "1yc")
				temp_boss_code_data._1yc = float(_dataset[1])
			"1ga":
				_dataset = _get_dataset_from_line_data(i, "1ga")
				temp_boss_code_data._1ga = float(_dataset[1])
			"1ha":
				_dataset = _get_dataset_from_line_data(i, "1ha")
				temp_boss_code_data._1ha = float(_dataset[1])
			"1ua":
				_dataset = _get_dataset_from_line_data(i, "1ua")
				temp_boss_code_data._1ua = float(_dataset[1])
			"1va":
				_dataset = _get_dataset_from_line_data(i, "1va")
				temp_boss_code_data._1va = float(_dataset[1])
			"1xa":
				_dataset = _get_dataset_from_line_data(i, "1xa")
				temp_boss_code_data._1xa = float(_dataset[1])
		match i.left(2):
			"1g":
				_dataset = _get_dataset_from_line_data(i, "1g")
				if not _dataset[0].left(1) == "a":
					temp_boss_code_data._1g = float(_dataset[1])
			"1h":
				_dataset = _get_dataset_from_line_data(i, "1h")
				if not _dataset[0].left(1) == "a":
					temp_boss_code_data._1h = float(_dataset[1])
			"1i":
				_dataset = _get_dataset_from_line_data(i, "1i")
				temp_boss_code_data._1i = float(_dataset[1])
			"1j":
				_dataset = _get_dataset_from_line_data(i, "1j")
				temp_boss_code_data._1j = float(_dataset[1])
			"1u":
				_dataset = _get_dataset_from_line_data(i, "1u")
				if not _dataset[0].left(1) == "a":
					temp_boss_code_data._1u = float(_dataset[1])
			"1v":
				_dataset = _get_dataset_from_line_data(i, "1v")
				if not _dataset[0].left(1) == "a":
					temp_boss_code_data._1v = float(_dataset[1])
			"1w":
				_dataset = _get_dataset_from_line_data(i, "1w")
				temp_boss_code_data._1w = float(_dataset[1])
			"1x":
				_dataset = _get_dataset_from_line_data(i, "1x")
				if not (_dataset[0].left(1) == "a" or _dataset[0].left(1) == "c"):
					temp_boss_code_data._1x = float(_dataset[1])
			"1n":
				_dataset = _get_dataset_from_line_data(i, "1n")
				temp_boss_code_data._1n = float(_dataset[1])
			"1o":
				_dataset = _get_dataset_from_line_data(i, "1o")
				temp_boss_code_data._1o = float(_dataset[1])
				_build_from_code_data(temp_boss_code_data)
				temp_boss_code_data = TempBossCodeData.new() #Create a new one if there are one more bosses.
		
		#Active screens
		match i.left(2):
			"2a":
				_dataset = _get_dataset_from_line_data(i, "2a")
				if float(_dataset[2]) == 1.0:
					_data_active_screen_positions.append(Vector2(float(_dataset[0]), float(_dataset[1])))
		
		#Screen disconnections
		#Horizontal, and Vertical, respectively
		match i.left(2):
			"2b": #Horizontal
				_dataset = _get_dataset_from_line_data(i, "2b")
				_data_disconnected_hscreen_positions.append(Vector2(float(_dataset[0]), float(_dataset[1])))
			"2c": #Vertical
				_dataset = _get_dataset_from_line_data(i, "2c")
				_data_disconnected_vscreen_positions.append(Vector2(float(_dataset[0]), float(_dataset[1])))
		
		
		#Backgrounds
		match i.left(2):
			"2d":
				_dataset = _get_dataset_from_line_data(i, "2d")
				
				var bg = DataGameBg.new()
				bg.pos = Vector2(float(_dataset[0]), float(_dataset[1]))
				bg.bg_id = float(_dataset[2])
				
				_data_bgs.append(bg)
		
		#GameObj. Be it tileset, game object, ladder, spike, etc.
		match i.left(1):
			"a":
				if temp_obj_code_data != null: #Given that this is not the first time it reads this data
					_build_from_code_data(temp_obj_code_data)
				
				temp_obj_code_data = TempObjectCodeData.new()
				_dataset = _get_dataset_from_line_data(i, "a")
				temp_obj_code_data.pos = Vector2(float(_dataset[0]), float(_dataset[1]))
				temp_obj_code_data.a = float(_dataset[2])
			"b":
				_dataset = _get_dataset_from_line_data(i, "b")
				temp_obj_code_data.b = float(_dataset[2])
			"c":
				_dataset = _get_dataset_from_line_data(i, "c")
				temp_obj_code_data.c = float(_dataset[2])
			"d":
				_dataset = _get_dataset_from_line_data(i, "d")
				temp_obj_code_data.d = float(_dataset[2])
			"e":
				_dataset = _get_dataset_from_line_data(i, "e")
				temp_obj_code_data.e = float(_dataset[2])
			"f":
				_dataset = _get_dataset_from_line_data(i, "f")
				temp_obj_code_data.f = float(_dataset[2])
			"g":
				_dataset = _get_dataset_from_line_data(i, "g")
				temp_obj_code_data.g = float(_dataset[2])
			"h":
				_dataset = _get_dataset_from_line_data(i, "h")
				temp_obj_code_data.h = float(_dataset[2])
			"i":
				_dataset = _get_dataset_from_line_data(i, "i")
				temp_obj_code_data.i = float(_dataset[2])
			"j":
				_dataset = _get_dataset_from_line_data(i, "j")
				temp_obj_code_data.j = float(_dataset[2])
			"k":
				_dataset = _get_dataset_from_line_data(i, "k")
				temp_obj_code_data.k = float(_dataset[2])
			"l":
				_dataset = _get_dataset_from_line_data(i, "l")
				temp_obj_code_data.l = float(_dataset[2])
			"m":
				_dataset = _get_dataset_from_line_data(i, "m")
				temp_obj_code_data.m = float(_dataset[2])
			"n":
				_dataset = _get_dataset_from_line_data(i, "n")
				temp_obj_code_data.n = float(_dataset[2])
			"o":
				_dataset = _get_dataset_from_line_data(i, "o")
				temp_obj_code_data.o = float(_dataset[2])
		if i == "[Level]":
			if temp_obj_code_data != null:
				_build_from_code_data(temp_obj_code_data)
		
	

func clear_all_data():
	_data_game_level = DataGameLevel.new()
	_data_game_objects = Array()
	_data_tiles = Array()
	_data_bgs = Array()
	_data_active_screen_positions = PoolVector2Array()

# Build data on this class. Any code data like TempObjectCodeData and
# TempBossCodeData can be used as a parameter.
func _build_from_code_data(code_data):
	if code_data is TempObjectCodeData:
		if code_data.i == BlockType.OBJECT:
			var data_game_obj = DataGameObject.new()
			data_game_obj.pos = code_data.pos
			if code_data.b != DataGameObject.MISSING_DATA:
				data_game_obj.obj_vector_x = code_data.b
			if code_data.c != DataGameObject.MISSING_DATA:
				data_game_obj.obj_vector_y = code_data.c
			if code_data.d != DataGameObject.MISSING_DATA:
				data_game_obj.obj_type = code_data.d
			if code_data.e != DataGameObject.MISSING_DATA:
				data_game_obj.obj_id = code_data.e
			if code_data.f != DataGameObject.MISSING_DATA:
				data_game_obj.obj_appearance = code_data.f
			if code_data.g != DataGameObject.MISSING_DATA:
				data_game_obj.obj_direction = code_data.g
			if code_data.h != DataGameObject.MISSING_DATA:
				data_game_obj.obj_timer = code_data.h
			if code_data.j != DataGameObject.MISSING_DATA:
				data_game_obj.obj_tex_h_offset = code_data.j
			if code_data.k != DataGameObject.MISSING_DATA:
				data_game_obj.obj_tex_v_offset = code_data.k
			if code_data.m != DataGameObject.MISSING_DATA:
				data_game_obj.obj_destination_x = code_data.m
			if code_data.n != DataGameObject.MISSING_DATA:
				data_game_obj.obj_destination_y = code_data.n
			if code_data.o != DataGameObject.MISSING_DATA:
				data_game_obj.obj_option = code_data.o
			_data_game_objects.append(data_game_obj)
		elif code_data.i == BlockType.TILE:
			var data_tile = DataGameTile.new()
			data_tile.pos = code_data.pos
			data_tile.block_id = code_data.e
			data_tile.tileset_offset = Vector2(code_data.j, code_data.k)
			_data_tiles.append(data_tile)
		elif code_data.i == BlockType.SPIKE:
			var data_spike = DataGameSpike.new()
			data_spike.pos = code_data.pos
			data_spike.spike_id = code_data.e
			data_spike.direction = code_data.l
			_data_spikes.append(data_spike)
		elif code_data.i == BlockType.LADDER:
			var data_ladder = DataGameLadder.new()
			data_ladder.pos = code_data.pos
			data_ladder.ladder_id = code_data.e
			_data_ladders.append(data_ladder)
		
	if code_data is TempBossCodeData:
		var data_boss = DataGameBoss.new()
		data_boss.pos = Vector2(code_data._1xc, code_data._1yc)
		data_boss.primary_weak_enabled = code_data._1ga
		data_boss.primary_weak_wp_slot_id = code_data._1g
		data_boss.secondary_weak_enabled = code_data._1ha
		data_boss.secondary_weak_wp_slot_id = code_data._1h
		data_boss.immune_enabled = code_data._1i
		data_boss.immune_wp_slot_id = code_data._1j
		data_boss.drop_item_on_death = code_data._1ua
		data_boss.drop_item_id = code_data._1u
		data_boss.drop_wp_on_death = code_data._1va
		data_boss.drop_mode = code_data._1v
		data_boss.drop_wp_slot_id = code_data._1w
		data_boss.change_player_enabled = code_data._1xa
		data_boss.change_player_id = code_data._1x
		data_boss.music_category = code_data._1n
		data_boss.music_id = code_data._1o
		
		_data_bosses.append(data_boss)


#-------------------------------------------------
#      Connections
#-------------------------------------------------

#-------------------------------------------------
#      Private Methods
#-------------------------------------------------

# Convert a line of code like this:
# o3200,3008="9999.000000"
# ..into a dataset as follows:
# [x, y, value]
func _get_dataset_from_line_data(_line_data : String, _prefix_letter : String) -> PoolStringArray:
	var dataset : PoolStringArray
	
	_line_data = _line_data.replace(_prefix_letter, "")
	_line_data = _line_data.replace(",", ";")
	_line_data = _line_data.replace("=\"", ";")
	_line_data = _line_data.replace("\"", "")
	
	dataset = _line_data.split(";")
	
	return dataset

#-------------------------------------------------
#      Setters & Getters
#-------------------------------------------------

func get_data_game_level() -> DataGameLevel:
	return _data_game_level

func get_data_bosses() -> Array:
	return _data_bosses

func get_data_game_objects() -> Array:
	return _data_game_objects

func get_data_tiles() -> Array:
	return _data_tiles

func get_data_ladders() -> Array:
	return _data_ladders

func get_data_spikes() -> Array:
	return _data_spikes

func get_data_bgs() -> Array:
	return _data_bgs

func get_data_active_screen_positions() -> PoolVector2Array:
	return _data_active_screen_positions

func get_data_disconnected_hscreen_positions() -> PoolVector2Array:
	return _data_disconnected_hscreen_positions

func get_data_disconnected_vscreen_positions() -> PoolVector2Array:
	return _data_disconnected_vscreen_positions
