class_name RootUI extends CanvasLayer

@onready var wave_manager: WaveManager = %WaveManager

@onready var sun_label: Label = %SunContainer/Label
@onready var wave_label: Label = %WaveLabel

func _ready():
	var main := owner as Main
	main.on_sun_amount_changed.connect(_on_sun_amount_changed)
	wave_manager.on_wave_start.connect(_on_wave_start)

func _on_sun_amount_changed(amount: int):
	sun_label.text = str(amount * 20)

func _on_wave_start(wave: int):
	wave_label.text = "Wave " + str(wave)
