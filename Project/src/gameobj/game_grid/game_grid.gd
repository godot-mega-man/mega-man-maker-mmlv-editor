# GameGrid
# Written by: First

extends Node2D

class_name GameGrid

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

enum PreviewMode {
	SCREEN,
	TILE
}

const LEVEL_SIZE = Vector2(50, 20)
const SCREEN_SIZE = Vector2(256, 224)
const GRID_COLOR = Color.white
const GRID_LINE_WIDTH = 1
const GRID_TILE_COLOR = Color(0, 0, 0, 0.25)
const GRID_TILE_LINE_WIDTH = 2

#-------------------------------------------------
#      Properties
#-------------------------------------------------

export (PreviewMode) var preview_mode

#-------------------------------------------------
#      Notifications
#-------------------------------------------------

func _ready() -> void:
	update()

func _draw() -> void:
	if preview_mode == PreviewMode.SCREEN:
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
	else:
		#Draw vertical lines
		for i in LEVEL_SIZE.x * 16:
			draw_line(
				Vector2(16 * i, 0),
				Vector2(16 * i, SCREEN_SIZE.y * LEVEL_SIZE.y),
				GRID_TILE_COLOR,
				GRID_TILE_LINE_WIDTH
			)
		#Draw horizontal lines
		for i in LEVEL_SIZE.y * 14:
			draw_line(
				Vector2(0, 16 * i),
				Vector2(SCREEN_SIZE.x * LEVEL_SIZE.x, 16 * i),
				GRID_TILE_COLOR,
				GRID_TILE_LINE_WIDTH
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
