# FileAccessCtrl
# Written by: First

extends Control

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

signal opened_file(dir, path)

signal saved_file(dir, path)

#-------------------------------------------------
#      Constants
#-------------------------------------------------

#-------------------------------------------------
#      Properties
#-------------------------------------------------

onready var open_file_dialog = $OpenFileDialog
onready var save_file_dialog = $SaveFileDialog

var current_level_dir : String
var current_level_path : String

#-------------------------------------------------
#      Notifications
#-------------------------------------------------

func _ready() -> void:
	$OpenFileDialog.set_current_path(_get_mega_maker_path())
	$SaveFileDialog.set_current_path(_get_mega_maker_path())

#-------------------------------------------------
#      Virtual Methods
#-------------------------------------------------

#-------------------------------------------------
#      Override Methods
#-------------------------------------------------

#-------------------------------------------------
#      Public Methods
#-------------------------------------------------

func open_file():
	$OpenFileDialog.popup()

func save_file():
	if current_level_dir.empty() or current_level_path.empty():
		$SaveFileDialog.popup()
		return
	
	emit_signal("saved_file", save_file_dialog.current_dir, save_file_dialog.current_path)

func save_file_as():
	$SaveFileDialog.popup()

func update_current_level_path(dir : String, path : String) -> void:
	current_level_dir = dir
	current_level_path = path

func clear_current_level_path():
	current_level_dir = ""
	current_level_path = ""

#-------------------------------------------------
#      Connections
#-------------------------------------------------

func _on_OpenFileDialog_file_selected(path: String) -> void:
	emit_signal("opened_file", open_file_dialog.current_dir, path)

func _on_SaveFileDialog_file_selected(path: String) -> void:
	emit_signal("saved_file", save_file_dialog.current_dir, path)

#-------------------------------------------------
#      Private Methods
#-------------------------------------------------

func _get_mega_maker_path() -> String:
	var user = OS.get_user_data_dir().split("/")[2]
	
	return "C:/Users/" + user + "/AppData/Local/MegaMaker/Levels/"

#-------------------------------------------------
#      Setters & Getters
#-------------------------------------------------

