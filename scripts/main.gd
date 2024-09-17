extends Node2D

@onready var ball_timer: Timer = $BallTimer
@onready var ball: Ball = $Ball
@onready var bot_player: Player = $Player2
@onready var p1_goal: Area2D = $Player1Goal
@onready var p2_goal: Area2D = $Player2Goal

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	BotManager.ball = ball
	BotManager.bot_player = bot_player
	ball_timer.timeout.connect(_on_ball_timer_timeout)
	p1_goal.body_entered.connect(_on_p1_score)
	p2_goal.body_entered.connect(_on_p2_score)
	ball_timer.start()

func _on_ball_timer_timeout() -> void:
	ball.new_ball()

func _on_p1_score(_collider: Ball) -> void:
	GameManager.update_player_score(0)
	_on_score()

func _on_p2_score(_collider: Ball) -> void:
	GameManager.update_player_score(1)
	_on_score()

func _on_score() -> void:
	ball.speed = 0
	ball_timer.start()
