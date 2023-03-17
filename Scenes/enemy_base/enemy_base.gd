class_name EnemyBase
extends CharacterBody2D

const MAX_SPEED = 75
var player:Node2D

func _ready():
	get_tree().get_root().connect("ready", _setup_player)
	
	
func _process(delta):
	if player:
		_move_towards_player()
	
	
func _get_direction_to_player() -> Vector2:
	if player: 
		return (player.global_position - global_position).normalized()
	else:
		return Vector2.ZERO
	

func _setup_player():
	print("CharacterBody2D._setup_player()")
	player = get_tree().get_first_node_in_group("player") as Node2D
		

func _move_towards_player():
	var direction = _get_direction_to_player()
	velocity = direction * MAX_SPEED
	move_and_slide()
	


func _on_hit_area_area_entered(area):
	queue_free()
