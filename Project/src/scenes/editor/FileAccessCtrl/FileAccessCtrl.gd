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

signal file_update_detected

#-------------------------------------------------
#      Constants
#-------------------------------------------------

#-------------------------------------------------
#      Properties
#-------------------------------------------------

onready var open_file_dialog = $OpenFileDialog
onready var save_file_dialog = $SaveFileDialog
onready var file_update_checker = $FileUpdateChecker

var current_level_dir : String
var current_level_path : String
var recent_file_manager : RecentFileManager = RecentFileManager.new()

#-------------------------------------------------
#      Notifications
#-------------------------------------------------

func _ready() -> void:
	$OpenFileDialog.set_current_path(_get_mega_maker_path())
	$SaveFileDialog.set_current_path(_get_mega_maker_path())
	
	recent_file_manager.load_init_config()

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

func open_file_from_path(file_path : String):
	var dir : String = _get_dir_from_path(file_path)
	file_path = _validate_file_path(file_path)
	emit_signal("opened_file", dir, file_path)
	update_current_level_path(dir, file_path)
	update_file_checker_data()
	recent_file_manager.add(file_path)

func open_containing_folder():
	OS.shell_open(_get_mega_maker_path())

func save_file():
	if is_new_file():
		$SaveFileDialog.popup()
		return
	
	emit_signal("saved_file", save_file_dialog.current_dir, current_level_path)
	update_file_checker_data()

func save_file_as():
	$SaveFileDialog.popup()

func reload():
	emit_signal("opened_file", current_level_dir, current_level_path)
	update_file_checker_data()

func update_current_level_path(dir : String, path : String) -> void:
	current_level_dir = dir
	current_level_path = path

func clear_current_level_path():
	current_level_dir = ""
	current_level_path = ""
	
	file_update_checker.clear_data()

func update_file_checker_data():
	file_update_checker.set_current_file_path(current_level_path)
	file_update_checker.set_current_file_directory(current_level_dir)
	file_update_checker.update_current_modified_time()

func is_new_file() -> bool:
	return current_level_dir.empty() or current_level_path.empty()

#-------------------------------------------------
#      Connections
#-------------------------------------------------

func _on_OpenFileDialog_file_selected(path: String) -> void:
	emit_signal("opened_file", open_file_dialog.current_dir, path)
	update_current_level_path(open_file_dialog.current_dir, path)
	update_file_checker_data()
	recent_file_manager.add(path)

func _on_SaveFileDialog_file_selected(path: String) -> void:
	emit_signal("saved_file", save_file_dialog.current_dir, path)
	update_current_level_path(open_file_dialog.current_dir, path)
	update_file_checker_data()

func _on_FileUpdateChecker_detected() -> void:
	emit_signal("file_update_detected")

#-------------------------------------------------
#      Private Methods
#-------------------------------------------------

func _get_mega_maker_path() -> String:
	var user = OS.get_user_data_dir().split("/")[2]
	
	return "C:/Users/" + user + "/AppData/Local/MegaMaker/Levels/"

func _get_dir_from_path(file_path : String) -> String:
	var dirs : PoolStringArray = file_path.replace("/", "\\").split("\\")
	var result : String
	
	# Replace drive name from the first set such as C: with an empty space
	dirs.remove(0)
	dirs.insert(0, " ")
	
	# Remove the last elem which is a file name and extension
	dirs.remove(dirs.size() - 1)
	
	result = dirs.join("/")
	result = result.strip_edges(true, false)
	
	result
	
	return result

func _validate_file_path(file_path : String) -> String:
	return file_path.replace("\\", "/")

#-------------------------------------------------
#      Setters & Getters
#-------------------------------------------------
