extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Player_bombs_changed(bombs):
	$MarginBombs/HBoxBombs/Margin2Bombs/HBox2Bombs/MarginBombsValue/BombsValue.text = String(bombs)


func _on_Player_lives_changed(lives):
	$MarginLives/HBoxLives/Margin2Lives/HBox2Lives/MarginLivesValue/LivesValue.text = String(lives)


func _on_Player_score_changed(score):
	$MarginScore/HBoxScore/Margin2Score/HBox2Score/MarginScoreValue/ScoreValue.text = String(score)
