class_name EnemyBase
extends CharacterBody2D

signal died(position)

@export var max_speed := 40
@export var acceleration := 10.0
@export var damage := 1
	
var direction := Vector2.ZERO
var is_moving := true : set = set_is_moving

	
func die():
	emit_signal("died", global_position)
	queue_free()	


func set_is_moving(value: bool):
	is_moving = value


func _physics_process(delta: float):		
	if GroupsUtils.player and is_moving:
		_move_towards_player()
	else:
		_decelerate()
		
	_move(delta)
	
	
func _get_direction_to_player() -> Vector2:
	if GroupsUtils.player: 
		return (GroupsUtils.player.global_position - global_position).normalized()
	else:
		return Vector2.ZERO
			

func _move_towards_player():
	direction = _get_direction_to_player()
	
	
func _decelerate():
	direction = Vector2.ZERO


func _move(delta: float):
	var desired_velocity = direction * max_speed
	velocity = velocity.lerp(desired_velocity, acceleration * delta)
	move_and_slide()

