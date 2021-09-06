extends KinematicBody2D

export var health := 1.0
export var speed := 200
export var collision_damage := 5
var direction := Vector2.DOWN
var on_screen := false
export var score_value := 50

signal score_points(points)

func _process(delta: float) -> void:
	if $PlayerFinder.player_found:
		aim_towards($PlayerFinder.player_position)

func _physics_process(delta: float) -> void:
	var velocity = move_and_slide(direction * speed)
	for i in get_slide_count():
		var collision = get_slide_collision(i)
		if (collision.collider.has_method("hit")
				&& collision.collider.get_collision_layer() == 1):
			collision.collider.hit(collision_damage)
			queue_free()

func hit (damage: float) -> void:
	health -= damage
	if health <= 0.0:
		queue_free()
	emit_signal("score_points", score_value)

func aim_towards(vector: Vector2) -> void:
	for child in $Weapons.get_children():
		child.look_at(vector)

func _on_VisibilityNotifier2D_screen_entered() -> void:
	for child in $Weapons.get_children():
		child.set_active(true)
	on_screen = true

func _on_VisibilityNotifier2D_screen_exited() -> void:
	for child in $Weapons.get_children():
		child.set_active(false)

func _on_destroy_all_enemies_bullets():
	for child in $Weapons.get_children():
		for child2 in child.get_children():
			for child3 in child2.get_children():
				child3.queue_free()
		
func _on_kill_all_enemies():
	if on_screen:
		queue_free()
