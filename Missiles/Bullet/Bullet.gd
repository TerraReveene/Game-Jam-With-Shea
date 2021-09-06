extends KinematicBody2D

export var speed := 750.0
var velocity := Vector2.ZERO
var damage := 1

export var expiration_time := 15.0
var timer := 0.0

func _physics_process(delta: float) -> void:
	velocity = Vector2(0, -speed).rotated(rotation)
	var collision = move_and_collide(velocity * delta)
	if collision:
		if collision.collider.has_method("hit"):
			collision.collider.hit(damage)
		queue_free()
	timer += delta
	if timer >= expiration_time:
		queue_free()

func _on_destroy_all_enemies_bullets():
	queue_free()
