class_name Player
extends StaticBody2D


@export var is_player: bool
@onready var window_size := get_window().size
@onready var color_rect: ColorRect = $ColorRect
@onready var half_height := color_rect.size.y / 2


func _process(delta: float) -> void:
	if is_player:
		var dist := Constants.DEFAULT_PADDLE_SPEED * delta
		if (Input.is_action_pressed("ui_up")):
			position.y -= dist
		elif (Input.is_action_pressed("ui_down")):
			position.y += dist
	else:
		position.y -= BotManager.calculate_paddle_y_position(delta)

	position.y = clamp(position.y, half_height, window_size.y - half_height)

func get_height() -> float:
	return color_rect.size.y
