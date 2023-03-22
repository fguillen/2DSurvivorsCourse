extends Node2D

const SPAWN_RADIOUS = 320

@export var enemy_scene: PackedScene


func spawn():
	if not GroupsUtils.player:
		return
		
	# Random point in circle
	var random_direction = Vector2.RIGHT.rotated(randf_range(0, TAU))
	var random_position = GroupsUtils.player.global_position + (random_direction * SPAWN_RADIOUS)
	
	# Instantiate
	var enemy_instance = enemy_scene.instantiate()
	GroupsUtils.entities_layer.add_child(enemy_instance)
	enemy_instance.global_position = random_position


func _on_timer_timeout():
	spawn()
