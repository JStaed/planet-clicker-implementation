extends Control

const COST_FACTOR: float = 1.2

var score: int = 0
var score_per_second: int = 0
var score_per_click: int = 1

var cost = [
	50, 500, 100000,
	2500, 50000, 200000
]
var upgrade = [
	1, 5, 100,
	1, 5, 10
]
var level = [
	0, 0, 0,
	0, 0, 0
]

func _ready() -> void:
	update_labels()

func _on_planet_button_pressed() -> void:
	score += score_per_click
	update_labels()


func update_labels() -> void:
	$HBoxContainer/Middle/Score.text = "Score: " + str(score)
	$HBoxContainer/Middle/ScorePerSecond.text = "Score Per Second: " + str(score_per_second)
	$HBoxContainer/Middle/ScorePerClick.text = "Score Per Click: " + str(score_per_click)
	$HBoxContainer/Left/Button.text = str(level[0]) + " Satellite | Cost: " + str(cost[0])

func _on_satellite_button_pressed() -> void:
	if score >= cost[0]:
		score -= cost[0]
		cost[0] = int(floor(COST_FACTOR * cost[0]))
		level[0] += 1
		score_per_second += upgrade[0]
		update_labels()
