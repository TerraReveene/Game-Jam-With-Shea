extends Area2D

var player_position: Vector2
var player_found := false

func _process(delta: float) -> void:
	var temp = get_overlapping_bodies()
	if temp.size() > 0:
		player_position = temp[0].global_position
		player_found = true
		
	
