# MenuBar
# Written by: First

extends Panel

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

signal new_file
signal opening_file
signal saving_file
signal saving_file_as
signal opening_preferences
signal exiting

#-------------------------------------------------
#      Constants
#-------------------------------------------------

const ID_MENU_FILE_NEW = 0
const ID_MENU_FILE_OPEN = 1
const ID_MENU_FILE_SAVE = 2
const ID_MENU_FILE_SAVE_AS = 3
const ID_MENU_FILE_PREFERENCES = 4
const ID_MENU_FILE_EXIT = 5

const ID_MENU_EDIT_UNDO = 0
const ID_MENU_EDIT_REDO = 1
const ID_MENU_EDIT_CUT = 2
const ID_MENU_EDIT_COPY = 3
const ID_MENU_EDIT_PASTE = 4
const ID_MENU_EDIT_DELETE = 5

const ID_MENU_VIEW_SCREEN_GRID = 0
const ID_MENU_VIEW_TILE_GRID = 1
const ID_MENU_VIEW_TILES = 2
const ID_MENU_VIEW_BACKGROUNDS = 3
const ID_MENU_VIEW_OBJECTS = 4
const ID_MENU_VIEW_ACTIVE_SCREENS = 5
const ID_MENU_VIEW_LADDERS = 6
const ID_MENU_VIEW_SPIKES = 7
const ID_MENU_VIEW_ZOOM_IN = 8
const ID_MENU_VIEW_ZOOM_OUT = 9
const ID_MENU_VIEW_NORMAL_ZOOM = 10

const ID_MENU_HELP_README = 0
const ID_MENU_HELP_ABOUT = 1

#-------------------------------------------------
#      Properties
#-------------------------------------------------

export (ShortCut) var shortcut_file_new
export (ShortCut) var shortcut_file_open
export (ShortCut) var shortcut_file_save
export (ShortCut) var shortcut_file_save_as
export (ShortCut) var shortcut_file_exit

export (ShortCut) var shortcut_edit_undo
export (ShortCut) var shortcut_edit_redo
export (ShortCut) var shortcut_edit_cut
export (ShortCut) var shortcut_edit_copy
export (ShortCut) var shortcut_edit_paste
export (ShortCut) var shortcut_edit_delete

export (ShortCut) var shortcut_view_zoom_in
export (ShortCut) var shortcut_view_zoom_out
export (ShortCut) var shortcut_view_zoom_reset
export (ShortCut) var shortcut_view_tile_grid
export (ShortCut) var shortcut_view_tiles
export (ShortCut) var shortcut_view_backgrounds
export (ShortCut) var shortcut_view_objects
export (ShortCut) var shortcut_view_active_screens
export (ShortCut) var shortcut_view_ladders
export (ShortCut) var shortcut_view_spikes

onready var file_menu = $MenuBarHBox/FileMenu
onready var edit_menu = $MenuBarHBox/EditMenu
onready var view_menu = $MenuBarHBox/ViewMenu
onready var help_menu = $MenuBarHBox/HelpMenu

#-------------------------------------------------
#      Notifications
#-------------------------------------------------

func _ready() -> void:
	_init_file_menus()
	_init_edit_menus()
	_init_view_menus()
	_init_help_menus()

#-------------------------------------------------
#      Virtual Methods
#-------------------------------------------------

#-------------------------------------------------
#      Override Methods
#-------------------------------------------------

#-------------------------------------------------
#      Public Methods
#-------------------------------------------------

func _init_file_menus():
	file_menu.get_popup().connect("id_pressed", self, "_on_file_menu_popup_pressed")
	
	file_menu.get_popup().add_item("New Level", ID_MENU_FILE_NEW)
	file_menu.get_popup().set_item_shortcut(ID_MENU_FILE_NEW, shortcut_file_new, true)
	
	file_menu.get_popup().add_item("Open...", ID_MENU_FILE_OPEN)
	file_menu.get_popup().set_item_shortcut(ID_MENU_FILE_OPEN, shortcut_file_open, true)
	
	file_menu.get_popup().add_separator()
	
	file_menu.get_popup().add_item("Save", ID_MENU_FILE_SAVE)
	file_menu.get_popup().set_item_shortcut(ID_MENU_FILE_SAVE + 1, shortcut_file_save, true)
	
	file_menu.get_popup().add_item("Save As...", ID_MENU_FILE_SAVE_AS)
	file_menu.get_popup().set_item_shortcut(ID_MENU_FILE_SAVE_AS + 1, shortcut_file_save_as, true)
	
	file_menu.get_popup().add_separator()
	
	file_menu.get_popup().add_item("Preferences...", ID_MENU_FILE_PREFERENCES)
	
	file_menu.get_popup().add_separator()
	
	file_menu.get_popup().add_item("Exit", ID_MENU_FILE_EXIT)
	file_menu.get_popup().set_item_shortcut(ID_MENU_FILE_EXIT + 3, shortcut_file_exit, true)

