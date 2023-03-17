extends CanvasLayer

@export var arena_time_manager: ArenaTimeManager
@onready var time_label:Label = %TimeLabel


func _process(delta):
	var elapsed_time = arena_time_manager.get_elapsed_time()
	var elapsed_time_formatted = _format_seconds_to_string(elapsed_time)
	time_label.text = elapsed_time_formatted


func _format_seconds_to_string(value: int) -> String:
	var seconds = value%60
	var minutes = (value/60)%60

	return "%02d:%02d" % [minutes, seconds]
