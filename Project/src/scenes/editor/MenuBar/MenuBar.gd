# MenuBar
# Written by: First

extends Panel

class_name MenuBar

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
signal opening_containing_folder
signal saving_file
signal saving_file_as
signal opening_config
signal opening_recent_file(id)
signal clearing_recent_files
signal exiting

signal undo
signal redo
signal cut
signal copy
signal paste
signal duplicate
signal delete

signal toggle_screen_grid
signal toggle_tile_grid
signal toggle_tiles
signal toggle_backgrounds
signal toggle_objects
signal toggle_active_screens
signal toggle_ladders
signal toggle_spikes
signal zoom_in
signal zoom_out
signal normal_zoom

signal view_help_list
signal check_for_updates
signal readme
signal release_notes
signal send_feedback
signal about

#Generic signals
signal file_menu_about_to_show
signal edit_menu_about_to_show
signal view_menu_about_to_show

#-------------------------------------------------
#      Constants
#-------------------------------------------------

const ID_MENU_FILE_NEW = 0
const ID_MENU_FILE_OPEN = 1
const ID_MENU_FILE_OPEN_CONTAINING_FOLDER = 2
const ID_MENU_FILE_SAVE = 4
const ID_MENU_FILE_SAVE_AS = 5
const ID_MENU_FILE_CONFIG = 7
const ID_MENU_FILE_RECENT = 9
const ID_MENU_FILE_EXIT = 11
const ID_MENU_FILE_RECENT_CLEAR = 99

const ID_MENU_EDIT_UNDO = 0
const ID_MENU_EDIT_REDO = 1
const ID_MENU_EDIT_CUT = 3
const ID_MENU_EDIT_COPY = 4
const ID_MENU_EDIT_PASTE = 5
const ID_MENU_EDIT_DUPLICATE = 6
const ID_MENU_EDIT_DELETE = 8

const ID_MENU_VIEW_SCREEN_GRID = 0
const ID_MENU_VIEW_TILE_GRID = 1
const ID_MENU_VIEW_TILES = 3
const ID_MENU_VIEW_BACKGROUNDS = 4
const ID_MENU_VIEW_OBJECTS = 5
const ID_MENU_VIEW_ACTIVE_SCREENS = 6
const ID_MENU_VIEW_LADDERS = 7
const ID_MENU_VIEW_SPIKES = 8
const ID_MENU_VIEW_ZOOM_IN = 10
const ID_MENU_VIEW_ZOOM_OUT = 11
const ID_MENU_VIEW_NORMAL_ZOOM = 12

const ID_MENU_HELP_VIEW_HELP_LIST = 0
const ID_MENU_HELP_CHECK_FOR_UPDATES = 1
const ID_MENU_HELP_README = 3
const ID_MENU_HELP_RELEASE_NOTES = 4
const ID_MENU_HELP_SEND_FEEDBACK = 5
const ID_MENU_HELP_ABOUT = 7

const FEEDBACK_URL = "https://forms.gle/wrFpgn6S6FcHCV2i8"
const RELEASE_NOTES_URL = "https://github.com/godot-mega-man/mega-man-maker-mmlv-editor/releases"

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
export (ShortCut) var shortcut_edit_duplicate
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

export (ShortCut) var shortcut_help_view_help_list

onready var file_menu := $MenuBarHBox/FileMenu as MenuButton
onready var edit_menu := $MenuBarHBox/EditMenu as MenuButton
onready var view_menu := $MenuBarHBox/ViewMenu as MenuButton
onready var help_menu := $MenuBarHBox/HelpMenu as MenuButton

onready var file_recent_popup_menu : PopupMenu

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

