class_name Ball
extends CharacterBody2D

@onready var window_size := get_window().size

const START_SPEED := 300.0
const ACCELERATION := 50
const WALL := 2
const PLAYER := 1
const MAX_Y_VECTOR: float = 0.6

var speed := START_SPEED
var dir: Vector2

func new_ball() -> void:
	#randomize start position and direction
	position.x = window_size.x / 2.0
	position.y = randi_range(200, window_size.y - 200)
	speed = START_SPEED
	dir = random_direction()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	var collision := move_and_collide(dir * speed * delta)
	if collision:
		var collider: StaticBody2D = collision.get_collider()
		#if ball hits paddle
		if collider.collision_layer == PLAYER:
			speed += ACCELERATION
			dir = new_direction(collider as Player)
		#if it hits a wall
		else:
			dir = dir.bounce(collision.get_normal())

func random_direction() -> Vector2:
	var new_dir := Vector2()
	new_dir.x = [1, -1].pick_random()
	new_dir.y = randf_range(-1, 1)
	return new_dir.normalized()

func new_direction(collider: Player) -> Vector2:
	var ball_y := position.y
	var pad_y := collider.position.y
	var dist := ball_y - pad_y
	var new_dir := Vector2()
	
	#flip the horizontal direction
	if dir.x > 0:
		new_dir.x = -1
	else:
		new_dir.x = 1

	new_dir.y = (dist / (collider.get_height() / 2)) * MAX_Y_VECTOR

	return new_dir.normalized()
