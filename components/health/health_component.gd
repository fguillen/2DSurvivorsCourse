class_name HealthComponent
extends Node

@export var max_health: = 10
var health:int

signal out_of_health


func _ready():
	health = max_health


func damage(value:int):
	health = max(health - value, 0)
	if health == 0:
		emit_signal("out_of_health")

