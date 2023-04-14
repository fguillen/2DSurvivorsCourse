class_name ArenaTimeManager
extends Node

signal time_completed()

@onready var timer:Timer = $Timer


func get_elapsed_time() -> float:
	return timer.wait_time - timer.time_left


func _on_timer_timeout():
	GameEvents.emit_game_ended()
	emit_signal("time_completed")
