class_name Player
extends CharacterBody2D

const MAX_SPEED = 120
const ACCELERATION = 15

signal has_died()

@onready var animation_player: AnimationPlayer = $AnimationPlayer
var direction := Vector2.ZERO


func _physics_process(delta):
	direction = _get_direction()
	var target_velocity = direction * MAX_SPEED
	velocity = velocity.lerp(target_velocity, ACCELERATION * delta)
#	velocity = velocity.lerp(target_velocity, 1 - exp(-delta * ACCELERATION)
	move_and_slide()
	_update_animation()


func die():
	emit_signal("has_died")
	queue_free()
	

func _get_direction() -> Vector2:
	var x_movement = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	var y_movement = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	return Vector2(x_movement, y_movement).normalized()
	

func _update_animation():
	if direction.length() > 0:
		animation_player.play("walk")
	else:
		animation_player.play("RESET")
		
