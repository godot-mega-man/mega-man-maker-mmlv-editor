# SpikeTab

extends MainInspectorTab

"""
	Enter desc here.
"""

#-------------------------------------------------
#      Classes
#-------------------------------------------------

class SpikeButtonMap:
	extends Reference
	
	# Mapped nodes
	# {
	#     game_id : {
	#         title_label : Label,
	#         buttons : [TileTextureButton, TileTextureButton, TileTextureButton, ...]
	#     }, ...
	# }
	var buttons_map : Dictionary
	
	func map_button(button, game_id):
		game_id = str(game_id) # Casting
		
		if not buttons_map.has(game_id):
			buttons_map[game_id] = {}
		if not buttons_map[game_id].has("buttons"):
			buttons_map[game_id]["buttons"] = []
		
		(buttons_map[game_id]["buttons"] as Array).append(button)
	
	func map_title_label(label, game_id):
		game_id = str(game_id) # Casting
		
		if not buttons_map.has(game_id):
			buttons_map[game_id] = {}
		if not buttons_map[game_id].has("title_label"):
			buttons_map[game_id]["title_label"] = []
		
		buttons_map[game_id]["title_label"] = label
	
	# Makes node visible/invisible by an expression
	func filter(expression : String):
		for game_id in buttons_map.keys():
			var title_label = buttons_map[game_id]["title_label"]
			var has_one_visible : bool
			
			for btn in buttons_map[game_id]["buttons"]:
				btn = btn as TileTextureButton
				
				if expression.empty() or btn.tileset_name.matchn("*" + expression + "*"):
					btn.show()
					has_one_visible = true
				else:
					btn.hide()
			
			if has_one_visible:
				title_label.show()
			else:
				title_label.hide()

#-------------------------------------------------
#      Signals
#-------------------------------------------------

signal spike_selected(spike_id)

#-------------------------------------------------
#      Constants
#-------------------------------------------------

const BUTTON_PRESS_EFFECT = preload("res://src/utils/ButtonFx/PressFx/ButtonPressFx.tscn")
const GRID_C_AUTO_RESIZER = preload("res://src/utils/GridContainerAutoResizer/GridContainerAutoResizer.tscn")
const GRID_C_NAME_PREFIX = "GridGameID"
const GAME_ID_LABEL_PREFIX = "Mega Man "
const IMG_TEXTURE_BEGIN_PATH = "res://assets/images/spikes/"
const BUTTON_SIZE = Vector2(32, 32)
const SUBTILE_REGION_POS = Vector2(0, 0)
const MARGIN_BOTTOM_BOX_MIN_SIZE = Vector2(0, 96)

#-------------------------------------------------
#      Properties
#-------------------------------------------------

onready var search_lineedit = $VBox/SearchLineEdit
onready var search_lineedit_icon = $VBox/SearchLineEdit/Icon
onready var subtile_button = $SubtileSpikeButton
onready var subtile_select_popup = $SubtileSpikeSelectPopup

var current_selected_spike_id : int
var current_subtile_spike_id : int

var spike_btn_map : SpikeButtonMap = SpikeButtonMap.new()

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

func _on_spike_btn_pressed_id(tile_id : int, tile_texture : Texture):
	select_spike(tile_id) 

func _on_SearchLineEdit_text_changed(new_text: String) -> void:
	spike_btn_map.filter(new_text)
	search_lineedit_icon.visible = new_text.empty()

#-------------------------------------------------
#      Private Methods
#-------------------------------------------------

func _generate_ui():
	_create_grid_containters()
	
	for i in GameSpikeData.SPIKE_DATA.keys():
		_create_spike_button(
			GameSpikeData.SPIKE_DATA.get(i),
			GameSpikeData.SPIKE_GAME_IDS.get(i),
			i #Spike ID
		)
	
	_add_margin_bottom_box()

func _create_spike_button(file_name : String, game_id : int, spike_id : int):
	var grid_c = scrl_vbox.get_node(GRID_C_NAME_PREFIX + str(game_id))
	var tex_btn := TileTextureButton.new()
	
	var atlas_tex = get_atlas_from_tileset_texture(
		load(IMG_TEXTURE_BEGIN_PATH + file_name + ".png")
	)
	grid_c.add_child(tex_btn)
	tex_btn.expand = true
	tex_btn.texture_normal = atlas_tex
	tex_btn.rect_min_size = BUTTON_SIZE
	tex_btn.hint_tooltip = str(file_name, "\n", "ID: ", spike_id)
	tex_btn.mouse_default_cursor_shape = Control.CURSOR_POINTING_HAND
	tex_btn.connect("pressed_id", self, "_on_spike_btn_pressed_id")
	tex_btn.tile_id = spike_id
	tex_btn.tileset_name = file_name
	
	# Add button click effect.
	var button_eff = BUTTON_PRESS_EFFECT.instance()
	tex_btn.add_child(button_eff)
	
	# Map the newly created button to spike_btn_mapper
	spike_btn_map.map_button(tex_btn, game_id)

