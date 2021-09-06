extends KinematicBody2D

export var base_speed := 500.0
var bombs := 4
var speed
var velocity := Vector2.ZERO
var life := 50
var lives := 4
var primary_weapon
var secondary_weapon
var w1
var w2
var score := 0

signal destroy_all_enemies_bullets
signal kill_all_enemies
signal bombs_changed(bombs)
signal lives_changed(lives)
signal score_changed(score)

# Called when the node enters the scene tree for the first time.
func _ready():
	primary_weapon = load("res://Weapons/PlayerWideBullets/PlayerWideBullets.tscn")
	secondary_weapon = load("res://Weapons/PlayerNarrowBullets/PlayerNarrowBullets.tscn")
	#if weapon == null:
	#	weapon = load("res://Weapons/PlayerWideBullets/PlayerWideBullets.gd")
	w1 = primary_weapon.instance()
	w2 = secondary_weapon.instance()
	add_child(w1)
	add_child(w2)
	speed = base_speed


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
	if not w2.is_shooting():
		if Input.is_action_just_pressed("shoot1") \
		or (Input.is_action_pressed("shoot1") and Input.is_action_just_released("shoot2")):
			speed = w1.player_speed
			w1.start_shooting()
		if Input.is_action_just_released("shoot1"):
			speed = base_speed
			w1.stop_shooting()
	if not w1.is_shooting():
		if Input.is_action_just_pressed("shoot2"):
			speed = w2.player_speed
			w2.start_shooting()
		if Input.is_action_just_released("shoot2"):
			speed = base_speed
			w2.stop_shooting()

	if Input.is_action_pressed("shoot1") and Input.is_action_just_released("shoot2"):
		speed = w1.player_speed
		w1.start_shooting()

	if Input.is_action_pressed("shoot2") and Input.is_action_just_released("shoot1"):
		speed = w2.player_speed
		w2.start_shooting()
		
	if Input.is_action_just_pressed("bomb"):
		bomb()
	
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

func bomb():
	if bombs > 0:
		emit_signal("destroy_all_enemies_bullets")
		emit_signal("kill_all_enemies")
		bombs -= 1
		emit_signal("bombs_changed", bombs)

func hit(damage):
	lives -= 1
	emit_signal("lives_changed", lives)

func _on_score_points(points):
	score += points
	emit_signal("score_changed", score)