func _init_edit_menus():
	edit_menu.get_popup().connect("id_pressed", self, "_on_edit_menu_popup_pressed")
	
	edit_menu.get_popup().add_item("Undo", ID_MENU_EDIT_UNDO)
	edit_menu.get_popup().set_item_shortcut(ID_MENU_EDIT_UNDO, shortcut_edit_undo, true)
	
	edit_menu.get_popup().add_item("Redo", ID_MENU_EDIT_REDO)
	edit_menu.get_popup().set_item_shortcut(ID_MENU_EDIT_REDO, shortcut_edit_redo, true)
	
	edit_menu.get_popup().add_separator()
	
	edit_menu.get_popup().add_item("Cut", ID_MENU_EDIT_CUT)
	edit_menu.get_popup().set_item_shortcut(ID_MENU_EDIT_CUT + 1, shortcut_edit_cut, true)
	
	edit_menu.get_popup().add_item("Copy", ID_MENU_EDIT_COPY)
	edit_menu.get_popup().set_item_shortcut(ID_MENU_EDIT_COPY + 1, shortcut_edit_copy, true)
	
	edit_menu.get_popup().add_item("Paste", ID_MENU_EDIT_PASTE)
	edit_menu.get_popup().set_item_shortcut(ID_MENU_EDIT_PASTE + 1, shortcut_edit_paste, true)
	
	edit_menu.get_popup().add_item("Delete", ID_MENU_EDIT_DELETE)
	edit_menu.get_popup().set_item_shortcut(ID_MENU_EDIT_DELETE + 1, shortcut_edit_delete, true)

func _init_view_menus():
	view_menu.get_popup().connect("id_pressed", self, "_on_view_menu_popup_pressed")
	
	view_menu.get_popup().add_check_item("Screen Grid", ID_MENU_VIEW_SCREEN_GRID)
	
	view_menu.get_popup().add_check_item("Tile Grid", ID_MENU_VIEW_TILE_GRID)
	view_menu.get_popup().set_item_shortcut(ID_MENU_VIEW_TILE_GRID, shortcut_view_tile_grid, true)
	
	view_menu.get_popup().add_separator()
	
	view_menu.get_popup().add_check_item("Tiles", ID_MENU_VIEW_TILES)
	view_menu.get_popup().set_item_shortcut(ID_MENU_VIEW_TILES + 1, shortcut_view_tiles, true)
	
	view_menu.get_popup().add_check_item("Backgrounds", ID_MENU_VIEW_BACKGROUNDS)
	view_menu.get_popup().set_item_shortcut(ID_MENU_VIEW_BACKGROUNDS + 1, shortcut_view_backgrounds, true)
	
	view_menu.get_popup().add_check_item("Objects", ID_MENU_VIEW_OBJECTS)
	view_menu.get_popup().set_item_shortcut(ID_MENU_VIEW_OBJECTS + 1, shortcut_view_objects, true)
	
	view_menu.get_popup().add_check_item("Active Screens", ID_MENU_VIEW_ACTIVE_SCREENS)
	view_menu.get_popup().set_item_shortcut(ID_MENU_VIEW_ACTIVE_SCREENS + 1, shortcut_view_active_screens, true)
	
	view_menu.get_popup().add_check_item("Ladders", ID_MENU_VIEW_LADDERS)
	view_menu.get_popup().set_item_shortcut(ID_MENU_VIEW_LADDERS + 1, shortcut_view_ladders, true)
	
	view_menu.get_popup().add_check_item("Spikes", ID_MENU_VIEW_SPIKES)
	view_menu.get_popup().set_item_shortcut(ID_MENU_VIEW_SPIKES + 1, shortcut_view_spikes, true)
	
	view_menu.get_popup().add_separator()
	
	view_menu.get_popup().add_item("Zoom In", ID_MENU_VIEW_ZOOM_IN)
	view_menu.get_popup().set_item_shortcut(ID_MENU_VIEW_ZOOM_IN + 2, shortcut_view_zoom_in, true)
	
	view_menu.get_popup().add_item("Zoom Out", ID_MENU_VIEW_ZOOM_OUT)
	view_menu.get_popup().set_item_shortcut(ID_MENU_VIEW_ZOOM_OUT + 2, shortcut_view_zoom_out, true)
	
	view_menu.get_popup().add_item("Reset Zoom", ID_MENU_VIEW_NORMAL_ZOOM)
	view_menu.get_popup().set_item_shortcut(ID_MENU_VIEW_NORMAL_ZOOM + 2, shortcut_view_zoom_reset, true)

func _init_help_menus():
	help_menu.get_popup().connect("id_pressed", self, "_on_help_menu_popup_pressed")
	help_menu.get_popup().add_item("Read Me", ID_MENU_HELP_README)
	
	help_menu.get_popup().add_separator()
	
	help_menu.get_popup().add_item("About", ID_MENU_HELP_ABOUT)
	


#-------------------------------------------------
#      Connections
#-------------------------------------------------

#Connected from _init_file_menu()
func _on_file_menu_popup_pressed(id : int) -> void:
	match id:
		ID_MENU_FILE_NEW:
			emit_signal("new_file")
		ID_MENU_FILE_OPEN:
			emit_signal("opening_file")
		ID_MENU_FILE_SAVE:
			emit_signal("saving_file")
		ID_MENU_FILE_SAVE_AS:
			emit_signal("saving_file_as")
		ID_MENU_FILE_PREFERENCES:
			pass
		ID_MENU_FILE_EXIT:
			emit_signal("exiting")

#Connected from _init_edit_menu()
func _on_edit_menu_popup_pressed(id : int) -> void:
	pass

#Connected from _init_view_menu()
func _on_view_menu_popup_pressed(id : int) -> void:
	pass

#Connected from _init_help_menu()
func _on_help_menu_popup_pressed(id : int) -> void:
	pass

#-------------------------------------------------
#      Private Methods
#-------------------------------------------------

#-------------------------------------------------
#      Setters & Getters
#-------------------------------------------------
