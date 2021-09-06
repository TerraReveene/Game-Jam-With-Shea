extends Node2D

export (Array, PackedScene) var waves
export var repeat_waves := true
export var shuffle_initial_waves := false
export var shuffle_waves_after_completion := true
var timer := 0.0
var next_wave_time := 5.0
var current_wave := 0

func _ready() -> void:
	randomize()
	if shuffle_initial_waves:
		waves.shuffle()

func _physics_process(delta: float) -> void:
	timer += delta
	if timer >= next_wave_time && waves.size() >= current_wave + 1:
		var wave = waves[current_wave].instance()
		add_child(wave)
		timer -= next_wave_time
		next_wave_time = wave.time_until_next_wave
		current_wave += 1
		for child in wave.get_children():
			$Player.connect("destroy_all_enemies_bullets", child,"_on_destroy_all_enemies_bullets")
			$Player.connect("kill_all_enemies", child,"_on_kill_all_enemies")
			child.connect("score_points", $Player, "_on_score_points")

	if current_wave >= waves.size() && repeat_waves:
		current_wave = 0
		if shuffle_waves_after_completion:
			waves.shuffle()
