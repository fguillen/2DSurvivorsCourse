class_name HealthComponent
extends Node

@export var max_health: = 10
@export var debug: = false
var health:int

signal out_of_health
signal health_changed(current_health: int, max_health: int)


func _ready():
	health = max_health
	emit_signal("health_changed", health, max_health)


func damage(value:int):
	health = max(health - value, 0)
	_log("%s.HealthComponent.damage: %d, health: %d" % [owner.name, value, health])
	emit_signal("health_changed", health, max_health)
	
	if health == 0:
		emit_signal("out_of_health")
	
		
func _log(message: String):
	if debug:
		print(message)

