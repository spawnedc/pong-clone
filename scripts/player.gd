class_name Player
extends StaticBody2D


@export var is_player: bool
@onready var window_size := get_window().size
@onready var color_rect: ColorRect = $ColorRect
@onready var half_height := color_rect.size.y / 2
@onready var ball: Ball = %Ball

const PADDLE_SPEED := 500

func _process(delta: float) -> void:
	if is_player:
		if (Input.is_action_pressed("ui_up")):
			position.y -= PADDLE_SPEED * delta
		elif (Input.is_action_pressed("ui_down")):
			position.y += PADDLE_SPEED * delta
	else:
		var dist := position.y - ball.position.y

		var move_by := dist
		
		if abs(dist) > PADDLE_SPEED * delta:
			move_by = PADDLE_SPEED * delta * (dist / abs(dist))

		position.y -= move_by

	position.y = clamp(position.y, half_height, window_size.y - half_height)

func get_height() -> float:
	return color_rect.size.y