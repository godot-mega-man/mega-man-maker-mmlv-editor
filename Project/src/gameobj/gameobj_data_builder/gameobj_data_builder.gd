# Script_Name_Here
# Written by: 

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

#-------------------------------------------------
#      Properties
#-------------------------------------------------

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

func get_game_level_data(file_data : String) -> DataGameLevel:
	var _data_array : PoolStringArray = file_data.split("\n")
	var result = DataGameLevel.new()
	
	for idx in _data_array.size():
		var _line : String = _data_array[idx]
		var _dataset : PoolStringArray
		
		match _data_array[idx].left(2):
			"0a": #User id
				_dataset = _get_dataset_from_line_data(_data_array[idx], "0a")
				result.user_id = float(_dataset[1])
			"0v": #Level version
				_dataset = _get_dataset_from_line_data(_data_array[idx], "0v")
				result.level_version = str(_dataset[1])
			"1a": #Level name
				_dataset = _get_dataset_from_line_data(_data_array[idx], "1a")
				result.level_name = str(_dataset[1])
			"4a": #Username
				_dataset = _get_dataset_from_line_data(_data_array[idx], "4a")
				result.user_name = str(_dataset[1])
			"4b": #User icon (portrait)
				_dataset = _get_dataset_from_line_data(_data_array[idx], "4b")
				result.user_icon_id = float(_dataset[1])
			"1b": #Sliding
				_dataset = _get_dataset_from_line_data(_data_array[idx], "1b")
				result.sliding = float(_dataset[1])
			"1c": #Charge shot enabled
				_dataset = _get_dataset_from_line_data(_data_array[idx], "1c")
				result.charge_shot_enable = float(_dataset[1])
			"1d": #Charge shot type
				_dataset = _get_dataset_from_line_data(_data_array[idx], "1d")
				result.charge_shot_type = float(_dataset[1])
			"1e": #Default bg color id
				_dataset = _get_dataset_from_line_data(_data_array[idx], "1e")
				result.default_background_color = float(_dataset[1])
			"1f": #Boss portrait
				_dataset = _get_dataset_from_line_data(_data_array[idx], "1f")
				result.boss_portrait = float(_dataset[1])
			"1k": #Weapon slots
				_dataset = _get_dataset_from_line_data(_data_array[idx], "1k")
				result.weapons[int(_dataset[0])] = float(_dataset[1])
			"1l": #Level track ID
				_dataset = _get_dataset_from_line_data(_data_array[idx], "1l")
				result.default_background_color = float(_dataset[1])
			"1m": #Level music (game number)
				_dataset = _get_dataset_from_line_data(_data_array[idx], "1m")
				result.default_background_color = float(_dataset[1])
			"1p": #Default bg color id
				_dataset = _get_dataset_from_line_data(_data_array[idx], "1p")
				result.val_p = float(_dataset[1])
			"1q": #Default bg color id
				_dataset = _get_dataset_from_line_data(_data_array[idx], "1q")
				result.val_q = float(_dataset[1])
			"1r": #Default bg color id
				_dataset = _get_dataset_from_line_data(_data_array[idx], "1r")
				result.val_r = float(_dataset[1])
			"1s": #Default bg color id
				_dataset = _get_dataset_from_line_data(_data_array[idx], "1s")
				result.val_s = float(_dataset[1])
	
	return result

func get_gameobj_data(file_data : String) -> Array:
	var _data_array : PoolStringArray = file_data.split("\n")
	var result : Array
	
	for idx in _data_array.size():
		var _line : String = _data_array[idx]
		
		if not _line.begins_with("o"):
			continue
		
		#Start creating
		
		var _data_gameobj = DataGameObject.new()
		var idx2 = idx
		
		while(idx2 < idx + 12):
			var _dataset : PoolStringArray
			
			match _data_array[idx2].left(1):
				"o":
					_dataset = _get_dataset_from_line_data(_data_array[idx2], "o")
					_data_gameobj.pos = Vector2(float(_dataset[0]), float(_dataset[1]))
				"b":
					_dataset = _get_dataset_from_line_data(_data_array[idx2], "b")
					_data_gameobj.obj_vector_x = float(_dataset[2])
				"c":
					_dataset = _get_dataset_from_line_data(_data_array[idx2], "c")
					_data_gameobj.obj_vector_y = float(_dataset[2])
				"d":
					_dataset = _get_dataset_from_line_data(_data_array[idx2], "d")
					_data_gameobj.obj_type = float(_dataset[2])
				"e":
					_dataset = _get_dataset_from_line_data(_data_array[idx2], "e")
					_data_gameobj.obj_id = float(_dataset[2])
				"f":
					_dataset = _get_dataset_from_line_data(_data_array[idx2], "f")
					_data_gameobj.obj_appearance = float(_dataset[2])
				"h":
					_dataset = _get_dataset_from_line_data(_data_array[idx2], "h")
					_data_gameobj.obj_timer = float(_dataset[2])
				_:
					break
			
			idx2 += 1
		
		result.append(_data_gameobj)
	
	return result

func get_tile_data(file_data : String) -> Array:
	var _data_array : PoolStringArray = file_data.split("\n")
	var result : Array
	
	for idx in _data_array.size():
		var _line : String = _data_array[idx]
		
		if not _line.begins_with("k"):
			continue
		
		#Start creating
		
		var _data_gametile = DataGameTile.new()
		var idx2 = idx
		
		while(idx2 < idx + 16):
			var _dataset : PoolStringArray
			
			match _data_array[idx2].left(1):
				"k":
					_dataset = _get_dataset_from_line_data(_data_array[idx2], "k")
					_data_gametile.pos = Vector2(float(_dataset[0]), float(_dataset[1]))
					_data_gametile.tileset_offset.y = float(_dataset[2])
				"j":
					_dataset = _get_dataset_from_line_data(_data_array[idx2], "j")
					_data_gametile.tileset_offset.x = float(_dataset[2])
				"e":
					_dataset = _get_dataset_from_line_data(_data_array[idx2], "e")
					_data_gametile.block_id = float(_dataset[2])
				"a":
					break
			
			idx2 += 1
		
		result.append(_data_gametile)
	
	return result

func get_bg_data(file_data : String) -> Array:
	var _data_array : PoolStringArray = file_data.split("\n")
	var result : Array
	
	for idx in _data_array.size():
		var _line : String = _data_array[idx]
		
		if not _line.begins_with("2d"):
			continue
		
		#Start creating
		
		var _data_gamebg = DataGameBg.new()
		var _dataset : PoolStringArray
		
		if _data_array[idx].left(2) == "2d":
			_dataset = _get_dataset_from_line_data(_data_array[idx], "2d")
			_data_gamebg.pos = Vector2(float(_dataset[0]), float(_dataset[1]))
			_data_gamebg.bg_id = float(_dataset[2])
		
		result.append(_data_gamebg)
	
	return result

func get_active_screens_data(file_data : String) -> PoolVector2Array:
	var _data_array : PoolStringArray = file_data.split("\n")
	var result : PoolVector2Array
	
	for idx in _data_array.size():
		var _line : String = _data_array[idx]
		
		if not _line.begins_with("2a"):
			continue
		
		#Start creating
		
		var _dataset : PoolStringArray
		
		if _data_array[idx].left(2) == "2a":
			_dataset = _get_dataset_from_line_data(_data_array[idx], "2a")
			result.append(Vector2(float(_dataset[0]), float(_dataset[1])))
	
	return result

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
