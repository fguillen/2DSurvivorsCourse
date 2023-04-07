class_name SoundEffect
extends AudioStreamPlayer2D

@export var random_pitch := false
@export var start_at_random_seek := false
@export var samples: Array[AudioStream]
	

func perform(reparent_and_free := false):
	if samples.is_empty():
		return
	
	if random_pitch:
		pitch_scale = randf_range(0.8, 1.2)
	
	stream = _random_sample()
	var starting_seek = 0.0 if not start_at_random_seek else _random_seek()
	play(starting_seek)
	
	if reparent_and_free:
		_reparent()
		await finished
		queue_free()


func finish():
	stop()


func _random_seek():
	return randf_range(0.0, stream.get_length())

	
func _random_sample() -> AudioStream:
	return samples.pick_random()


func _reparent():
	var actual_position = global_position
	var current_scene = get_tree().get_current_scene()
	get_parent().remove_child(self)
	current_scene.add_child(self)
	global_position = actual_position

