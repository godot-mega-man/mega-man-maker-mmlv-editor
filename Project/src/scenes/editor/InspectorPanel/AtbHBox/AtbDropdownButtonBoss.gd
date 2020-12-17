# AtbDropdownButtonBoss
# Written by: 

extends AtbDropdownButton

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

signal selected(id)

#-------------------------------------------------
#      Constants
#-------------------------------------------------

const BUTTON_RECT_MINSIZE = Vector2(64, 64)

#-------------------------------------------------
#      Properties
#-------------------------------------------------

onready var data_portrait_texture = $PopupPanel/Control/VBox/CurrDataHBox/PortraitTexture
onready var data_info_label = $PopupPanel/Control/VBox/CurrDataHBox/InfoLabel
onready var scroll_container = $PopupPanel/Control/VBox/ScrollContainer
onready var grid_container = $PopupPanel/Control/VBox/ScrollContainer/GridContainer


# {
#	BaseButtonCallback : {"id" : String}, ...
# }
var map_button_ids : Dictionary

#-------------------------------------------------
#      Notifications
#-------------------------------------------------

func _ready() -> void:
	_create_portrait_buttons()

#-------------------------------------------------
#      Virtual Methods
#-------------------------------------------------

#-------------------------------------------------
#      Override Methods
#-------------------------------------------------

#-------------------------------------------------
#      Public Methods
#-------------------------------------------------

func set_curr_data_from_id(id):
	hint_tooltip = GameBossPortraitData.get_portrait_info_text(id) + "\n\n" + "Click to select a boss portrait."
	data_portrait_texture.texture = GameBossPortraitData.get_portrait_texture(id)
	data_info_label.text = GameBossPortraitData.get_portrait_info_text(id)

func reset_popup_vscroll():
	scroll_container.scroll_vertical = 0

#-------------------------------------------------
#      Connections
#-------------------------------------------------

# Connect from _create_portrait_buttons()
func _on_Button_pressed_from(button):
	_button_pressed_from(button)

func _on_PopupPanel_about_to_show() -> void:
	reset_popup_vscroll()

#-------------------------------------------------
#      Private Methods
#-------------------------------------------------

func _create_portrait_buttons():
	for id in GameBossPortraitData.DATA.keys():
		if id == GameBossPortraitData.UNKNOWN_ID:
			continue
		
		var boss_name = GameBossPortraitData.DATA.get(id)["name"]
		var boss_texture = GameBossPortraitData.DATA.get(id)["texture"]
		var button = TextureButtonCallback.new()
		
		grid_container.add_child(button)
		button.hint_tooltip = GameBossPortraitData.get_portrait_info_text(id)
		button.texture_normal = boss_texture
		button.rect_min_size = BUTTON_RECT_MINSIZE
		button.mouse_default_cursor_shape = Control.CURSOR_POINTING_HAND
		button.expand = true
		button.connect("pressed_from", self, "_on_Button_pressed_from")
		
		# Map button callback
		map_button_ids[button] = id

func _get_id_from_button(button) -> String:
	return map_button_ids[button]

func _button_pressed_from(button):
	var id = _get_id_from_button(button)
	set_curr_data_from_id(id)
	emit_signal("selected", id)
	
	popup_panel.hide()

#-------------------------------------------------
#      Setters & Getters
#-------------------------------------------------
