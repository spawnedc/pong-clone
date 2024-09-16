extends StaticBody2D


@export var is_player: bool
@onready var window_size := get_window().size
@onready var size: Vector2 = $ColorRect.size
@onready var half_height := size.y / 2

const PADDLE_SPEED := 500


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if is_player:
		if (Input.is_action_pressed("ui_up")):
			position.y -= PADDLE_SPEED * delta
		elif (Input.is_action_pressed("ui_down")):
			position.y += PADDLE_SPEED * delta

		position.y = clamp(position.y, half_height, window_size.y - half_height)
