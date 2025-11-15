class_name WaveManager extends Timer

signal on_wave_start(wave: int)
signal on_wave_end(wave: int)

@export var waves: Array[Wave]
var wave_number := 0

func _ready():
	timeout.connect(_on_wave_end)
	start_wave()

func start_wave(wave_resource := _get_random_wave(), duration := wait_time):
	wave_number += 1
	emit_signal("on_wave_start", wave_number)
	start(duration)
	var interval = duration / len(wave_resource.enemies)
	for enemy in wave_resource.enemies:
		# Spawn Enemy
		await get_tree().create_timer(interval).timeout

func _on_wave_end():
	emit_signal("on_wave_end", wave_number)
	start_wave()

func _get_random_wave() -> Wave:
	var index := randi() % len(waves)
	return waves[index]
