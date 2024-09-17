extends CanvasLayer

@onready var p1_score_label: Label = %ScorePlayer1
@onready var p2_score_label: Label = %ScorePlayer2


func _ready() -> void:
	GameManager.score_updated.connect(_update_score)

func _update_score(score: Vector2) -> void:
	p1_score_label.text = str(score[0])
	p2_score_label.text = str(score[1])
