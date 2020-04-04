# ObjectSelector
# Written by: First

extends Node2D

#class_name optional

"""
	Enter desc here.
"""

#-------------------------------------------------
#      Classes
#-------------------------------------------------

class Node2DInRectPicker:
	static func pick_node2d_within_rect(nodes_2d : Array, rect : Rect2) -> Array:
		var picked_nodes_2d : Array
		
		# Iterate through nodes_2d
		for i in nodes_2d:
			if i is Node2D and rect.has_point(i.position):
				picked_nodes_2d.append(i)
		
		return picked_nodes_2d

#-------------------------------------------------
#      Signals
#-------------------------------------------------

#-------------------------------------------------
#      Constants
#-------------------------------------------------

const GROUP_PREVIEW_OBJECT = "PreviewObject"

#-------------------------------------------------
#      Properties
#-------------------------------------------------

onready var highlight_rect = $HighlightRect

var selecting : bool
var select_begin_pos : Vector2

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

#-------------------------------------------------
#      Connections
#-------------------------------------------------

#-------------------------------------------------
#      Private Methods
#-------------------------------------------------

func process_input(event : InputEvent):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT:
			selecting = event.is_pressed()
			if event.is_pressed():
				select_begin_pos = get_global_mouse_position()
				highlight_rect.rect_size = Vector2.ZERO
				_on_left_mouse_down()
			else:
				_on_left_mouse_up()
		
		highlight_rect.visible = selecting
	
	if event is InputEventMouseMotion and selecting:
		var rect : Rect2
		
		# Set rect position
		rect.position = select_begin_pos
		
		# Set rect size
		rect.size = get_global_mouse_position() - select_begin_pos
		
		highlight_rect.rect_global_position = rect.position
		highlight_rect.rect_size = rect.size.abs()
		
		# Since rect_size of ReferenceRect can't go negative, the solution
		# for this is to make position mirrored.
		if rect.size.x < 0:
			highlight_rect.rect_position.x += rect.size.x # Positive position plus negative value
		if rect.size.y < 0:
			highlight_rect.rect_position.y += rect.size.y # Positive position plus negative value

func _on_left_mouse_up():
	select_highlighted(GROUP_PREVIEW_OBJECT)

func _on_left_mouse_down():
	SelectedObjects.remove_all()

func select_highlighted(group_name : String):
	var nodes_2d = get_tree().get_nodes_in_group(group_name)
	var highlighted_rect := Rect2(highlight_rect.rect_position, highlight_rect.rect_size)
	var picked_nodes_2d : Array = Node2DInRectPicker.pick_node2d_within_rect(nodes_2d, highlighted_rect)
	SelectedObjects.add_objects(picked_nodes_2d)


#-------------------------------------------------
#      Setters & Getters
#-------------------------------------------------

