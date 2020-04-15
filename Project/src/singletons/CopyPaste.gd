# CopyPaste
# Written by: HeartCode 

extends Node

#class_name optional

"""
	A singleton class that copy all currently selected objects
	and paste them into the scene at any time.
	
	Duplication of nodes is also implemented to be used
	as an alternate of copy & paste.
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

#Newly created obj use this
const SHIFT_POSITION_ADD = Vector2(16, 16)

#-------------------------------------------------
#      Properties
#-------------------------------------------------

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

func duplicate_selection():
	#Duplicate an array holding references
	var _selected_objects = SelectedObjects.selected_objects.duplicate()
	
	for i in _selected_objects:
		var duplicated_obj : Node
		if i is Node:
			duplicated_obj = _duplicate_node_in_place(i)
			
			if i is Node2D:
				_shift_node2d_by_vec2(duplicated_obj, SHIFT_POSITION_ADD)
			
			SelectedObjects.add_object(duplicated_obj)
		SelectedObjects.remove_obj(i)
	
	UnsaveChanges.set_activated()

#-------------------------------------------------
#      Connections
#-------------------------------------------------

#-------------------------------------------------
#      Private Methods
#-------------------------------------------------

func _duplicate_node_in_place(node_to_duplicate : Node) -> Node:
	var duplicated_obj = node_to_duplicate.duplicate()
	node_to_duplicate.get_parent().add_child(duplicated_obj)
	return duplicated_obj

func _shift_node2d_by_vec2(node2d : Node2D, vec2 : Vector2):
	node2d.position += vec2

#-------------------------------------------------
#      Setters & Getters
#-------------------------------------------------
