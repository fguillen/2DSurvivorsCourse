class_name HurtboxComponent
extends Area2D

# docstring
# signals
signal got_hurt(value:int)

# enums
# constants
# exported variables
@export_range(0.0, 10.0) var damage_interval := 1.0

# public variables
# private variables
var _hurting_entities = {}

# onready variables
# optional built-in virtual _init method
# optional built-in virtual _enter_tree() method
# built-in virtual _ready method
# remaining built-in virtual methods
# public methods
# private methods
# subclasses

func _add_hurting_entity(hurting_entity):
	var timer := Timer.new()
	add_child(timer)
	timer.one_shot = false
	timer.wait_time = damage_interval
	timer.start()
	timer.connect("timeout", _cause_damage.bind(hurting_entity.damage))
	
	_hurting_entities[hurting_entity.get_instance_id()] = {
		"timer": timer,
		"entity": hurting_entity
	}
	
	_cause_damage(hurting_entity.damage)
	

func _remove_hurting_entity(hurting_entity):
	if not _hurting_entities.has(hurting_entity.get_instance_id()):
		push_warning("HurtboxComponent.remove_hurting_entity doesn't exist: ", hurting_entity.get_instance_id())
	
	var timer = _hurting_entities[hurting_entity.get_instance_id()]["timer"]
	timer.stop()
	remove_child(timer)
	
	_hurting_entities.erase(hurting_entity.get_instance_id())
	

func _cause_damage(value: int):
	emit_signal("got_hurt", value)
	

func _on_area_entered(area):
	if area.owner.damage:
		_add_hurting_entity(area.owner)


func _on_body_entered(body):
	if body.damage:
		_add_hurting_entity(body)
	

func _on_area_exited(area):
	if area.owner.damage:
		_remove_hurting_entity(area.owner)


func _on_body_exited(body):
	if body.damage:
		_remove_hurting_entity(body)
