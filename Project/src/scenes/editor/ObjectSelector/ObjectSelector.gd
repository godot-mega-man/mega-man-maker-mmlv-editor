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
	static func pick_node2d_within_rect(nodes_2d : Array, rect : Rect2, single = false) -> Array:
		var picked_nodes_2d : Array
		
		# Iterate through nodes_2d
		for i in nodes_2d:
			if i is Node2D and rect.has_point(i.position):
				picked_nodes_2d.append(i)
				
				if single:
					return picked_nodes_2d
		
		return picked_nodes_2d
	

#-------------------------------------------------
#      Signals
#-------------------------------------------------

#-------------------------------------------------
#      Constants
#-------------------------------------------------

enum SelectMode {
	NONE,
	SELECTING,
	MOVING
}

const GROUP_PREVIEW_OBJECT = "PreviewObject"
const HIGHLIGHT_MIN_DEADZONE = Vector2(4, 4)

#-------------------------------------------------
#      Properties
#-------------------------------------------------

onready var highlight_rect = $HighlightRect

var select_mode : int # Enum of SelectMode
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

func process_input(event : InputEvent):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT:
		if event.is_pressed(): 
			# Before re-selecting objects (by clicking outslide from
			# selected objects).
			# If there is no object under cursor, select mode is normal.
			# Otherwise, select mode become 'moving selected objects'.
			if has_selected_object_under_cursor():
				select_mode = SelectMode.MOVING
			else:
				select_mode = SelectMode.SELECTING
		else:
			#Check if previous mode is MOVING after the mouse button is released.
			if select_mode == SelectMode.MOVING:
				set_deferred("select_mode", SelectMode.NONE)
			else:
				select_mode = SelectMode.NONE
		_left_mouse_press_event(event)
	if event is InputEventMouseMotion:
		_mouse_motion_event(event)

func select_highlighted(group_name : String):
	var single_select = is_highlighted_deadzone_size()
	
	if single_select:
		set_highlight_rect_size_to_mouse_pos()
	
	SelectedObjects.add_objects(get_nodes_2d_within_rect(group_name, single_select))

#If the size of highlighted rect is small (deadzone),
#increase it.
func is_highlighted_deadzone_size() -> bool:
	return highlight_rect.rect_size.x < HIGHLIGHT_MIN_DEADZONE.x and highlight_rect.rect_size.y < HIGHLIGHT_MIN_DEADZONE.y

func set_highlight_rect_size_to_mouse_pos():
	highlight_rect.rect_position = get_global_mouse_position() - Vector2(8, 8)
	highlight_rect.rect_size = Vector2(16, 16)

func get_nodes_2d_within_rect(group_name : String, single_select : bool) -> Array:
	var nodes_2d = get_tree().get_nodes_in_group(group_name)
	var highlighted_rect := Rect2(highlight_rect.rect_position, highlight_rect.rect_size)
	var picked_nodes_2d : Array = Node2DInRectPicker.pick_node2d_within_rect(nodes_2d, highlighted_rect, single_select)
	
	return picked_nodes_2d

func has_selected_object_under_cursor() -> bool:
	set_highlight_rect_size_to_mouse_pos()
	var nodes_2d = get_nodes_2d_within_rect(GROUP_PREVIEW_OBJECT, true)
	
	# Return false if no object under cursor
	if nodes_2d.empty():
		return false
	
	# Iterate through all selected objects to check if a currently picked object
	# (under a cursor) is a selected object.
	for i in SelectedObjects.selected_objects:
		if i == nodes_2d.back():
			return true
	
	return false

func get_snapped_grid_mouse_pos() -> Vector2:
	return get_global_mouse_position().snapped(Vector2(16, 16)) - Level.SHIFT_POS

#-------------------------------------------------
#      Connections
#-------------------------------------------------

#-------------------------------------------------
#      Private Methods
#-------------------------------------------------

func _left_mouse_press_event(event : InputEvent):
	event = event as InputEventMouseButton
	
	if event.button_index == BUTTON_LEFT and not select_mode == SelectMode.MOVING:
		if event.is_pressed():
			select_begin_pos = get_global_mouse_position()
			highlight_rect.rect_size = Vector2.ZERO
			SelectedObjects.remove_all()
		else:
			select_highlighted(GROUP_PREVIEW_OBJECT)
		
		highlight_rect.visible = event.is_pressed()
	
	if event.button_index == BUTTON_LEFT and select_mode == SelectMode.MOVING:
		select_begin_pos = get_snapped_grid_mouse_pos()

func _mouse_motion_event(event : InputEvent):
	event = event as InputEventMouseMotion
	
	if select_mode == SelectMode.SELECTING:
		# Update highlighter size.
		
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
	if select_mode == SelectMode.MOVING:
		#Move all objects along with mouse motion
		
		for i in SelectedObjects.selected_objects:
			if i is Node2D:
				i.position += get_snapped_grid_mouse_pos() - select_begin_pos
		
		select_begin_pos = get_snapped_grid_mouse_pos()

#-------------------------------------------------
#      Setters & Getters
#-------------------------------------------------

