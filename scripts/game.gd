extends Control

const COST_FACTOR: float = 1.2

var score: int = 500000
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
	$HBoxContainer/Left/Satellite.text = str(level[0]) + " Satellite | Cost: " + str(cost[0])
	$HBoxContainer/Left/Rover.text = str(level[1]) + " Rover | Cost: " + str(cost[1])
	$HBoxContainer/Left/Rocket.text = str(level[2]) + " Rocket | Cost: " + str(cost[2])
	$HBoxContainer/Right/ResearchLab.text = str(level[3]) + " Satellite | Cost: " + str(cost[3])
	$HBoxContainer/Right/Colony.text = str(level[4]) + " Rover | Cost: " + str(cost[4])
	$HBoxContainer/Right/City.text = str(level[5]) + " Rocket | Cost: " + str(cost[5])
	

func purchase_upgrade(id: int) -> void:
	if score >= cost[id]:
		if id < 3:
			score_per_second += upgrade[id]
		else:
			score_per_click += upgrade[id]
		score -= cost[id]
		cost[id] = int(floor(COST_FACTOR * cost[id]))
		level[id] += 1
		update_labels()
		

func _on_satellite_button_pressed() -> void:
	purchase_upgrade(0)

func _on_rover_button_pressed() -> void:
	purchase_upgrade(1)

func _on_rocket_button_pressed() -> void:
	purchase_upgrade(2)

func _on_research_lab_button_pressed() -> void:
	purchase_upgrade(3)

func _on_colony_button_pressed() -> void:
	purchase_upgrade(4)

func _on_city_button_pressed() -> void:
	purchase_upgrade(5)
