extends Control


var score: int = 0
var score_per_second: int = 0
var score_per_click: int = 1

func _ready() -> void:
	update_labels()

func _on_planet_button_pressed() -> void:
	score += score_per_click
	update_labels()


func update_labels() -> void:
	$HBoxContainer/Middle/Score.text = "Score: " + str(score)
	$HBoxContainer/Middle/ScorePerSecond.text = "Score Per Second: " + str(score_per_second)
	$HBoxContainer/Middle/ScorePerClick.text = "Score Per Clikc: " + str(score_per_click)
