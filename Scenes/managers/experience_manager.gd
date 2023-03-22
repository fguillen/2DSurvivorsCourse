extends Node

signal experience_updated(current:int, target:int)
signal level_increased(current_level:int)

const TARGET_GROWTH := 5

var level := 1
var target := 5
var experience := 0 : set = _set_experience


func _ready():
	GameEvents.experiece_vial_collected.connect(_on_experiece_vial_collected)


func increase_experience(value: int):
	self.experience = min(experience + value, target)
	if experience == target:
		increase_level()
	
	
func increase_level():
	level += 1
	target += TARGET_GROWTH
	experience = 0
	emit_signal("level_increased", level)
	
	
func _on_experiece_vial_collected(value: int):
	increase_experience(value)


func _set_experience(value:int):
	experience = value
	emit_signal("experience_updated", experience, target)
