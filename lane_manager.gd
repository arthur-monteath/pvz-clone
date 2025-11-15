@tool
extends Node2D

#@export var spacing: int = 8

@export var lane_texture: Texture2D:
	set(value):
		lane_texture = value
		_rebuild_lanes()

@export var lane_amount := 5:
	set(value):
		lane_amount = max(value, 0)
		if Engine.is_editor_hint():
			_rebuild_lanes()

@export var width: int = 32:
	set(value):
		width = max(value, 1)
		_rebuild_lanes()

@export var margin_top: int = 32
@export var margin_bottom: int = 16
@export var margin_left: int = 16
@export var margin_right: int = 16

var lanes: Array[Line2D]

func _rebuild_lanes() -> void:
	clear_lanes()
	update_lanes()

func update_lanes():
	var screen = Rect2(Vector2.ZERO, %Camera.position*2)
	var vertical_space = screen.end.y - margin_bottom - margin_top
	var white_space: float = vertical_space - (width * lane_amount)
	var spacing := white_space / lane_amount
	
	for index in range(lane_amount):
		var lane := Line2D.new()
		var y: int = margin_top + index * (width + spacing)
		
		lane.add_point(Vector2(margin_left, y))
		lane.add_point(Vector2(screen.end.x - margin_right, y))
		lane.texture = lane_texture
		lane.texture_mode = Line2D.LINE_TEXTURE_TILE
		lane.texture_repeat = CanvasItem.TEXTURE_REPEAT_ENABLED
		lane.width = width

		lane.owner = owner
		lane.name = "Lane%d" % index

		add_child(lane)
		lanes.append(lane)

func clear_lanes():
	for lane in lanes:
		lane.call_deferred("queue_free")
	lanes.clear()
