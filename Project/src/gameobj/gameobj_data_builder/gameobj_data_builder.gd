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

func get_level_data(file_data : String) -> Array:
	return []

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
