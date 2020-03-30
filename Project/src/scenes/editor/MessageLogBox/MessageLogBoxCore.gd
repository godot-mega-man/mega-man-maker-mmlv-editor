# MessageLogBox
# Written by: First

extends CanvasLayer

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

const MSG_ERR_COLOR = Color.indianred

#-------------------------------------------------
#      Properties
#-------------------------------------------------

#Custom label. If not defined, the editor will instance
#normal Label by default.
export (PackedScene) var custom_label


onready var labels_vbox = $Control/LabelsVBox

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

func add_message(text : String, is_err : bool = false):
	var lb : Label
	
	if custom_label != null:
		lb = custom_label.instance()
	else:
		lb = Label.new()
	
	labels_vbox.add_child(lb)
	lb.set_text(text)
	lb.set_autowrap(true)
	if is_err:
		lb.add_color_override("font_color", MSG_ERR_COLOR)

#-------------------------------------------------
#      Connections
#-------------------------------------------------

#-------------------------------------------------
#      Private Methods
#-------------------------------------------------

#-------------------------------------------------
#      Setters & Getters
#-------------------------------------------------
