extends Node2D

export var missile: PackedScene
export var cooldown = 1.0
var timer := 0.0
export var active := false
export var inaccuracy := 15.0

func _physics_process(delta: float) -> void:
	if (active && timer >= cooldown):
		fire()
	if active:
		timer += delta

func fire() -> void:
	var instance = missile.instance()
	add_child(instance)
	instance.rotation_degrees = rotation_degrees + rand_range(-inaccuracy, inaccuracy)
	instance.position = self.position
	timer -= cooldown

func set_active(value) -> void:
	active = value
