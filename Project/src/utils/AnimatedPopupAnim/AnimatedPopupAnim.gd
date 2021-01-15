# AnimatedPopupAnim
# Written by: First

extends AnimationPlayer

#class_name optional

"""
	Make parent node that inherits Popup to animate.
	Wouldn't be that nice to have this one in your project?
	
	Also works on MenuButton.
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

func _ready() -> void:
	var parent = get_parent()
	
	if parent is MenuButton:
		parent.call_deferred("remove_child", self)
		parent.get_popup().call_deferred("add_child", self)
		parent.get_popup().connect("about_to_show", self, "_on_popup_about_to_show")
		return
	if parent is Popup:
		parent.connect("about_to_show", self, "_on_popup_about_to_show")
		return
	#Support more nodes here

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

func _on_popup_about_to_show():
	if EditorConfig.reduced_motion:
		return
	
	play("Popup")

#-------------------------------------------------
#      Private Methods
#-------------------------------------------------

#-------------------------------------------------
#      Setters & Getters
#-------------------------------------------------
