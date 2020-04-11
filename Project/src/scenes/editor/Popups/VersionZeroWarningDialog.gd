# VersionZeroWarningDialog
# Written by: First

extends AcceptDialog

#class_name optional

"""
	Automatically popups or queue free at the start.
	Popups when the version of the project is zero.
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

const FIRST_TIME_FILE_NAME = "ZeroVersionOpened.txt"

#-------------------------------------------------
#      Properties
#-------------------------------------------------

#-------------------------------------------------
#      Notifications
#-------------------------------------------------

func _ready() -> void:
	if not is_version_zero():
		queue_free()
		return
	if not is_first_time_open():
		queue_free()
		return
	
	#Popup a warning
	call_deferred("popup_centered")

#-------------------------------------------------
#      Virtual Methods
#-------------------------------------------------

#-------------------------------------------------
#      Override Methods
#-------------------------------------------------

#-------------------------------------------------
#      Public Methods
#-------------------------------------------------

func is_version_zero() -> bool:
	return get_version().begins_with("0")

func is_first_time_open() -> bool:
	var f = File.new()
	var file_path = "user://" + FIRST_TIME_FILE_NAME
	var is_file_exist = f.file_exists(file_path)
	var ver_txt : String
	
	if is_file_exist:
		f.open(file_path, File.READ)
		ver_txt = f.get_as_text()
		f.close()
	
	if not is_file_exist:
		return true
	
	return ver_txt != get_version()

func save_first_time_opened():
	var f = File.new()
	var file_path = "user://" + FIRST_TIME_FILE_NAME
	
	f.open(file_path, File.WRITE)
	f.store_string(get_version())
	f.close()

func get_version() -> String:
	return ProjectSettings.get_setting("application/config/version")

#-------------------------------------------------
#      Connections
#-------------------------------------------------

func _on_VersionZeroWarningDialog_popup_hide() -> void:
	save_first_time_opened()
	queue_free()

#-------------------------------------------------
#      Private Methods
#-------------------------------------------------

#-------------------------------------------------
#      Setters & Getters
#-------------------------------------------------

