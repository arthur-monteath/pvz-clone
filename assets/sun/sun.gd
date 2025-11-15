extends Area2D

func _ready():
	mouse_entered.connect(collect)

func collect():
	var sun_icon: Control = get_node("%SunContainer/Icon")
	Utils.tween(get_node("%Sprite"), "self_modulate:a", 0.0, 1.0, Tween.EASE_IN)
	Utils.tween(
		self, "global_position",
		sun_icon.get_global_rect().get_center(), 1.0
		).tween_callback(
		func() -> void:
		(owner as Main).add_suns()
		queue_free()
	)
