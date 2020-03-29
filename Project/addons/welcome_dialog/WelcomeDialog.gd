# Script_Name_Here
# Written by: 

tool
extends EditorPlugin

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

const DIALOG = preload("res://addons/welcome_dialog/Dialog.tscn")

const FIRST_TIME_FILE_NAME = "opened.txt"

#-------------------------------------------------
#      Properties
#-------------------------------------------------

#-------------------------------------------------
#      Notifications
#-------------------------------------------------

func _enter_tree():
	if not is_first_time_open():
		return
	
	var d = DIALOG.instance()
	get_editor_interface().get_base_control().add_child(d)
	d.popup_start()

func _exit_tree():
	# Clean-up of the plugin goes here
	pass

#-------------------------------------------------
#      Virtual Methods
#-------------------------------------------------

#-------------------------------------------------
#      Override Methods
#-------------------------------------------------

#-------------------------------------------------
#      Public Methods
#-------------------------------------------------

func is_first_time_open() -> bool:
	var f = File.new()
	var file_path = "res://addons/welcome_dialog/" + FIRST_TIME_FILE_NAME
	var is_file_exist = f.file_exists(file_path)
	
	if not is_file_exist:
		f.open(file_path, File.WRITE)
		f.store_line("Nothing here. You've already been welcomed to the project of MMLV Editor.")
		f.close()
	
	return not is_file_exist

#-------------------------------------------------
#      Connections
#-------------------------------------------------

#-------------------------------------------------
#      Private Methods
#-------------------------------------------------

#-------------------------------------------------
#      Setters & Getters
#-------------------------------------------------
