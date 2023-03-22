class_name ArenaTimeManager
extends Node

@export var success_screen_scene: PackedScene

@onready var timer:Timer = $Timer


func get_elapsed_time() -> float:
	return timer.wait_time - timer.time_left


func show_success_screen():
	var success_screen = success_screen_scene.instantiate()
	add_child(success_screen)


func _on_timer_timeout():
	show_success_screen()
