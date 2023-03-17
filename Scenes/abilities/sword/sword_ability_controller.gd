extends Node2D

const MAX_RANGE = 150

@export var sword_ability: PackedScene

@onready var _timer := $Timer


func _ready():
	_timer.timeout.connect(_on_timer_timeout)
	
	
func attack():
	# Get closest enemy
	var closest_enemy := _get_closest_enemy()
	if not closest_enemy:
		return
	
	# Instantiate sword
	var sword := sword_ability.instantiate() as Node2D
	get_tree().get_root().add_child(sword)
	
	# Position and rotation
	sword.global_position = closest_enemy.global_position
	sword.global_position += Vector2.RIGHT.rotated(randf_range(0.0, TAU)) * 4 # Position offset
	
	var enemy_direction = closest_enemy.global_position - sword.global_position
	sword.rotation = enemy_direction.angle()
	
	
func _on_timer_timeout():
	attack()
	
	
func _get_closest_enemy() -> EnemyBase:
	var enemies = get_tree().get_nodes_in_group("enemy")
	enemies = enemies.filter(_is_in_range)
	
	if enemies.size() == 0:
		return null
		
	enemies.sort_custom(_distance_comparator)
	return enemies[0]


func _is_in_range(node: Node2D):
	return node.global_position.distance_squared_to(global_position) < pow(MAX_RANGE, 2)
	
	
func _distance_comparator(a: Node2D, b: Node2D):
	var a_distance = a.global_position.distance_squared_to(global_position)
	var b_distance = b.global_position.distance_squared_to(global_position)
	return a_distance < b_distance
