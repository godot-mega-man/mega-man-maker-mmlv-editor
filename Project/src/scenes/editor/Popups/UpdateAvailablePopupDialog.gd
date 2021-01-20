# UpdateAvailablePopupDialog

extends WindowDialog

"""
	Enter desc here.
"""

#-------------------------------------------------
#      Properties
#-------------------------------------------------

onready var intro_label = $MarginContainer/VBoxContainer/Intro
onready var desc_label = $MarginContainer/VBoxContainer/ReleaseNoteBox/ReleaseScrollContainer/VBoxContainer/Desc
onready var author_label = $MarginContainer/VBoxContainer/ReleaseNoteBox/ReleaseScrollContainer/VBoxContainer/Author
onready var file_size_label = $MarginContainer/VBoxContainer/FileSize

var download_url : String

#-------------------------------------------------
#      Public Methods
#-------------------------------------------------

func set_version(version : String):
	intro_label.text = "An update to the latest version of %s (%s) is available." % [
		ProjectSettings.get_setting("application/config/name") ,
		version
	]

func set_author_and_time(author : String, time : String):
	author_label.text = "%s released this on %s" % [
		author,
		time
	]

func set_desc(desc : String):
	desc_label.text = desc

func set_file_size(readable_size : String):
	file_size_label.text = "Total file size: %s" % readable_size

func set_download_url(url):
	download_url = url

#-------------------------------------------------
#      Connections
#-------------------------------------------------

func _on_CancelButton_pressed() -> void:
	hide()

func _on_DownloadButton_pressed() -> void:
	assert(not download_url.empty())
	
	OS.shell_open(download_url)
