# TilemapTab
# Written by: First

extends MainInspectorTab

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

signal tile_selected(tile_id)

#-------------------------------------------------
#      Constants
#-------------------------------------------------

const GRID_C_AUTO_RESIZER = preload("res://src/utils/GridContainerAutoResizer/GridContainerAutoResizer.tscn")
const GRID_C_NAME_PREFIX = "GridGameID"
const GAME_ID_LABEL_PREFIX = "MM"
const IMG_TEXTURE_BEGIN_PATH = "res://assets/images/tilesets/"
const BUTTON_SIZE = Vector2(32, 32)
const SUBTILE_REGION_POS = Vector2(141, 71)
const MARGIN_BOTTOM_BOX_MIN_SIZE = Vector2(0, 96)

#-------------------------------------------------
#      Properties
#-------------------------------------------------

onready var preview_texture_rect = $PreviewTextureRect
onready var preview_tex_anim = $PreviewTextureRect/ShowHideAnim
onready var preview_tex_label = $PreviewTextureRect/TilesetNameLabel
onready var subtile_button = $SubTilePanel/SubtileButton
onready var subtile_select_popup = $SubtileSelectPopup

var current_selected_tile_id : int
var current_subtile_id : int

#-------------------------------------------------
#      Notifications
#-------------------------------------------------

func _ready() -> void:
	_generate_ui()

#-------------------------------------------------
#      Virtual Methods
#-------------------------------------------------

#-------------------------------------------------
#      Override Methods
#-------------------------------------------------

#-------------------------------------------------
#      Public Methods
#-------------------------------------------------

#-------------------------------------------------
#      Connections
#-------------------------------------------------

func _on_tile_btn_pressed_id(tile_id : int, tile_texture : Texture): 
	current_selected_tile_id = tile_id * GameTileSetData.TILE_COUNT
	current_subtile_id = 0
	emit_signal("tile_selected", current_selected_tile_id + current_subtile_id)
	
	#Set subtile button texture
	subtile_button.icon = tile_texture
	
	#Set subtile preview texture
	if tile_texture is AtlasTexture:
		subtile_select_popup.set_preview_texture(tile_texture.atlas)

func _on_tile_btn_mouse_entered_btn(texture : Texture, tileset_name : String):
	preview_tex_anim.play("Show")
	preview_tex_label.text = tileset_name
	if texture is AtlasTexture:
		preview_texture_rect.texture = texture.atlas

func _on_tile_btn_mouse_exited_btn(texture):
	preview_tex_anim.play("Hide")

func _on_SubtileButton_pressed() -> void:
	subtile_select_popup.popup()

func _on_SubtileSelectPopup_subtile_selected(tile_id) -> void:
	current_subtile_id = tile_id
	emit_signal("tile_selected", current_selected_tile_id + current_subtile_id)

#-------------------------------------------------
#      Private Methods
#-------------------------------------------------

func _generate_ui():
	_create_grid_containters()
	
	for i in GameTileSetData.TILESET_DATA.keys():
		_create_tile_button(
			GameTileSetData.TILESET_DATA.get(i),
			GameTileSetData.TILE_GAME_IDS.get(i),
			i #Tile ID
		)
	
	_add_margin_bottom_box()

func _create_tile_button(file_name : String, game_id : int, tile_id : int):
	var grid_c = vbox.get_node(GRID_C_NAME_PREFIX + str(game_id))
	var tex_btn := TileTextureButton.new()
	var atlas_tex = AtlasTexture.new()
	
	atlas_tex.atlas = load(IMG_TEXTURE_BEGIN_PATH + file_name + ".png")
	atlas_tex.region = Rect2(SUBTILE_REGION_POS, Vector2(16, 16))
	grid_c.add_child(tex_btn)
	tex_btn.expand = true
	tex_btn.texture_normal = atlas_tex
	tex_btn.rect_min_size = BUTTON_SIZE
	tex_btn.hint_tooltip = file_name
	tex_btn.mouse_default_cursor_shape = Control.CURSOR_POINTING_HAND
	tex_btn.connect("pressed_id", self, "_on_tile_btn_pressed_id")
	tex_btn.connect("mouse_entered_btn", self, "_on_tile_btn_mouse_entered_btn")
	tex_btn.connect("mouse_exited_btn", self, "_on_tile_btn_mouse_exited_btn")
	tex_btn.tile_id = tile_id
	tex_btn.tileset_name = file_name

func _create_grid_containters():
	var game_ids : Dictionary
	var sorted_game_ids : Array
	
	#Get all game ids and sort them
	for i in GameTileSetData.TILE_GAME_IDS.values():
		game_ids[i] = ""
	
	sorted_game_ids = game_ids.keys()
	sorted_game_ids.sort()
	
	for id in sorted_game_ids:
		var grid_c = GridContainer.new()
		var label_game_id = Label.new()
		var grid_auto_resizer = GRID_C_AUTO_RESIZER.instance()
		
		vbox.add_child(grid_c)
		grid_c.set_name(GRID_C_NAME_PREFIX + str(id))
		
		grid_c.add_child(grid_auto_resizer)
		grid_c.mouse_filter = Control.MOUSE_FILTER_IGNORE
		grid_c.get_parent().add_child(label_game_id)
		grid_c.raise()
		label_game_id.text = GAME_ID_LABEL_PREFIX + str(id)

func _add_margin_bottom_box():
	var ref_rect = ReferenceRect.new()
	vbox.add_child(ref_rect)
	ref_rect.rect_min_size = MARGIN_BOTTOM_BOX_MIN_SIZE

#-------------------------------------------------
#      Setters & Getters
#-------------------------------------------------
