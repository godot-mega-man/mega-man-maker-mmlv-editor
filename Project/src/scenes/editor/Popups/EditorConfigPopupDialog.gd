# EditorConfigPopupDialog

extends WindowDialog

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

#-------------------------------------------------
#      Properties
#-------------------------------------------------
onready var advanced_area = $MarginContainer/VBox/ScrollContainer/VBox/AdvancedMode
onready var auto_update_checkbox := $MarginContainer/VBox/ScrollContainer/VBox/AutoUpdate/CheckBox
onready var reduced_motion_checkbox := $MarginContainer/VBox/ScrollContainer/VBox/ReducedMotion/CheckBox
onready var locked_keyboard := $MarginContainer/VBox/ScrollContainer/VBox/LockedKeyboard/CheckBox
onready var camera_smoothness_lineedit := $MarginContainer/VBox/ScrollContainer/VBox/CameraSmoothness/LineEdit
onready var max_recent_files_lineedit := $MarginContainer/VBox/ScrollContainer/VBox/MaxRecentFiles/LineEdit
onready var fps_lineedit := $MarginContainer/VBox/ScrollContainer/VBox/Fps/LineEdit
onready var advanced_mode : = $MarginContainer/VBox/ScrollContainer/VBox/AdvancedMode/CheckBox


#-------------------------------------------------
#      Notifications
#-------------------------------------------------

#-------------------------------------------------
#      Virtual Methods
#-------------------------------------------------

#-------------------------------------------------
#      Override Methods
#-------------------------------------------------

#-------------------------------------------------
#      Public Methods
#-------------------------------------------------

func apply_changes():
	EditorConfig.auto_check_update = auto_update_checkbox.pressed
	EditorConfig.reduced_motion = reduced_motion_checkbox.pressed
	EditorConfig.locked_keyboard = locked_keyboard.pressed
	EditorConfig.advanced_mode =  advanced_mode.pressed
	EditorConfig.camera_smoothness = int(camera_smoothness_lineedit.text)
	EditorConfig.max_recent_files = int(max_recent_files_lineedit.text)
	EditorConfig.fps = int(fps_lineedit.text)
	EditorConfig.save()

#-------------------------------------------------
#      Connections
#-------------------------------------------------

func _on_EditorConfigPopupDialog_about_to_show() -> void:
	_update_ui_from_config_autoload()

func _on_OkButton_pressed() -> void:
	apply_changes()
	advanced_area.visible = false
	hide()

func _on_CancelButton_pressed() -> void:
	advanced_area.visible = false
	hide()

func _on_HiddenButton_pressed() -> void:
	advanced_area.visible = !advanced_area.visible

func _on_CameraSmoothness_LineEdit_unfocused() -> void:
	camera_smoothness_lineedit.text = str(
		clamp(
			int(camera_smoothness_lineedit.text),
			EditorConfig.camera_smoothness_min,
			EditorConfig.camera_smoothness_max
		)
	)

func _on_MaxRecentFiles_LineEdit_unfocused() -> void:
	max_recent_files_lineedit.text = str(
		clamp(
			int(max_recent_files_lineedit.text),
			EditorConfig.max_recent_files_min,
			EditorConfig.max_recent_files_max
		)
	)

func _on_Fps_LineEdit_unfocused() -> void:
	fps_lineedit.text = str(
		clamp(
			int(fps_lineedit.text),
			EditorConfig.fps_min,
			EditorConfig.fps_max
		)
	)

#-------------------------------------------------
#      Private Methods
#-------------------------------------------------

func _update_ui_from_config_autoload():
	auto_update_checkbox.pressed = EditorConfig.auto_check_update
	reduced_motion_checkbox.pressed = EditorConfig.reduced_motion
	locked_keyboard.pressed = EditorConfig.locked_keyboard
	advanced_mode.pressed = EditorConfig.advanced_mode
	camera_smoothness_lineedit.text = str(EditorConfig.camera_smoothness)
	max_recent_files_lineedit.text = str(EditorConfig.max_recent_files)
	fps_lineedit.text = str(EditorConfig.fps)

#-------------------------------------------------
#      Setters & Getters
#-------------------------------------------------
