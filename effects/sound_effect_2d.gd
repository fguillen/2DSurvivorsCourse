class_name SoundEffect2D
extends SoundEffect


func _audio_stream_player():
	return $AudioStreamPlayer2D


func _reparent():
	var actual_position = global_position
	var current_scene = get_tree().get_current_scene()
	get_parent().remove_child(self)
	current_scene.add_child(self)
	global_position = actual_position

