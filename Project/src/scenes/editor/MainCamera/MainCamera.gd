# MainCamera
# Written by: First 

extends Camera2D

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

const MIN_ZOOM = 0.1125
const MAX_ZOOM = 16.0
const NORMAL_ZOOM = 1
const ZOOM_CHANGE = 0.5
const ZOOM_CHANGE_BELOW_NORMAL = 0.25
const MINI_ZOOM_CHANGE = 0.2
const MINI_ZOOM_CHANGE_BELOW_NORMAL = 0.05

#-------------------------------------------------
#      Properties
#-------------------------------------------------

onready var tween = $Tween

var current_zoom := Vector2(1, 1)

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

func zoom_in():
	_zoom_to_mouse_pos()
	if current_zoom.x <= MIN_ZOOM:
		return 
	
	current_zoom /= 1.5
	_tween_zoom()

func zoom_out():
	if current_zoom.x >= MAX_ZOOM:
		return 
	
	current_zoom *= 1.5
	_tween_zoom()

func reset_zoom():
	current_zoom = Vector2.ONE
	_tween_zoom()

#-------------------------------------------------
#      Connections
#-------------------------------------------------

#-------------------------------------------------
#      Private Methods
#-------------------------------------------------

func _tween_zoom():
	tween.interpolate_property(
		self,
		"zoom",
		self.zoom,
		current_zoom,
		0.25,
		Tween.TRANS_EXPO,
		Tween.EASE_OUT
	)
	tween.start()

func _zoom_to_mouse_pos():
	position = get_global_mouse_position()

#-------------------------------------------------
#      Setters & Getters
#-------------------------------------------------
