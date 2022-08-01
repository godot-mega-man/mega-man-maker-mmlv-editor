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
const OUTPUT_SPIKE_TILESET_RES_NAME = "MMM Spike Tileset"
const OUTPUT_LADDER_TILESET_RES_NAME = "MMM Ladder Tileset"
const OUTPUT_BG_TILESET_RES_NAME = "MMM Bg Tileset"

const GEN_TITLE = "Tileset Generator"
const GEN_TILESET_SUCCESS_MSG = str(
	"Generated successfully!\n\n",
	"For the next step, you might want to save the output as a resource file to the assets folder.\n",
	"Please save the tileset as a resource file to res://assets/tilesets/ and assign it to a tilemap object GameTilemapDrawer.\n\n",
	"NOTE: Tileset Output might not be updated (visual bug?). You might need to click on it."
)
const GEN_SPIKE_TILESET_SUCCESS_MSG = str(
	"Generated successfully!\n\n",
	"Todo: Add instructions what to do next."
)
const GEN_LADDER_TILESET_SUCCESS_MSG = str(
	"Generated successfully!\n\n",
	"Todo: Add instructions what to do next."
)
const GEN_BG_TILESET_SUCCESS_MSG = str(
	"Generated successfully!\n\n",
	"For the next step, you might want to save the output as a resource file to the assets folder.\n",
	"Please save the tileset as a resource file to res://assets/bg/ and assign it to a tilemap object GameBgTilemapDrawer.\n\n",
	"NOTE: Tileset Output might not be updated (visual bug?). You might need to click on it."
)

#-------------------------------------------------
#      Properties
#-------------------------------------------------

export (TileSet) var tileset_output

export (bool) var create_tileset setget set_create_tileset
export (bool) var create_bg_tileset setget set_create_bg_tileset
export (bool) var create_spike_tileset setget set_create_spike_tileset
export (bool) var create_ladder_tileset setget set_create_ladder_tileset

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

func generate_tileset():
	tileset_output = TileSet.new()
	
	var idx_i : int = 0
	for i in GameTileSetData.TILESET_DATA.keys():
		#generate each subtiles
		var idx_j : int = 0
		for j in GameTileSetData.SUBTILE_POSITION_IDS.keys():
			tileset_output.create_tile(i * GameTileSetData.SUBTILE_COUNT + idx_j)
			tileset_output.tile_set_texture(i * GameTileSetData.SUBTILE_COUNT + idx_j, load("res://assets/images/tilesets/" + GameTileSetData.TILESET_DATA.get(i) + ".png"))
			tileset_output.tile_set_region(i * GameTileSetData.SUBTILE_COUNT + idx_j, Rect2(j + Vector2(-1, -1) + GameTileSetData.SUBTILE_TEXTURE_OFFSETS.get(i), Vector2(16, 16)))
			tileset_output.tile_set_name(i * GameTileSetData.SUBTILE_COUNT + idx_j, GameTileSetData.TILESET_DATA.get(i) + "_" + str(idx_j))
			
			idx_j +=1
		
		idx_i += 1
	
	tileset_output.resource_name = OUTPUT_TILESET_RES_NAME
	
	OS.alert(GEN_TILESET_SUCCESS_MSG, GEN_TITLE)

func generate_spike_tileset():
	tileset_output = TileSet.new()
	var idx_i : int = 0
	for i in GameSpikeData.SPIKE_DATA.keys():
		#generate each subtiles
		var idx_j : int = 0
		for j in GameSpikeData.SUBTILE_ID_POSITIONS.keys():
			tileset_output.create_tile(i * GameSpikeData.SPIKE_TILE_COUNT + idx_j)
			tileset_output.tile_set_texture(i * GameSpikeData.SPIKE_TILE_COUNT + idx_j, load("res://assets/images/spikes/" + GameSpikeData.SPIKE_DATA.get(i) + ".png"))
			tileset_output.tile_set_region(i * GameSpikeData.SPIKE_TILE_COUNT + idx_j, Rect2(GameSpikeData.SUBTILE_ID_POSITIONS.get(j) , Vector2(16, 16)))
			tileset_output.tile_set_name(i * GameSpikeData.SPIKE_TILE_COUNT + idx_j, GameSpikeData.SPIKE_DATA.get(i) + "_" + str(idx_j))
			
			idx_j +=1
		
		idx_i += 1
	
	tileset_output.resource_name = OUTPUT_SPIKE_TILESET_RES_NAME
	
	OS.alert(GEN_SPIKE_TILESET_SUCCESS_MSG, GEN_TITLE)

func generate_ladder_tileset():
	tileset_output = TileSet.new()
	
	for i in GameLadderData.LADDER_DATA.keys():
		tileset_output.create_tile(i)
		tileset_output.tile_set_texture(i, load("res://assets/images/ladders/" + GameLadderData.LADDER_DATA.get(i) + ".png"))
		tileset_output.tile_set_name(i, GameLadderData.LADDER_DATA.get(i) + "_" + str(i))
	
	tileset_output.resource_name = OUTPUT_LADDER_TILESET_RES_NAME
	
	OS.alert(GEN_LADDER_TILESET_SUCCESS_MSG, GEN_TITLE)

func generate_bg_tileset():
	tileset_output = TileSet.new()
	
	for i in GameBgData.BG_DATA.keys():
		tileset_output.create_tile(i)
		tileset_output.tile_set_texture(i, load("res://assets/images/bg/" + GameBgData.BG_DATA.get(i) + ".png"))
		tileset_output.tile_set_name(i, GameBgData.BG_DATA.get(i) + "_" + str(i))
	
	tileset_output.resource_name = OUTPUT_BG_TILESET_RES_NAME
	
	OS.alert(GEN_BG_TILESET_SUCCESS_MSG, GEN_TITLE)

#-------------------------------------------------
#      Connections
#-------------------------------------------------

#-------------------------------------------------
#      Private Methods
#-------------------------------------------------

#-------------------------------------------------
#      Setters & Getters
#-------------------------------------------------

func set_create_tileset(val : bool):
	if not val:
		return
	
	generate_tileset()

func set_create_bg_tileset(val : bool):
	if not val:
		return
	
	generate_bg_tileset()

func set_create_spike_tileset(val : bool):
	if not val:
		return
	
	generate_spike_tileset()

func set_create_ladder_tileset(val : bool):
	if not val:
		return
	
	generate_ladder_tileset()
