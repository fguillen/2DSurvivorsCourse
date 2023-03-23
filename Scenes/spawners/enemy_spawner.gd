extends Node2D

const SPAWN_RADIOUS = 320

@export var enemy_scene: PackedScene
@export_flags_2d_physics var wall_layer_mask

@onready var _timer: Timer = $Timer

var _default_interval: float
var _min_interval := 0.1
var _max_difficulty := 10

func _ready():
	_default_interval = _timer.wait_time


func set_difficulty_level(difficulty_level: int):
	_timer.wait_time = lerp(_default_interval, _min_interval, difficulty_level / float(_max_difficulty))
	print("EnemySpawner.wait_time: ", _timer.wait_time)


func spawn():
	if not GroupsUtils.player:
		return
		
	var spawn_position := _calculate_spawn_position()
	
	# Instantiate
	var enemy_instance = enemy_scene.instantiate()
	GroupsUtils.entities_layer.add_child(enemy_instance)
	enemy_instance.global_position = spawn_position


func _calculate_spawn_position() -> Vector2:
	# Random point in circle
	var random_direction = Vector2.RIGHT.rotated(randf_range(0, TAU))
	var random_position: Vector2
	var query := PhysicsRayQueryParameters2D.create(GroupsUtils.player.global_position, random_position, wall_layer_mask)
	
	for i in 4:
		random_position = GroupsUtils.player.global_position + (random_direction * SPAWN_RADIOUS)
		query.to = random_position
		var cast_result = get_world_2d().direct_space_state.intersect_ray(query)
		if cast_result.is_empty():
			return random_position
		else:
			random_direction = random_direction.rotated(deg_to_rad(90))
	
	push_warning("EnemySpawner. Not visible random Enemy Position not found")
	return random_position

func _on_timer_timeout():
	spawn()
