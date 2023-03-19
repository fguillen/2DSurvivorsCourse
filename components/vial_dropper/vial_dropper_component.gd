class_name VialDropperComponent
extends Node

# signals
# enums
# constants
# exported variables
@export_range(0, 1) var drop_chance := 0.5
@export var vial_scene: PackedScene

# public variables
# private variables
# onready variables
# optional built-in virtual _init method
# optional built-in virtual _enter_tree() method
# built-in virtual _ready method
# remaining built-in virtual methods
# public methods
func drop(position:Vector2):
	if randf() > drop_chance:
		return
		
	Callable(_drop_deferred).call_deferred(position)
	

# private methods
func _drop_deferred(position:Vector2):
	var vial_instance = vial_scene.instantiate() as Node2D
	owner.get_parent().add_child(vial_instance)
	vial_instance.global_position = position

# subclasses

