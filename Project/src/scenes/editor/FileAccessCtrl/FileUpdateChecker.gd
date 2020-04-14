# FileUpdateChecker
# Written by: First

extends Node

#class_name optional

"""
	Automatically detects when there is a newer version of the
	file modified by another program.
"""

#-------------------------------------------------
#      Classes
#-------------------------------------------------

#-------------------------------------------------
#      Signals
#-------------------------------------------------

signal detected

#-------------------------------------------------
#      Constants
#-------------------------------------------------

#-------------------------------------------------
#      Properties
#-------------------------------------------------

export var current_file_path : String setget set_current_file_path
export var current_file_directory : String setget set_current_file_directory

var current_modified_time : int

#-------------------------------------------------
#      Notifications
#-------------------------------------------------

func _notification(what: int) -> void:
	match what:
		NOTIFICATION_WM_FOCUS_IN:
			_check()

#-------------------------------------------------
#      Virtual Methods
#-------------------------------------------------

#-------------------------------------------------
#      Override Methods
#-------------------------------------------------

#-------------------------------------------------
#      Public Methods
#-------------------------------------------------

func update_current_modified_time():
	var dir := Directory.new()
	dir.open(current_file_directory)
	var f = File.new()
	f.open(current_file_path, File.READ)
	current_modified_time = f.get_modified_time(current_file_path)
	f.close()

#-------------------------------------------------
#      Connections
#-------------------------------------------------

#-------------------------------------------------
#      Private Methods
#-------------------------------------------------

#Do check.
#If it's already detected, nothing happens.
func _check():
	var dir := Directory.new()
	dir.open(current_file_directory)
	var f = File.new()
	var result = f.open(current_file_path, File.READ)
	if result != OK:
		return
	if current_modified_time == f.get_modified_time(current_file_path):
		f.close()
		return
	else:
		emit_signal("detected")
		update_current_modified_time()
	f.close()

func clear_data():
	current_file_directory = ""
	current_file_path = ""

#-------------------------------------------------
#      Setters & Getters
#-------------------------------------------------

func set_current_file_path(val : String):
	current_file_path = val

func set_current_file_directory(val : String):
	current_file_directory = val
