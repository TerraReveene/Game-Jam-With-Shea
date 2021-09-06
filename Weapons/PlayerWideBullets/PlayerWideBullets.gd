extends Node2D


export var projectile: PackedScene
#var playerWideBulletsTimer: Timer
var playerWideBulletsTimer: Timer
var player_speed = 500.0
var shooting = false

func _ready():
	playerWideBulletsTimer = get_node("PlayerWideBulletsTimer")
	#add_child(playerWideBulletsTimer)

func _physics_process(delta: float):
	pass

func _on_PlayerWideBulletsTimer_timeout():
	shoot()

func shoot():
	if projectile == null:
		return
	var new_p_left = projectile.instance()
	$BulletHolder.add_child(new_p_left)
	#get_parent().add_child(new_p_left)
	new_p_left.global_position = global_position + Vector2(-4, -10)
	new_p_left.rotation = -0.4
	
	var new_p_right = projectile.instance()
	$BulletHolder.add_child(new_p_right)
	#get_parent().add_child(new_p_right)
	new_p_right.global_position = global_position + Vector2(4, -10)
	new_p_right.rotation = 0.4
	
	var new_p_mid_left = projectile.instance()
	$BulletHolder.add_child(new_p_mid_left)
	#get_parent().add_child(new_p_mid_left)
	new_p_mid_left.global_position = global_position + Vector2(-2, -12)
	new_p_mid_left.rotation = -0.2
	
	var new_p_mid_right = projectile.instance()
	$BulletHolder.add_child(new_p_mid_right)
	#get_parent().add_child(new_p_mid_right)
	new_p_mid_right.global_position = global_position + Vector2(-2, -12)
	new_p_mid_right.rotation = 0.2
	
	var new_p_middle = projectile.instance()
	$BulletHolder.add_child(new_p_middle)
	#get_parent().add_child(new_p_middle)
	new_p_middle.global_position = global_position + Vector2(0, -15)

	
func start_shooting():
	playerWideBulletsTimer.start()
	shooting = true

func stop_shooting():
	playerWideBulletsTimer.stop()
	shooting = false

func is_shooting():
	return shooting
