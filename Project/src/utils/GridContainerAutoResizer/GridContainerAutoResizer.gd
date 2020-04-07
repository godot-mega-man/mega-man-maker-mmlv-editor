# GridContainerAutoResizer
# Written by: First

extends Node

#class_name optional

"""
	An auto resizer node for GridContainer. Automatically resizes
	the grid to fit all columns when used as a child node of
	GridContainer.
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

export (NodePath) var root_node = "./.."
export (NodePath) var resize_notify_node = "./.."
export (float) var content_fixed_width = 38

#-------------------------------------------------
#      Notifications
#-------------------------------------------------

func _ready() -> void:
	if not is_root_node_valid():
		return
	
	var _node_notify = get_node(root_node)
	if _node_notify is Control:
		_node_notify.connect("resized", self, "_on_node_notify_resized")

#-------------------------------------------------
#      Virtual Methods
#-------------------------------------------------

#-------------------------------------------------
#      Override Methods
#-------------------------------------------------

#-------------------------------------------------
#      Public Methods
#-------------------------------------------------

func adjust_parent_columns():
	if not is_root_node_valid():
		return
	
	var size_result = int(floor(get_node(resize_notify_node).rect_size.x / content_fixed_width))
	if size_result <= 0:
		size_result = 1
	
	get_node(root_node).set_columns(size_result)

func is_root_node_valid():
	return root_node != null and get_node(root_node) is GridContainer

#-------------------------------------------------
#      Connections
#-------------------------------------------------

func _on_node_notify_resized():
	adjust_parent_columns()

#-------------------------------------------------
#      Private Methods
#-------------------------------------------------

#-------------------------------------------------
#      Setters & Getters
#-------------------------------------------------
