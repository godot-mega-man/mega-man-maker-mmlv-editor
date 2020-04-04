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

const TAB_IDX_LEVEL_CONFIG = 0
const TAB_IDX_OBJECTS = 1

#-------------------------------------------------
#      Properties
#-------------------------------------------------

onready var panel_open = $PanelOpen
onready var panel_close = $PanelClose
onready var inspector_show_btn = $PanelClose/InspectorShowBtn
onready var inspector_hide_btn = $PanelOpen/ContentVBox/TitleHBox/InspectorHideBtn
onready var view_code_button = $PanelOpen/ContentVBox/TitleHBox/ViewCodeBtn
onready var tab_container = $PanelOpen/ContentVBox/TabContainer

onready var level_tab = $PanelOpen/ContentVBox/TabContainer/LevelTab

var resize_dragging = false

#-------------------------------------------------
#      Notifications
#-------------------------------------------------

func _ready() -> void:
	hide_inspector()
	_connect_edit_mode()
	_connect_selected_objects()

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

func load_level_config():
	level_tab.load_properties_from_level()

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

func _on_EditMode_changed(mode : int):
	tab_container.set_current_tab(mode)
	
	if mode == EditMode.Mode.OBJECT:
		tab_container.set_current_tab(TAB_IDX_LEVEL_CONFIG)

func _on_SelectedObjects_selected():
	# Check whether there is no selected object, we set
	# current tab to level configuration instead.
	if SelectedObjects.is_empty():
		tab_container.set_current_tab(TAB_IDX_LEVEL_CONFIG)
	else:
		tab_container.set_current_tab(TAB_IDX_OBJECTS)



#-------------------------------------------------
#      Private Methods
#-------------------------------------------------

func _connect_edit_mode():
	EditMode.connect("changed", self, "_on_EditMode_changed")

func _connect_selected_objects():
	SelectedObjects.connect("selected", self, "_on_SelectedObjects_selected")

#-------------------------------------------------
#      Setters & Getters
#-------------------------------------------------
