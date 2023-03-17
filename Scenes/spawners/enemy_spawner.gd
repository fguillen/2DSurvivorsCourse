extends Node2D

const SPAWN_RADIOUS = 320

@export var enemy_scene: PackedScene


func spawn():
	var player = get_tree().get_first_node_in_group("player") as Node2D
	if not player:
		return
		
	# Random point in circle
	var random_direction = Vector2.RIGHT.rotated(randf_range(0, TAU))
	var random_position = player.global_position + (random_direction * SPAWN_RADIOUS)
	
	# Instantiate
	var enemy_instance = enemy_scene.instantiate()
	get_tree().get_root().add_child(enemy_instance)
	enemy_instance.global_position = random_position


func _on_timer_timeout():
	spawn()
