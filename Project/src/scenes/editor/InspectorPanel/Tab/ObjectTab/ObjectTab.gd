# ObjectTab
# Written by: First

extends MainInspectorTab

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

#-------------------------------------------------
#      Properties
#-------------------------------------------------

onready var atb_hbox_obj_vec_x = $ScrollContainer/Vbox/AtbHboxObjVecX
onready var atb_hbox_obj_vec_y = $ScrollContainer/Vbox/AtbHboxObjVecY
onready var atb_hbox_obj_type = $ScrollContainer/Vbox/AtbHboxObjType
onready var atb_hbox_obj_id = $ScrollContainer/Vbox/AtbHboxObjID
onready var atb_hbox_obj_appearance = $ScrollContainer/Vbox/AtbHboxObjAppearance
onready var atb_hbox_obj_direction = $ScrollContainer/Vbox/AtbHboxObjDirection
onready var atb_hbox_obj_timer = $ScrollContainer/Vbox/AtbHboxObjTimer
onready var atb_hbox_obj_tex_h = $ScrollContainer/Vbox/AtbHboxObjTexH
onready var atb_hbox_obj_tex_v = $ScrollContainer/Vbox/AtbHboxObjTexV
onready var atb_hbox_obj_dest_x = $ScrollContainer/Vbox/AtbHboxObjDestX
onready var atb_hbox_obj_dest_y = $ScrollContainer/Vbox/AtbHboxObjDestY
onready var atb_hbox_obj_option = $ScrollContainer/Vbox/AtbHboxObjOption

#-------------------------------------------------
#      Notifications
#-------------------------------------------------

func _ready() -> void:
	_connect_SelectedObjects()

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

func _on_SelectedObjects_selected():
	_update_properties_from_selected_objects()

#-------------------------------------------------
#      Private Methods
#-------------------------------------------------

func _update_properties_from_selected_objects():
	clear_all_properties()
	
	for i in SelectedObjects.selected_objects:
		if i is PreviewGameObject:
			atb_hbox_obj_vec_x.set_value(i.obj_vector_x)
			atb_hbox_obj_vec_y.set_value(i.obj_vector_y)
			atb_hbox_obj_type.set_value(i.obj_type)
			atb_hbox_obj_id.set_value(i.obj_id)
			atb_hbox_obj_appearance.set_value(i.obj_appearance)
			atb_hbox_obj_direction.set_value(i.obj_direction)
			atb_hbox_obj_timer.set_value(i.obj_timer)
			atb_hbox_obj_tex_h.set_value(i.obj_tex_h_offset)
			atb_hbox_obj_tex_v.set_value(i.obj_tex_v_offset)
			atb_hbox_obj_dest_x.set_value(i.obj_destination_x)
			atb_hbox_obj_dest_y.set_value(i.obj_destination_y)
			atb_hbox_obj_option.set_value(i.obj_option)

func _connect_SelectedObjects():
	SelectedObjects.connect("selected", self, "_on_SelectedObjects_selected")

#-------------------------------------------------
#      Setters & Getters
#-------------------------------------------------
