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
	health_changed.emit(health, max_health)
	GameEvents.emit_character_hurt(owner, value)
	
	if health == 0:
		out_of_health.emit()
		
	
		
func _log(message: String):
	if debug:
		print(message)

