extends CharacterBody2D

const MAX_SPEED = 200


func _process(delta):
	var direction = _get_direction()
	velocity = direction * MAX_SPEED
	move_and_slide()
	

func _get_direction() -> Vector2:
	var x_movement = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	var y_movement = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	return Vector2(x_movement, y_movement).normalized()