func update_recent_files(file_paths : PoolStringArray, max_item : int = 7):
	file_recent_popup_menu.clear()
	
	for f_path in file_paths:
		file_recent_popup_menu.add_item((f_path as String).get_file())
	if file_paths.empty():
		file_recent_popup_menu.add_item("-No Recent Files Found-")
		file_recent_popup_menu.set_item_disabled(0, true)
	
	file_recent_popup_menu.add_separator()
	file_recent_popup_menu.add_item("Clear Recent Files", ID_MENU_FILE_RECENT_CLEAR)

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
		ID_MENU_FILE_OPEN_CONTAINING_FOLDER:
			emit_signal("opening_containing_folder")
		ID_MENU_FILE_SAVE:
			emit_signal("saving_file")
		ID_MENU_FILE_SAVE_AS:
			emit_signal("saving_file_as")
		ID_MENU_FILE_CONFIG:
			emit_signal("opening_config")
		ID_MENU_FILE_RECENT:
			pass
		ID_MENU_FILE_EXIT:
			emit_signal("exiting")

#Connected from _init_edit_menu()
func _on_edit_menu_popup_pressed(id : int) -> void:
	match id:
		ID_MENU_EDIT_UNDO:
			emit_signal("undo")
		ID_MENU_EDIT_REDO:
			emit_signal("redo")
		ID_MENU_EDIT_DUPLICATE:
			emit_signal("duplicate")
		ID_MENU_EDIT_DELETE:
			emit_signal("delete")

#Connected from _init_view_menu()
func _on_view_menu_popup_pressed(id : int) -> void:
	match id:
		ID_MENU_VIEW_SCREEN_GRID:
			emit_signal("toggle_screen_grid")
		ID_MENU_VIEW_TILE_GRID:
			emit_signal("toggle_tile_grid")
		ID_MENU_VIEW_TILES:
			emit_signal("toggle_tiles")
		ID_MENU_VIEW_BACKGROUNDS:
			emit_signal("toggle_backgrounds")
		ID_MENU_VIEW_OBJECTS:
			emit_signal("toggle_objects")
		ID_MENU_VIEW_ACTIVE_SCREENS:
			emit_signal("toggle_active_screens")
		ID_MENU_VIEW_LADDERS:
			emit_signal("toggle_ladders")
		ID_MENU_VIEW_SPIKES:
			emit_signal("toggle_spikes")
		ID_MENU_VIEW_ZOOM_IN:
			emit_signal("zoom_in")
		ID_MENU_VIEW_ZOOM_OUT:
			emit_signal("zoom_out")
		ID_MENU_VIEW_NORMAL_ZOOM:
			emit_signal("normal_zoom")

#Connected from _init_help_menu()
func _on_help_menu_popup_pressed(id : int) -> void:
	match id:
		ID_MENU_HELP_VIEW_HELP_LIST:
			emit_signal("view_help_list")
		ID_MENU_HELP_CHECK_FOR_UPDATES:
			emit_signal("check_for_updates")
		ID_MENU_HELP_README:
			emit_signal("readme")
		ID_MENU_HELP_RELEASE_NOTES:
			OS.shell_open(RELEASE_NOTES_URL)
		ID_MENU_HELP_SEND_FEEDBACK:
			OS.shell_open(FEEDBACK_URL)
		ID_MENU_HELP_ABOUT:
			emit_signal("about")

func _on_file_recent_menu_popup_pressed(id : int) -> void:
	match id:
		ID_MENU_FILE_RECENT_CLEAR:
			emit_signal("clearing_recent_files")
		_:
			emit_signal("opening_recent_file", id)

# Connected from _init_file_menu()
func _on_file_menu_popup_about_to_show():
	emit_signal("file_menu_about_to_show")

#Connected from _init_edit_menu()
func _on_edit_menu_popup_about_to_show():
	emit_signal("edit_menu_about_to_show")

#Connected from _init_view_menu()
func _on_view_menu_popup_about_to_show():
	emit_signal("view_menu_about_to_show")

func _on_AboutButton_pressed() -> void:
	emit_signal("about")

#-------------------------------------------------
#      Private Methods
#-------------------------------------------------

