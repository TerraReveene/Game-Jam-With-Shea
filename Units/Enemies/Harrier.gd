extends KinematicBody2D

export var health := 1
export var speed := 200
export var collision_damage := 5
var direction := Vector2.DOWN

func _process(delta: float) -> void:
	if $PlayerFinder.player_found:
		aim_towards($PlayerFinder.player_position)

func _physics_process(delta: float) -> void:
	var velocity = move_and_slide(direction * speed)
	for i in get_slide_count():
		var collision = get_slide_collision(i)
		if (collision.collider.has_method("hit")
				&& collision.collider.get_collision_layer() == 0):
			collision.collider.hit(collision_damage)
		queue_free()

func hit (damage) -> void:
	health -= damage
	if health < 1:
		queue_free()

func aim_towards(vector: Vector2) -> void:
	for child in $Weapons.get_children():
		child.look_at(vector)
		child.rotation_degrees += 90

func _on_VisibilityNotifier2D_screen_entered() -> void:
	for child in $Weapons.get_children():
		child.set_active(true)
