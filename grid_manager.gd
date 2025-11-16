class_name GridManager extends Node2D

@export var lane_texture: Texture2D:
	set(value):
		lane_texture = value
		#_rebuild_grid()

@export var width: int = 8:
	set(value):
		width = max(value, 0)
		#_rebuild_grid()

@export var height: int = 5:
	set(value):
		height = max(value, 0)
		#_rebuild_grid()

@export var margin_top: int = 32
@export var margin_bottom: int = 16
@export var margin_left: int = 16
@export var margin_right: int = 16

const GRID_TILE = preload("uid://3bejon0p7spq")
var grid: Array[Array]

func _ready() -> void:
	_rebuild_grid()

func _rebuild_grid() -> void:
	_clear_grid()
	_create_grid()

func _create_grid():
	var screen = Rect2(Vector2.ZERO, %Camera.position*2)
	var vertical_space: float = screen.end.y - margin_bottom - margin_top
	var horizontal_space: float = screen.end.x - margin_right - margin_left

	var tile_height: float = vertical_space / height
	var tile_width: float = horizontal_space / width
	
	for row in range(height):
		grid.append([])
		var y: float = margin_top + row * tile_height + tile_height * 0.5
		for col in range(width):
			var tile: GridTile = GRID_TILE.instantiate()
			var x: float = margin_left + col * tile_width + tile_width * 0.5
			var start := Vector2(x,y)
			var end := Vector2(x+tile_width, y+tile_height)
			add_child(tile)
			tile.rect = Rect2(start, end)
			tile.sprite.texture = lane_texture
			tile.sprite.self_modulate = Color(0.75, 0.75, 0.75, 1.0)			
			tile.name = "Tile%d" % (row+col)
			grid[row].append(tile)

func _clear_grid():
	for row in grid: for tile in row:
		tile.queue_free()
	grid.clear()