func _init_file_menus():
	file_menu.get_popup().connect("id_pressed", self, "_on_file_menu_popup_pressed")
	file_menu.get_popup().connect("about_to_show", self, "_on_file_menu_popup_about_to_show")
	
	file_menu.get_popup().add_item("New Level", ID_MENU_FILE_NEW)
	file_menu.get_popup().set_item_shortcut(ID_MENU_FILE_NEW, shortcut_file_new, true)
	
	file_menu.get_popup().add_item("Open...", ID_MENU_FILE_OPEN)
	file_menu.get_popup().set_item_shortcut(ID_MENU_FILE_OPEN, shortcut_file_open, true)
	
	file_menu.get_popup().add_item("Open Containing Folder", ID_MENU_FILE_OPEN_CONTAINING_FOLDER)
	
	file_menu.get_popup().add_separator()
	
	file_menu.get_popup().add_item("Save", ID_MENU_FILE_SAVE)
	file_menu.get_popup().set_item_shortcut(ID_MENU_FILE_SAVE, shortcut_file_save, true)
	
	file_menu.get_popup().add_item("Save As...", ID_MENU_FILE_SAVE_AS)
	file_menu.get_popup().set_item_shortcut(ID_MENU_FILE_SAVE_AS, shortcut_file_save_as, true)
	
	file_menu.get_popup().add_separator()
	
	file_menu.get_popup().add_item("Configuration...", ID_MENU_FILE_CONFIG)
	
	file_menu.get_popup().add_separator()
	
	_create_recent_popup_menu()
	file_menu.get_popup().add_submenu_item("Recent Files...", "Recent", ID_MENU_FILE_RECENT)
	
	file_menu.get_popup().add_separator()
	
	file_menu.get_popup().add_item("Exit", ID_MENU_FILE_EXIT)
	file_menu.get_popup().set_item_shortcut(ID_MENU_FILE_EXIT, shortcut_file_exit, true)

func _init_edit_menus():
	edit_menu.get_popup().connect("id_pressed", self, "_on_edit_menu_popup_pressed")
	edit_menu.get_popup().connect("about_to_show", self, "_on_edit_menu_popup_about_to_show")
	
	edit_menu.get_popup().add_item("Undo", ID_MENU_EDIT_UNDO)
	edit_menu.get_popup().set_item_shortcut(ID_MENU_EDIT_UNDO, shortcut_edit_undo, true)
	
	edit_menu.get_popup().add_item("Redo", ID_MENU_EDIT_REDO)
	edit_menu.get_popup().set_item_shortcut(ID_MENU_EDIT_REDO, shortcut_edit_redo, true)
	
	edit_menu.get_popup().add_separator()
	
	edit_menu.get_popup().add_item("Cut", ID_MENU_EDIT_CUT)
	edit_menu.get_popup().set_item_shortcut(ID_MENU_EDIT_CUT, shortcut_edit_cut, true)
	edit_menu.get_popup().set_item_disabled(ID_MENU_EDIT_CUT, true) #TODO:ImplementThis
	
	edit_menu.get_popup().add_item("Copy", ID_MENU_EDIT_COPY)
	edit_menu.get_popup().set_item_shortcut(ID_MENU_EDIT_COPY, shortcut_edit_copy, true)
	edit_menu.get_popup().set_item_disabled(ID_MENU_EDIT_COPY, true) #TODO:ImplementThis
	
	edit_menu.get_popup().add_item("Paste", ID_MENU_EDIT_PASTE)
	edit_menu.get_popup().set_item_shortcut(ID_MENU_EDIT_PASTE, shortcut_edit_paste, true)
	edit_menu.get_popup().set_item_disabled(ID_MENU_EDIT_PASTE, true) #TODO:ImplementThis
	
	edit_menu.get_popup().add_item("Duplicate", ID_MENU_EDIT_DUPLICATE)
	edit_menu.get_popup().set_item_shortcut(ID_MENU_EDIT_DUPLICATE, shortcut_edit_duplicate, true)
	
	edit_menu.get_popup().add_separator()
	
	edit_menu.get_popup().add_item("Delete", ID_MENU_EDIT_DELETE)
	edit_menu.get_popup().set_item_shortcut(ID_MENU_EDIT_DELETE, shortcut_edit_delete, true)

