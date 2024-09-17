extends Node

signal game_started()
signal score_updated(new_score: Vector2)

var score: Vector2 = Vector2.ZERO

func start_game() -> void:
  emit_signal("score_updated", score)
  emit_signal("game_started")

func update_player_score(player_index: int) -> void:
  score[player_index] += 1
  emit_signal("score_updated", score)