# GameGrid
# Written by: First

tool
extends Node2D

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

const LEVEL_SIZE = Vector2(50, 20)
const SCREEN_SIZE = Vector2(256, 224)
const GRID_COLOR = Color.white
const GRID_LINE_WIDTH = 1

#-------------------------------------------------
#      Properties
#-------------------------------------------------

#-------------------------------------------------
#      Notifications
#-------------------------------------------------

func _ready() -> void:
	update()

func _draw() -> void:
	#Draw vertical lines
	for i in LEVEL_SIZE.x:
		draw_line(
			Vector2(SCREEN_SIZE.x * i, 0),
			Vector2(SCREEN_SIZE.x * i, SCREEN_SIZE.y * LEVEL_SIZE.y),
			GRID_COLOR,
			GRID_LINE_WIDTH
		)
	#Draw horizontal lines
	for i in LEVEL_SIZE.y:
		draw_line(
			Vector2(0, SCREEN_SIZE.y * i),
			Vector2(SCREEN_SIZE.x * LEVEL_SIZE.x, SCREEN_SIZE.y * i),
			GRID_COLOR,
			GRID_LINE_WIDTH
		)

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

#-------------------------------------------------
#      Setters & Getters
#-------------------------------------------------
