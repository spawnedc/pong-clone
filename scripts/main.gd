extends Node2D

@onready var ball_timer: Timer = $BallTimer
@onready var ball: Ball = $Ball

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	ball_timer.timeout.connect(_on_ball_timer_timeout)

func _on_ball_timer_timeout() -> void:
	ball.new_ball()
