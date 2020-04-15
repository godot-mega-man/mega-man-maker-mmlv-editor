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
	for i in SelectedObjects.selected_objects:
		if i is Node:
			_duplicate_node_in_place(i)

#-------------------------------------------------
#      Connections
#-------------------------------------------------

#-------------------------------------------------
#      Private Methods
#-------------------------------------------------

func _duplicate_node_in_place(node_to_duplicate : Node):
	var duplicated_obj = node_to_duplicate.duplicate()
	node_to_duplicate.get_parent().add_child(duplicated_obj)

#-------------------------------------------------
#      Setters & Getters
#-------------------------------------------------