func _create_grid_containters():
	var game_ids : Dictionary
	var sorted_game_ids : Array
	
	#Get all game ids and sort them
	for i in GameSpikeData.SPIKE_GAME_IDS.values():
		game_ids[i] = ""
	
	sorted_game_ids = game_ids.keys()
	sorted_game_ids.sort()
	
	for id in sorted_game_ids:
		var grid_c = GridContainer.new()
		var label_game_id = Label.new()
		var grid_auto_resizer = GRID_C_AUTO_RESIZER.instance()
		grid_auto_resizer.content_fixed_width = BUTTON_SIZE.x + 6
		scrl_vbox.add_child(grid_c)
		grid_c.set_name(GRID_C_NAME_PREFIX + str(id))
		grid_c.add_child(grid_auto_resizer)
		grid_c.mouse_filter = Control.MOUSE_FILTER_IGNORE
		grid_c.get_parent().add_child(label_game_id)
		grid_c.raise()
		label_game_id.text = GAME_ID_LABEL_PREFIX + str(id)
		if id == 99:
			label_game_id.text = "Mega Man & Bass"
		if id == 100:
			label_game_id.text = "Mega Man Soccer"
		if id == 101:
			label_game_id.text = "Mega Man GB I"
		if id == 102:
			label_game_id.text = "Mega Man GB II"		
		if id == 103:
			label_game_id.text = "Mega Man GB III"
		if id == 104:
			label_game_id.text = "Mega Man GB IV"
		if id == 105:
			label_game_id.text = "Mega Man GB V"
		if id == 106:
			label_game_id.text = "Power Fighters"
		if id == 107:
			label_game_id.text = "Power Fighters 2"
		if id == 108:
			label_game_id.text = "Battle & Chase"
		if id == 109:
			label_game_id.text = "Wily Wars"
		if id == 120:
			label_game_id.text = "Misc"
		
		# Map the newly created title label to spike_btn_mapper
		spike_btn_map.map_title_label(label_game_id, id)
		
func get_texture(tile_id : int) -> StreamTexture:
	return load(IMG_TEXTURE_BEGIN_PATH.plus_file(GameSpikeData.SPIKE_DATA[tile_id]) + ".png") as StreamTexture

func select_spike(tile_id : int, subtile_id = 0):
	current_selected_spike_id = tile_id * GameSpikeData.SPIKE_TILE_COUNT
	current_subtile_spike_id = subtile_id
	emit_signal("spike_selected", current_selected_spike_id + current_subtile_spike_id)
	
	#Set subtile button texture
	subtile_button.icon = get_atlas_from_tileset_texture(get_texture(tile_id))
	
	#Set subtile preview
	subtile_select_popup.set_preview_texture(get_texture(tile_id))
	subtile_select_popup.set_spike_name(GameSpikeData.SPIKE_DATA[tile_id])
	subtile_select_popup.set_spike_id(tile_id)

func get_atlas_from_tileset_texture(texture : StreamTexture) -> AtlasTexture:
	var atlas_tex = AtlasTexture.new()
	atlas_tex.atlas = texture
	atlas_tex.region = Rect2(SUBTILE_REGION_POS, Vector2(16, 16))
	
	return atlas_tex

func _add_margin_bottom_box():
	var ref_rect = ReferenceRect.new()
	scrl_vbox.add_child(ref_rect)
	ref_rect.rect_min_size = MARGIN_BOTTOM_BOX_MIN_SIZE

func _on_SubtileSpikeButton_pressed() -> void:
	subtile_select_popup.popup()

func _on_SubtileSpikeSelectPopup_subtile_spike_selected(tile_id) -> void:
	current_subtile_spike_id = tile_id
	emit_signal("spike_selected", current_selected_spike_id + current_subtile_spike_id)
	print_debug("spike_selected_debug: " + str(current_selected_spike_id) + " " + str(current_subtile_spike_id))
	
#-------------------------------------------------
#      Setters & Getters
#-------------------------------------------------

