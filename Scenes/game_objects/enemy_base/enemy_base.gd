class_name EnemyBase
extends CharacterBody2D

signal died(position)

@export var max_speed := 40
@export var acceleration := 10.0
@export var damage := 1
	
var direction := Vector2.ZERO

	
func die():
	emit_signal("died", global_position)
	queue_free()	


func _physics_process(delta: float):		
	if GroupsUtils.player:
		_move_towards_player(delta)
	
	
func _get_direction_to_player() -> Vector2:
	if GroupsUtils.player: 
		return (GroupsUtils.player.global_position - global_position).normalized()
	else:
		return Vector2.ZERO
			

func _move_towards_player(delta: float):
	direction = _get_direction_to_player()
	var desired_velocity = direction * max_speed
	velocity = velocity.lerp(desired_velocity, acceleration * delta)
	move_and_slide()


