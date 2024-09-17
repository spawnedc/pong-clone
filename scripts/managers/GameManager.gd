extends Node

signal game_started()
signal score_updated(new_score: Vector2)

var score: Vector2 = Vector2.ZERO

func start_game() -> void:
  score_updated.emit(score)
  game_started.emit()

func update_player_score(player_index: int) -> void:
  score[player_index] += 1
  score_updated.emit(score)
