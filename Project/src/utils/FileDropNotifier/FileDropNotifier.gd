# FileDropNotifier

extends Node

"""
	Emits a signal when files are dragged from the OS file manager and dropped
	in the game window.
"""

#-------------------------------------------------
#      Signals
#-------------------------------------------------

signal files_dropped(files, screen)

#-------------------------------------------------
#      Notifications
#-------------------------------------------------

func _ready() -> void:
	get_tree().connect("files_dropped", self, "_on_SceneTree_files_dropped")

#-------------------------------------------------
#      Connections
#-------------------------------------------------

func _on_SceneTree_files_dropped(files : PoolStringArray, screen : int):
	emit_signal("files_dropped", files, screen)
