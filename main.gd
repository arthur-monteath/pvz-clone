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
	for i in range(1000):
		var sun = SUN.instantiate()
		sun.global_position = Vector2(580,300) + Utils.random_radius(300)
		overlay.add_child(sun)
		sun.owner = self
