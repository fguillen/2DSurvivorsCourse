class_name HurtboxComponent
extends Area2D

# docstring
# signals
signal got_hurt(value:int)

# enums
# constants
# exported variables
# public variables
# private variables
# onready variables
# optional built-in virtual _init method
# optional built-in virtual _enter_tree() method
# built-in virtual _ready method
# remaining built-in virtual methods
# public methods
# private methods
# subclasses



func _on_area_entered(area):
	if not area.owner.damage:
		return
	
	emit_signal("got_hurt", area.owner.damage)
