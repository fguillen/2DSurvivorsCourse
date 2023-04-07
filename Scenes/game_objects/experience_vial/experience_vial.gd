class_name ExperienceVial
extends Node2D	

signal magnet_started
signal picked

@onready var area_2d = $Area2D
@onready var sprite = $Sprite2D


func _start_collecting():
	var tween = create_tween()
	tween.set_parallel()
	tween.tween_method(_jump_step.bind(global_position), 0.0, 1.0, 0.5)\
		.set_ease(Tween.EASE_IN)\
		.set_trans(Tween.TRANS_BACK)
		
	tween.tween_property(sprite, "scale", Vector2.ZERO, 0.15).set_delay(0.4)
	
	var target_rotation = sprite.rotation
	var player = GroupsUtils.player
	if player:
		target_rotation = (player.global_position - global_position).angle() + deg_to_rad(90)
		
	tween.tween_property(sprite, "rotation", target_rotation, 0.2)
	
	tween.chain()
	tween.tween_callback(_collect)
	
	magnet_started.emit()
	
	
func _collect():
	picked.emit()
	GameEvents.emit_experiece_vial_collected(1)
	queue_free()


func _jump_step(percent: float, start_position: Vector2):
	var player = GroupsUtils.player
	if not player:
		return
		
	global_position = start_position.lerp(player.global_position, percent)
	

func _disable_area():
	area_2d.monitoring = false
	
	
func _on_area_2d_area_entered(area):
	Callable(_disable_area).call_deferred()
	_start_collecting()	
	
	
