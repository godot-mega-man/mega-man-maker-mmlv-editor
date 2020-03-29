# Editor
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

#-------------------------------------------------
#      Constants
#-------------------------------------------------

#-------------------------------------------------
#      Properties
#-------------------------------------------------

onready var level = $Level
onready var main_camera = $MainCamera
onready var menu_bar = $CanvasLayer/Control/MenuPanel
onready var file_access_ctrl = $CanvasLayer/Control/FileAccessCtrl

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

func scroll_to_player_pos():
	var pos = level.get_player_position()
	
	if pos != Vector2.ZERO:
		main_camera.global_position = pos
		main_camera.reset_zoom()

#-------------------------------------------------
#      Connections
#-------------------------------------------------

func _on_MenuPanel_new_file() -> void:
	level.clear_level()
func _on_MenuPanel_opening_file() -> void:
	file_access_ctrl.open_file()
func _on_MenuPanel_saving_file() -> void:
	file_access_ctrl.save_file()
func _on_MenuPanel_saving_file_as() -> void:
	file_access_ctrl.save_file_as()
func _on_MenuPanel_opening_preferences() -> void:
	pass # Replace with function body.
func _on_MenuPanel_exiting() -> void:
	get_tree().quit()

func _on_MenuPanel_toggle_screen_grid() -> void:
	level.toggle_screen_grid()
func _on_MenuPanel_toggle_tile_grid() -> void:
	level.toggle_tile_grid()
func _on_MenuPanel_toggle_tiles() -> void:
	level.toggle_game_tile()
func _on_MenuPanel_toggle_backgrounds() -> void:
	level.toggle_game_bg_tile()
func _on_MenuPanel_toggle_objects() -> void:
	level.toggle_game_objects()
func _on_MenuPanel_toggle_active_screens() -> void:
	level.toggle_game_active_screens()
func _on_MenuPanel_toggle_ladders() -> void:
	level.toggle_game_ladder_tile()
func _on_MenuPanel_toggle_spikes() -> void:
	level.toggle_game_spike_tile()
func _on_MenuPanel_zoom_in() -> void:
	main_camera.zoom_in()
func _on_MenuPanel_zoom_out() -> void:
	main_camera.zoom_out()
func _on_MenuPanel_normal_zoom() -> void:
	main_camera.reset_zoom()

# ---

func _on_FileAccessCtrl_opened_file(dir, path) -> void:
	var load_result = level.load_level(dir, path)
	
	if load_result == OK:
		file_access_ctrl.update_current_level_path(dir, path)
	else:
		EditorLogBox.add_message("Load failed. Returned " + str(load_result), true)
		return
	
	$Scroll2PlayerPosDelayTimer.start()
	EditorLogBox.add_message("Loaded " + path)

func _on_FileAccessCtrl_saved_file(dir, path) -> void:
	level.save_level(dir, path)
	EditorLogBox.add_message("Level saved at " + path)

#New level
func _on_Level_cleared_level() -> void:
	file_access_ctrl.clear_current_level_path()

func _on_MenuPanel_view_menu_about_to_show() -> void:
	menu_bar.view_menu.get_popup().set_item_checked(
		MenuBar.ID_MENU_VIEW_SCREEN_GRID, level.game_grid.is_visible()
	)
	menu_bar.view_menu.get_popup().set_item_checked(
		MenuBar.ID_MENU_VIEW_TILE_GRID, level.game_tile_grid.is_visible()
	)
	menu_bar.view_menu.get_popup().set_item_checked(
		MenuBar.ID_MENU_VIEW_TILES, level.game_tilemap.is_visible()
	)
	menu_bar.view_menu.get_popup().set_item_checked(
		MenuBar.ID_MENU_VIEW_BACKGROUNDS, level.game_bg_tile.is_visible()
	)
	menu_bar.view_menu.get_popup().set_item_checked(
		MenuBar.ID_MENU_VIEW_OBJECTS, level.game_objects.is_visible()
	)
	menu_bar.view_menu.get_popup().set_item_checked(
		MenuBar.ID_MENU_VIEW_ACTIVE_SCREENS, level.game_active_screens.is_visible()
	)
	menu_bar.view_menu.get_popup().set_item_checked(
		MenuBar.ID_MENU_VIEW_LADDERS, level.game_ladder_tile.is_visible()
	)
	menu_bar.view_menu.get_popup().set_item_checked(
		MenuBar.ID_MENU_VIEW_SPIKES, level.game_spike_tile.is_visible()
	)

func _on_Scroll2PlayerPosDelayTimer_timeout() -> void:
	scroll_to_player_pos()

#-------------------------------------------------
#      Private Methods
#-------------------------------------------------

#-------------------------------------------------
#      Setters & Getters
#-------------------------------------------------




