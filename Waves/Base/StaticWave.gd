extends Node2D

export var expiration_time := 45.0
export var expires := true
var timer := 0.0

func _process(delta: float) -> void:
	if get_children().size() == 0:
		queue_free()
	timer += delta
	if (expires && timer >= expiration_time):
		queue_free()
