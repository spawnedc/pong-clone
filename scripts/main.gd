extends Node2D

@onready var ball_timer: Timer = $BallTimer
@onready var ball: Ball = $Ball
@onready var p1_goal: Area2D = $Player1Goal
@onready var p2_goal: Area2D = $Player2Goal
@onready var p1_score_label: Label = %ScorePlayer1
@onready var p2_score_label: Label = %ScorePlayer2

var score: Vector2 = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	ball_timer.timeout.connect(_on_ball_timer_timeout)
	p1_goal.body_entered.connect(_on_p1_score)
	p2_goal.body_entered.connect(_on_p2_score)

func _on_ball_timer_timeout() -> void:
	ball.new_ball()

func _on_p1_score(_collider: Ball) -> void:
	score[0] += 1
	_on_score()

func _on_p2_score(_collider: Ball) -> void:
	score[1] += 1
	_on_score()

func _on_score() -> void:
	_update_score()
	ball.speed = 0
	ball_timer.start()

func _update_score() -> void:
	p1_score_label.text = str(score[0])
	p2_score_label.text = str(score[1])