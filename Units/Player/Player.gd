extends KinematicBody2D

export var speed := 500.0
var velocity := Vector2.ZERO
var life := 50
var weapon
var shootTimer: Timer
var w

# Called when the node enters the scene tree for the first time.
func _ready():
	shootTimer = get_node("ShootTimer")
	weapon = load("res://Weapons/PlayerWideBullets/PlayerWideBullets.tscn")
	#if weapon == null:
	#	weapon = load("res://Weapons/PlayerWideBullets/PlayerWideBullets.gd")
	w = weapon.instance()
	add_child(w)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _physics_process(delta: float):
	velocity = Vector2.ZERO
	if Input.is_action_pressed("ui_right"):
		velocity += Vector2.RIGHT
	if Input.is_action_pressed("ui_left"):
		velocity += Vector2.LEFT
	if Input.is_action_pressed("ui_up"):
		velocity += Vector2.UP
	if Input.is_action_pressed("ui_down"):
		velocity += Vector2.DOWN
	if Input.is_action_just_pressed("shoot"):
		w.start_shooting()
	if Input.is_action_just_released("shoot"):
		w.stop_shooting()
	velocity = velocity.normalized() * speed
	var collision = move_and_collide(velocity * delta)

func shoot():
	pass
	#if weapon == null:
	#	return
	#var new_p = projectile.instance()
	#get_parent().add_child(new_p)
	#new_p.global_position = position + Vector2(0, -15)


func _on_ShootTimer_timeout():
	shoot()
