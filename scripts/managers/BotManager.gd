extends Node

@onready var window_size := get_window().size

var ball: Ball
var bot_player: Player

func calculate_paddle_y_position(delta: float) -> float:
	var dist := bot_player.position.y - ball.position.y

	var move_by := dist

	if abs(dist) > Constants.DEFAULT_PADDLE_SPEED * delta:
		move_by = Constants.DEFAULT_PADDLE_SPEED * delta * (dist / abs(dist))

	return move_by
