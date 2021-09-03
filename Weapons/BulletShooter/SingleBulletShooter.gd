extends Node2D

export var missile: PackedScene
export var cooldown: float = 1
var timer: float = 0
export var active = true

func _physics_process(delta: float) -> void:
	if $RayCast2D.is_colliding() && active && timer >= cooldown:
		fire()
	timer += delta

func fire() -> void:
	var instance = missile.instance()
	add_child(instance)
	instance.rotation_degrees = self.rotation_degrees
	instance.position = self.position
	timer -= cooldown

