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
var collision: KinematicCollision2D

func new_ball() -> void:
	position.x = window_size.x / 2.0
	position.y = randi_range(200, window_size.y - 200)
	speed = START_SPEED
	dir = random_direction()

func _process(delta: float) -> void:
	collision = move_and_collide(dir * speed * delta)

func _physics_process(_delta: float) -> void:
	if collision:
		var collider: PhysicsBody2D = collision.get_collider()
		if collider.collision_layer == PLAYER:
			speed += ACCELERATION
			dir = CollisionManager.handle_ball_to_player_collision(collider as Player, dir)
		else:
			dir = CollisionManager.handle_ball_to_wall_collision(collision, dir)

func random_direction() -> Vector2:
	var new_dir := Vector2()
	new_dir.x = [1, -1].pick_random()
	new_dir.y = randf_range(-1, 1)
	return new_dir.normalized()