func _init_view_menus():
	view_menu.get_popup().connect("id_pressed", self, "_on_view_menu_popup_pressed")
	view_menu.get_popup().connect("about_to_show", self, "_on_view_menu_popup_about_to_show")
	
	view_menu.get_popup().add_check_item("Screen Grid", ID_MENU_VIEW_SCREEN_GRID)
	
	view_menu.get_popup().add_check_item("Tile Grid", ID_MENU_VIEW_TILE_GRID)
	view_menu.get_popup().set_item_shortcut(ID_MENU_VIEW_TILE_GRID, shortcut_view_tile_grid, true)
	
	view_menu.get_popup().add_separator()
	
	view_menu.get_popup().add_check_item("Tiles", ID_MENU_VIEW_TILES)
	view_menu.get_popup().set_item_shortcut(ID_MENU_VIEW_TILES, shortcut_view_tiles, true)
	
	view_menu.get_popup().add_check_item("Backgrounds", ID_MENU_VIEW_BACKGROUNDS)
	view_menu.get_popup().set_item_shortcut(ID_MENU_VIEW_BACKGROUNDS, shortcut_view_backgrounds, true)
	
	view_menu.get_popup().add_check_item("Objects", ID_MENU_VIEW_OBJECTS)
	view_menu.get_popup().set_item_shortcut(ID_MENU_VIEW_OBJECTS, shortcut_view_objects, true)
	
	view_menu.get_popup().add_check_item("Active Screens", ID_MENU_VIEW_ACTIVE_SCREENS)
	view_menu.get_popup().set_item_shortcut(ID_MENU_VIEW_ACTIVE_SCREENS, shortcut_view_active_screens, true)
	
	view_menu.get_popup().add_check_item("Ladders", ID_MENU_VIEW_LADDERS)
	view_menu.get_popup().set_item_shortcut(ID_MENU_VIEW_LADDERS, shortcut_view_ladders, true)
	
	view_menu.get_popup().add_check_item("Spikes", ID_MENU_VIEW_SPIKES)
	view_menu.get_popup().set_item_shortcut(ID_MENU_VIEW_SPIKES, shortcut_view_spikes, true)
	
	view_menu.get_popup().add_separator()
	
	view_menu.get_popup().add_item("Zoom In", ID_MENU_VIEW_ZOOM_IN)
	view_menu.get_popup().set_item_shortcut(ID_MENU_VIEW_ZOOM_IN, shortcut_view_zoom_in, true)
	
	view_menu.get_popup().add_item("Zoom Out", ID_MENU_VIEW_ZOOM_OUT)
	view_menu.get_popup().set_item_shortcut(ID_MENU_VIEW_ZOOM_OUT, shortcut_view_zoom_out, true)
	
	view_menu.get_popup().add_item("Reset Zoom", ID_MENU_VIEW_NORMAL_ZOOM)
	view_menu.get_popup().set_item_shortcut(ID_MENU_VIEW_NORMAL_ZOOM, shortcut_view_zoom_reset, true)

func _init_help_menus():
	help_menu.get_popup().connect("id_pressed", self, "_on_help_menu_popup_pressed")
	help_menu.get_popup().add_item("View Help List", ID_MENU_HELP_VIEW_HELP_LIST)
	help_menu.get_popup().set_item_shortcut(ID_MENU_HELP_VIEW_HELP_LIST, shortcut_help_view_help_list, true)
	
	help_menu.get_popup().add_item("Check For Updates...", ID_MENU_HELP_CHECK_FOR_UPDATES)
	
	help_menu.get_popup().add_separator()
	
	help_menu.get_popup().add_item("Read Me", ID_MENU_HELP_README)
	
	help_menu.get_popup().add_item("Release Notes", ID_MENU_HELP_RELEASE_NOTES)
	
	help_menu.get_popup().add_item("Send Us Feedback", ID_MENU_HELP_SEND_FEEDBACK)
	
	help_menu.get_popup().add_separator()
	
	help_menu.get_popup().add_item("About", ID_MENU_HELP_ABOUT)

func _create_recent_popup_menu():
	var popup_menu = PopupMenu.new()
	file_menu.get_popup().add_child(popup_menu)
	popup_menu.name = "Recent"
	popup_menu.connect("id_pressed", self, "_on_file_recent_menu_popup_pressed")
	file_recent_popup_menu = popup_menu

#-------------------------------------------------
#      Setters & Getters
#-------------------------------------------------
