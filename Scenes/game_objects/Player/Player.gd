class_name Player
extends CharacterBody2D

@export var base_speed := 90.0
@export var acceleration := 15.0

signal has_died()

@onready var animation_player: AnimationPlayer = $AnimationPlayer
var direction := Vector2.ZERO

var _actual_speed := 0.0

func _ready():
	_actual_speed = base_speed
	GameEvents.ability_upgrade_added.connect(_on_ability_upgrade_added)

func _physics_process(delta):
	direction = _get_direction()
	var target_velocity = direction * _actual_speed
	velocity = velocity.lerp(target_velocity, acceleration * delta)
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
		

func _on_ability_upgrade_added(ability_upgrade: AbilityUpgrade):
	if ability_upgrade.id == "player_speed":
		_actual_speed += _actual_speed * 0.1
		print("Player._actual_speed: ", _actual_speed)
