extends CanvasLayer

@onready var sun_label: Label = %SunContainer/Label

func _ready():
	var main := owner as Main
	main.on_sun_amount_changed.connect(_on_sun_amount_changed)

func _on_sun_amount_changed(amount: int):
	sun_label.text = str(amount)
