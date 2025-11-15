class_name Main extends Node2D

signal on_sun_amount_changed(new_amount: int)

@onready var overlay: CanvasLayer = %OverlayUI

var suns: int = 0:
	get: return suns
	set(new_amount):
		suns = new_amount
		emit_signal("on_sun_amount_changed", new_amount)

func add_suns(amount: int = 1):
	suns = max(suns + amount, 0)

const SUN = preload("uid://drc3771pvtotc")
func _ready() -> void:
	spawn()

func spawn():
	for i in range(5):
		var sun = SUN.instantiate()
		sun.global_position = Vector2(570,346) + Utils.random_radius(280)
		overlay.add_child(sun)
		sun.owner = self
	await get_tree().create_timer(0.1).timeout
	spawn()
