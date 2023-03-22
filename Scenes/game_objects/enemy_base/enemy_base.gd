class_name EnemyBase
extends CharacterBody2D

signal died(position)


const MAX_SPEED = 40

@export var damage := 1
	
	
func die():
	emit_signal("died", global_position)
	queue_free()	


func _physics_process(delta):		
	if GroupsUtils.player:
		_move_towards_player()
	
	
func _get_direction_to_player() -> Vector2:
	if GroupsUtils.player: 
		return (GroupsUtils.player.global_position - global_position).normalized()
	else:
		return Vector2.ZERO
			

func _move_towards_player():
	var direction = _get_direction_to_player()
	velocity = direction * MAX_SPEED
	move_and_slide()


