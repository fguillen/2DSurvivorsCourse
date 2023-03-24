# 01. @tool
# 02. class_name
# 03. extends
extends Node2D

# 04. # docstring
#
# 05. signals
# 06. enums
# 07. constants
# 08. exported variables
@export var direction_object: Node


# 09. public variables
# 10. private variables
# 11. onready variables
#
# 12. optional built-in virtual _init method
# 13. optional built-in virtual _enter_tree() method
# 14. built-in virtual _ready method
# 15. remaining built-in virtual methods
func _process(delta):
	flip_towards(direction_object.direction)
	
	
# 16. public methods
func flip_towards(direction: Vector2):
	var horizontal_sign = sign(direction.x)
	if not horizontal_sign == 0:
		scale = Vector2(horizontal_sign, 1)
		
		
# 17. private methods
# 18. signal listeners
# 19. subclasses

