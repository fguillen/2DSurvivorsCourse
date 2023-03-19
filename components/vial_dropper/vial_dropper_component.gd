class_name VialDropperComponent
extends Node

# signals
# enums
# constants
# exported variables
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
	var vial_instance = vial_scene.instantiate() as Node2D
	owner.get_parent().add_child(vial_instance)
	vial_instance.global_position = position

# private methods
# subclasses

