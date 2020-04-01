# ReadmeAcceptDialog
# Written by: First

extends AcceptDialog

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

const URL_GITHUB_ISSUES = "https://github.com/Firstject/mega-man-maker-mmlv-editor/issues"
const URL_REPORT = "https://github.com/Firstject/mega-man-maker-mmlv-editor/issues/new/choose"
const URL_GODOT = "https://godotengine.org/"
const URL_CONTRIBUTORS = "https://github.com/Firstject/mega-man-maker-mmlv-editor/blob/master/CONTRIBUTORS.md"

#-------------------------------------------------
#      Properties
#-------------------------------------------------

onready var author_label = $ScrollContainer/VBoxContainer/AuthorsContentVBox/AuthorHBox/Author
onready var credit_label = $ScrollContainer/VBoxContainer/CreditsContentVBox/Credits

#-------------------------------------------------
#      Notifications
#-------------------------------------------------

func _ready() -> void:
	# Set author
	author_label.text = ProjectSettings.get_setting("application/config/project_creator")
	
	# Set program name
	credit_label.text += ProjectSettings.get_setting("application/config/name")
	credit_label.text += "."

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

func _on_LinkBtnIssues_pressed() -> void:
	OS.shell_open(URL_GITHUB_ISSUES)

func _on_LinkBtnReport_pressed() -> void:
	OS.shell_open(URL_REPORT)

func _on_LinkBtnGodot_pressed() -> void:
	OS.shell_open(URL_GODOT)

func _on_LinkBtnContributorsList_pressed() -> void:
	OS.shell_open(URL_CONTRIBUTORS)

#-------------------------------------------------
#      Private Methods
#-------------------------------------------------

#-------------------------------------------------
#      Setters & Getters
#-------------------------------------------------

