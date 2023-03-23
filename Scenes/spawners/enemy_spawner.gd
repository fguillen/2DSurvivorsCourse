extends Node2D

const SPAWN_RADIOUS = 320

@export var enemy_scene: PackedScene

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
		
	# Random point in circle
	var random_direction = Vector2.RIGHT.rotated(randf_range(0, TAU))
	var random_position = GroupsUtils.player.global_position + (random_direction * SPAWN_RADIOUS)
	
	# Instantiate
	var enemy_instance = enemy_scene.instantiate()
	GroupsUtils.entities_layer.add_child(enemy_instance)
	enemy_instance.global_position = random_position


func _on_timer_timeout():
	spawn()
