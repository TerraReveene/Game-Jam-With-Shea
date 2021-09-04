extends Node2D


export var projectile: PackedScene
#var playerWideBulletsTimer: Timer
var playerWideBulletsTimer: Timer

func _ready():
	playerWideBulletsTimer = get_node("PlayerWideBulletsTimer")

func _physics_process(delta: float):
	pass

func _on_PlayerWideBulletsTimer_timeout():
	shoot()

func shoot():
	if projectile == null:
		return
	var new_p_left = projectile.instance()
	get_parent().add_child(new_p_left)
	new_p_left.global_position = global_position + Vector2(-4, -10)
	new_p_left.rotation = -0.2
	
func start_shooting():
	playerWideBulletsTimer.start()

func stop_shooting():
	playerWideBulletsTimer.stop()
