extends Node2D

export (Array, PackedScene) var waves
export (Array, float) var time_until_next_wave

var timer := 0.0

func _ready():
	for child in $StaticWave.get_children():
		$Player.connect("destroy_all_enemies_bullets", child,"_on_destroy_all_enemies_bullets")
		$Player.connect("kill_all_enemies", child,"_on_kill_all_enemies")
		child.connect("score_points", $Player, "_on_score_points")


func _on_Player_bombs_changed():
	pass # Replace with function body.
