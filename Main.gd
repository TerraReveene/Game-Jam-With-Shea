extends Node2D

export (Array, PackedScene) var waves
var timer := 0.0
var next_wave_time := 5.0
var current_wave := 0

func _physics_process(delta: float) -> void:
	timer += delta
	if timer >= next_wave_time && waves.size() >= current_wave + 1:
		var wave = waves[current_wave].instance()
		add_child(wave)
		timer -= next_wave_time
		next_wave_time = wave.time_until_next_wave
		current_wave += 1
	if current_wave >= waves.size():
		current_wave = 0
