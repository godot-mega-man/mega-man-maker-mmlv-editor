# ObjectAdder
# Written by: First

extends Node2D

#class_name optional

"""
	A node that has the operation to add a preview-object to the editor.
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

export var obj_to_add : PackedScene

export var add_target_path : NodePath

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

func add_object():
	if obj_to_add == null:
		push_warning("obj_to_add == null. Can't add object to the editor.'")
		return
	if add_target_path.is_empty():
		push_warning("Can't add obj_to_add to target path. No path specified.")
		return
	
	var obj = obj_to_add.instance()
	get_node(add_target_path).add_child(obj)
	
	#Move newly created object to the center of the editor.
	#This will also snap the position to 16x16 grid.
	if obj is Node2D:
		obj.global_position = _get_camera_center()
		
		#Snap to a grid of 16x16 px
		obj.global_position = obj.global_position.snapped(Vector2(16, 16))
		
		#Shift -8x8 px
		obj.global_position -= Level.SHIFT_POS
	
	if obj is PreviewGameObject:
		obj.obj_id = 0
		obj.obj_type = 0
	
	UnsaveChanges.set_activated()

#-------------------------------------------------
#      Connections
#-------------------------------------------------

#-------------------------------------------------
#      Private Methods
#-------------------------------------------------

func _get_camera_center() -> Vector2:
	var vtrans = get_canvas_transform()
	var top_left = -vtrans.get_origin() / vtrans.get_scale()
	var vsize = get_viewport_rect().size
	
	return top_left + 0.5*vsize/vtrans.get_scale()

#-------------------------------------------------
#      Setters & Getters
#-------------------------------------------------
