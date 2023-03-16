extends Node2D

@export var sword_ability: PackedScene

@onready var _timer := $Timer


func _ready():
	_timer.timeout.connect(_on_timer_timeout)
	
	
func _on_timer_timeout():
	var sword := sword_ability.instantiate() as Node2D
	get_tree().get_root().add_child(sword)
	sword.global_position = global_position
