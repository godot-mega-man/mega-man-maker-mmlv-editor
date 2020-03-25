# Inspector
# Written by: First

extends Control

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

const INSPECTOR_MIN_LEFT_MARGIN = -160
const INSPECTOR_MAX_LEFT_MARGIN = 200 #Margin at which the inspector will automatically hide
const DEFAULT_INSPECTOR_LEFT_MARGIN = 0

#-------------------------------------------------
#      Properties
#-------------------------------------------------

onready var panel_open = $PanelOpen
onready var panel_close = $PanelClose
onready var inspector_show_btn = $PanelClose/InspectorShowBtn
onready var inspector_hide_btn = $PanelOpen/ContentVBox/TitleHBox/InspectorHideBtn
onready var view_code_button = $PanelOpen/ContentVBox/TitleHBox/ViewCodeBtn
onready var tab_container = $PanelOpen/ContentVBox/TabContainer

var resize_dragging = false

#-------------------------------------------------
#      Notifications
#-------------------------------------------------

func _ready() -> void:
	hide_inspector()

#-------------------------------------------------
#      Virtual Methods
#-------------------------------------------------

#-------------------------------------------------
#      Override Methods
#-------------------------------------------------

#-------------------------------------------------
#      Public Methods
#-------------------------------------------------

func show_inspector():
	panel_open.visible = true
	panel_close.visible = false

func hide_inspector():
	panel_open.visible = false
	panel_close.visible = true

func resize_drag_ended():
	if panel_open.margin_left > INSPECTOR_MAX_LEFT_MARGIN:
		panel_open.margin_left = DEFAULT_INSPECTOR_LEFT_MARGIN
		hide_inspector()
	if panel_open.margin_left < INSPECTOR_MIN_LEFT_MARGIN:
		panel_open.margin_left = INSPECTOR_MIN_LEFT_MARGIN

#-------------------------------------------------
#      Connections
#-------------------------------------------------

func _on_InspectorHideBtn_pressed() -> void:
	hide_inspector()

func _on_InspectorShowBtn_pressed() -> void:
	show_inspector()

func _on_ViewCodeBtn_pressed() -> void:
	for i in tab_container.get_children():
		if i is MainInspectorTab:
			if view_code_button.is_pressed():
				i.show_codes()
			else:
				i.show_properties()

func _on_ResizeHandler_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		resize_dragging = event.is_pressed()
		if not resize_dragging:
			resize_drag_ended()
	
	if resize_dragging:
		if event is InputEventMouseMotion:
			panel_open.margin_left += event.relative.x

#-------------------------------------------------
#      Private Methods
#-------------------------------------------------

#-------------------------------------------------
#      Setters & Getters
#-------------------------------------------------
