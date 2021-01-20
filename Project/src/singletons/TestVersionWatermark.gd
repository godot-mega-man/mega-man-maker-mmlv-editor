# TestVersionWatermark
extends CanvasLayer

#class_name optional

"""
	Shows a watermark text at the screen to state that this version is not
	yet ready to be released publicly (may contain bugs, etc.)
"""

#-------------------------------------------------
#      Notifications
#-------------------------------------------------

func _ready() -> void:
	if not ProjectSettings.get_setting("application/config/test_version"):
		queue_free()

#-------------------------------------------------
#      Connections
#-------------------------------------------------

func _on_DetailButton_pressed() -> void:
	OS.alert("The stability of this version is not guaranteed. Use them at your own risk. Make regular backups of your levels!")
