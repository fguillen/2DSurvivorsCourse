extends Node

var experience := 0

func _ready():
	GameEvents.experiece_vial_collected.connect(_on_experiece_vial_collected)


func increase_experience(value: int):
	experience += value
	print(experience)
	
	
func _on_experiece_vial_collected(value: int):
	increase_experience(value)
