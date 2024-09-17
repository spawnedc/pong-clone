class_name Player
extends CharacterBody2D

@export var is_player: bool

@onready var color_rect: ColorRect = $ColorRect


func _physics_process(delta: float) -> void:
	if is_player:
		var dist := Constants.DEFAULT_PADDLE_SPEED
		var dir := Input.get_axis("ui_up", "ui_down")
		velocity.y = dir * dist
	else:
		position.y -= BotManager.calculate_paddle_y_position(delta)

	move_and_slide()


func get_height() -> float:
	return color_rect.size.y
