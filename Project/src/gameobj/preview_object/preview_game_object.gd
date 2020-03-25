# PreviewGameObject
# Written by: First

extends PreviewObject

class_name PreviewGameObject

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

#b
export (float) var obj_vector_x = DataGameObject.MISSING_DATA

#c
export (float) var obj_vector_y = DataGameObject.MISSING_DATA

#d
export (float) var obj_type = DataGameObject.MISSING_DATA

#e
export (float) var obj_id = DataGameObject.MISSING_DATA setget set_obj_id

#f
export (float) var obj_appearance = DataGameObject.MISSING_DATA

#g
export (float) var obj_direction = DataGameObject.MISSING_DATA

#h
export (float) var obj_timer = DataGameObject.MISSING_DATA

#j
export (float) var obj_tex_h_offset = DataGameObject.MISSING_DATA

#k
export (float) var obj_tex_v_offset = DataGameObject.MISSING_DATA

#m
export (float) var obj_destination_x = DataGameObject.MISSING_DATA

#n
export (float) var obj_destination_y = DataGameObject.MISSING_DATA

#o
export (float) var obj_option = DataGameObject.MISSING_DATA

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

func _update_obj_id_appearance():
	#Label
	if obj_id == DataGameObject.MISSING_DATA:
		$Sprite/ObjIDLabel.text = "0"
	else:
		$Sprite/ObjIDLabel.text = str(obj_id)
	
	#Appearance
	if obj_type == DataGameObject.MISSING_DATA:
		$Sprite.frame = 0
	else:
		$Sprite.frame = int(obj_type)
	

#-------------------------------------------------
#      Setters & Getters
#-------------------------------------------------

func set_obj_id(val : float):
	obj_id = val
	
	_update_obj_id_appearance()
