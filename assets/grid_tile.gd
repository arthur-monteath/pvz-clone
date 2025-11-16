class_name GridTile extends Area2D

@onready var sprite: Sprite2D = %Sprite
@onready var collision_shape: CollisionShape2D = %Shape

var base_color := Color("7c3e24")

var rect: Rect2:
	set(value):
		rect = value
		global_position = rect.position
		collision_shape.shape.size = value.size
		queue_redraw()

func _draw() -> void:
	var start: Vector2 = to_local(rect.position)
	var end: Vector2 = to_local(rect.end)
	draw_rect(Rect2(start, end), Color(120, 120, 120, 0.1))

func _ready():
	mouse_entered.connect(_on_mouse_entered)
	mouse_exited.connect(_on_mouse_exited)

func _on_mouse_entered():
	modulate = Color.WHITE

func _on_mouse_exited():
	modulate = base_color
