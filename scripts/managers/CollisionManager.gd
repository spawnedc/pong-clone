extends Node

var ball: Ball

func handle_ball_to_wall_collision(collision: KinematicCollision2D, current_dir: Vector2) -> Vector2:
	return current_dir.bounce(collision.get_normal())

func handle_ball_to_player_collision(collider: Player, current_dir: Vector2) -> Vector2:
	var pad_y := collider.position.y
	var dist := ball.position.y - pad_y
	var new_dir := Vector2()

	if current_dir.x > 0:
		new_dir.x = -1
	else:
		new_dir.x = 1

	new_dir.y = dist / (collider.get_height() / 2)

	return new_dir.normalized()
