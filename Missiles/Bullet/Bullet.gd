extends KinematicBody2D

export var speed := 750.0
var velocity := Vector2.ZERO
var damage := 1

func _physics_process(delta: float) -> void:
	velocity = Vector2(0, -speed).rotated(rotation)
	var collision = move_and_collide(velocity * delta)
	if collision:
		collision.hit(damage)
		queue_free()
