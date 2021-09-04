extends Node2D


export var projectile: PackedScene
#var playerWideBulletsTimer: Timer
var playerNarrowBulletsTimer: Timer
var player_speed = 250.0
var shooting = false

func _ready():
	playerNarrowBulletsTimer = get_node("PlayerNarrowBulletsTimer")

func _physics_process(delta: float):
	pass

func _on_PlayerNarrowBulletsTimer_timeout():
	shoot()

func shoot():
	if projectile == null:
		return
	var new_p_left = projectile.instance()
	$BulletHolder.add_child(new_p_left)
	#get_parent().add_child(new_p_left)
	new_p_left.global_position = global_position + Vector2(-4, -10)
	
	var new_p_right = projectile.instance()
	$BulletHolder.add_child(new_p_right)
	#get_parent().add_child(new_p_right)
	new_p_right.global_position = global_position + Vector2(4, -10)

	
func start_shooting():
	playerNarrowBulletsTimer.start()
	shooting = true

func stop_shooting():
	playerNarrowBulletsTimer.stop()
	shooting = false

func is_shooting():
	return shooting
