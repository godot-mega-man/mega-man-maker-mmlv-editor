# Script_Name_Here
# Written by: 

extends PopupDialog

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

const CONTRIBUTION_CODE_URL = "https://github.com/godot-mega-man/mega-man-maker-mmlv-editor/#contribution-guidelines"
const SOURCE_CODE_URL = "https://github.com/godot-mega-man/mega-man-maker-mmlv-editor"
const ROADMAP_URL = "https://trello.com/b/vuDpFyE6/mmlv-editor"

#-------------------------------------------------
#      Properties
#-------------------------------------------------

onready var proj_label = $VBoxContainer/ProjectTitleLabel

onready var author_label = $VBoxContainer/AuthorHBox/Author

#-------------------------------------------------
#      Notifications
#-------------------------------------------------

func _ready() -> void:
	_update_texts()

#-------------------------------------------------
#      Virtual Methods
#-------------------------------------------------

#-------------------------------------------------
#      Override Methods
#-------------------------------------------------

#-------------------------------------------------
#      Public Methods
#-------------------------------------------------

#-------------------------------------------------
#      Connections
#-------------------------------------------------

func _on_OkButton_pressed() -> void:
	hide()

func _on_ContributionButtton_pressed() -> void:
	OS.shell_open(CONTRIBUTION_CODE_URL)

func _on_SourceButton_pressed() -> void:
	OS.shell_open(SOURCE_CODE_URL)

func _on_RoadmapButton_pressed() -> void:
	OS.shell_open(ROADMAP_URL)

#-------------------------------------------------
#      Private Methods
#-------------------------------------------------

func _update_texts():
	proj_label.text = str(
		ProjectSettings.get_setting("application/config/name"),
		" v",
		ProjectSettings.get_setting("application/config/version")
	)
	
	author_label.text = ProjectSettings.get_setting("application/config/project_creator")

#-------------------------------------------------
#      Setters & Getters
#-------------------------------------------------
