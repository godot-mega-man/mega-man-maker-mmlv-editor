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

export (TileSet) var tts

export (bool) var upd setget set_upd

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

func test_gen():
	tts = TileSet.new()
	
	var idx_i : int = 0
	for i in GameTileSetData.TILESET_DATA.keys():
		
		#gen each subtile
		var idx_j : int = 0
		for j in GameTileSetData.SUBTILE_POSITION_IDS.keys():
			tts.create_tile(i + idx_j)
			tts.tile_set_texture(i + idx_j, load("res://assets/images/tilesets/" + GameTileSetData.TILESET_DATA.get(i) + ".png"))
			tts.tile_set_region(i + idx_j, Rect2(j, Vector2(16, 16)))
			
			idx_j +=1
		
		idx_i += 1
		
		#"tile_map.has(p_id)" is true. FIX THIS!
		#"tile_map.has(p_id)" is true. FIX THIS!
		#"tile_map.has(p_id)" is true. FIX THIS!
		#"tile_map.has(p_id)" is true. FIX THIS!
		#"tile_map.has(p_id)" is true. FIX THIS!
	
	OS.alert("Generated")

#-------------------------------------------------
#      Connections
#-------------------------------------------------

#-------------------------------------------------
#      Private Methods
#-------------------------------------------------

#-------------------------------------------------
#      Setters & Getters
#-------------------------------------------------


func set_upd(val : bool):
	if not val:
		return
	
	test_gen()
