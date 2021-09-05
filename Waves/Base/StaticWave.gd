extends Node

export var expiration_time := 45.0
export var expires := true
var timer := 0.0

export var time_until_next_wave := 12.0

func _process(delta: float) -> void:
	if get_children().size() == 0:
		queue_free()
	timer += delta
	if (expires && timer >= expiration_time):
		queue_free()
