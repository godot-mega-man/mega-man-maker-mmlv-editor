# UpToDatePopupDialog

extends AcceptDialog

"""
	Enter desc here.
"""

#-------------------------------------------------
#      Properties
#-------------------------------------------------

onready var desc = $MarginContainer/VBoxContainer/Desc

#-------------------------------------------------
#      Notifications
#-------------------------------------------------

func _ready() -> void:
	_update_text()

#-------------------------------------------------
#      Private Methods
#-------------------------------------------------

func _update_text():
	desc.text = desc.text % [
		ProjectSettings.get_setting("application/config/name") ,
		ProjectSettings.get_setting("application/config/version")
	]
