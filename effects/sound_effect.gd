class_name SoundEffect
extends Node2D

@export var random_pitch := false
@export var start_at_random_seek := false
@export var samples: Array[AudioStream]
	

func perform(reparent_and_free := false):
	if samples.is_empty():
		push_warning("SoundEffect.samples is empty")
		return
	
	if random_pitch:
		_audio_stream_player().pitch_scale = randf_range(0.8, 1.2)
	
	_audio_stream_player().stream = _random_sample()
	var starting_seek = 0.0 if not start_at_random_seek else _random_seek()
	print("SoundEffect.play. pitch_scale: ", _audio_stream_player().pitch_scale, ", startin_seek: ", starting_seek, ", reparent_and_free: ", reparent_and_free)
	_audio_stream_player().play(starting_seek)
	
	if reparent_and_free:
		_reparent()
		await _audio_stream_player().finished
		queue_free()


func finish():
	_audio_stream_player().stop()


func _random_seek():
	return randf_range(0.0, _audio_stream_player().stream.get_length())

	
func _random_sample() -> AudioStream:
	return samples.pick_random()


func _audio_stream_player():
	return $AudioStreamPlayer
	

func _reparent():
#	var actual_position = global_position
	var current_scene = get_tree().get_current_scene()
	get_parent().remove_child(self)
	current_scene.add_child(self)
#	global_position = actual_position



func _on_ability_upgrade_card_ability_upgrade_selected():
	pass # Replace with function body.
