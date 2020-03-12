# TilesetGenerator
# Written by: First

tool
extends Node

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

const OUTPUT_TILESET_RES_NAME = "MMM Tileset"
const GEN_SUCCESS_TITLE = "Tileset Generator"
const GEN_SUCCESS_MSG = str(
	"Generated successfully!\n\n",
	"For the next step, you might want to save the output as a resource file to the assets folder.\n",
	"Please save the tileset as a resource file to res://assets/tilesets/ and assign it to a tilemap object GameTilemapDrawer.\n\n",
	"NOTE: Tileset Output might not be updated (visual bug?). You might need to click on it."
)

#-------------------------------------------------
#      Properties
#-------------------------------------------------

export (TileSet) var tileset_output

export (bool) var create setget set_create

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

func generate():
	tileset_output = TileSet.new()
	
	var idx_i : int = 0
	for i in GameTileSetData.TILESET_DATA.keys():
		#generate each subtiles
		var idx_j : int = 0
		for j in GameTileSetData.SUBTILE_POSITION_IDS.keys():
			tileset_output.create_tile(i * GameTileSetData.TILE_COUNT + idx_j)
			tileset_output.tile_set_texture(i * GameTileSetData.TILE_COUNT + idx_j, load("res://assets/images/tilesets/" + GameTileSetData.TILESET_DATA.get(i) + ".png"))
			tileset_output.tile_set_region(i * GameTileSetData.TILE_COUNT + idx_j, Rect2(j + Vector2(-1, -1) + GameTileSetData.SUBTILE_TEXTURE_OFFSETS.get(i), Vector2(16, 16)))
			tileset_output.tile_set_name(i * GameTileSetData.TILE_COUNT + idx_j, GameTileSetData.TILESET_DATA.get(i) + "_" + str(idx_j))
			
			idx_j +=1
		
		idx_i += 1
	
	tileset_output.resource_name = OUTPUT_TILESET_RES_NAME
	
	OS.alert(GEN_SUCCESS_MSG, GEN_SUCCESS_TITLE)

#-------------------------------------------------
#      Connections
#-------------------------------------------------

#-------------------------------------------------
#      Private Methods
#-------------------------------------------------

#-------------------------------------------------
#      Setters & Getters
#-------------------------------------------------

func set_create(val : bool):
	if not val:
		return
	
	generate()
	emit_signal("script_changed")
