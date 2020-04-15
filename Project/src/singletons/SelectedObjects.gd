# SelectedObjects
# Written by: First

extends Node

"""
	Enter desc here.
"""

#-------------------------------------------------
#      Classes
#-------------------------------------------------

#-------------------------------------------------
#      Signals
#-------------------------------------------------

signal selected()
signal selected_obj(obj)
signal deselected()
signal deselected_obj(obj)

#-------------------------------------------------
#      Constants
#-------------------------------------------------

#-------------------------------------------------
#      Properties
#-------------------------------------------------

export (Array) var selected_objects : Array

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

func add_object(object : Object):
	if selected_objects.has(object):
		return
	
	selected_objects.append(object)
	emit_signal("selected_obj", object)

func add_objects(objects : Array):
	# Exclude duplicated objects
	for i in objects:
		if selected_objects.has(i):
			continue
		
		selected_objects += objects
	
	emit_signal("selected")

func remove(idx : int):
	var object = selected_objects[idx]
	selected_objects.remove(idx)
	emit_signal("deselected_obj", object)

func remove_all():
	selected_objects.clear()
	emit_signal("deselected")

func is_empty() -> bool:
	return selected_objects.empty()

#-------------------------------------------------
#      Connections
#-------------------------------------------------

#-------------------------------------------------
#      Private Methods
#-------------------------------------------------

#-------------------------------------------------
#      Setters & Getters
#-------------------------------------------------
