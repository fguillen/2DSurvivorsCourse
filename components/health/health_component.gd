class_name HealthComponent
extends Node

@export var max_health: = 10
var health:int

signal died


func _ready():
	health = max_health
	(owner as EnemyBase).hitted.connect(_on_owner_hitted)


func damage(value:int):
	health = max(health - value, 0)
	if health == 0:
		emit_signal("died")
		owner.queue_free()	


func _on_owner_hitted(value:int):
	damage(value)
