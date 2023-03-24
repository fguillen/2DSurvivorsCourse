# 01. @tool
# 02. class_name
class_name AxeAbility
# 03. extends
extends Node2D

# 04. # docstring
#
# 05. signals
# 06. enums
# 07. constants
# 08. exported variables
@export var num_rotations := 2
@export var rotations_time := 3.0
@export var max_radius := 100

# 09. public variables
var damage: int = 0

# 10. private variables
var _rotation := 0.0
var _radius := 0.0
var _ini_direction: Vector2

# 11. onready variables
#
# 12. optional built-in virtual _init method
# 13. optional built-in virtual _enter_tree() method
# 14. built-in virtual _ready method
func _ready():
	_ini_direction = Vector2.RIGHT.rotated(randf_range(0.0, TAU))
	
	var tween = create_tween().set_parallel()
	tween.tween_property(self, "_rotation", num_rotations, rotations_time).set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_LINEAR)
	tween.tween_property(self, "_radius", max_radius, rotations_time).set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_QUART)
	tween.chain().tween_callback(queue_free)
	
	
# 15. remaining built-in virtual methods
func _physics_process(delta):
	_rotate()
	
# 16. public methods
# 17. private methods
func _rotate():
	if not is_instance_valid(GroupsUtils.player):
		return
		
	var direction = _ini_direction.rotated(_rotation * TAU)
	global_position = GroupsUtils.player.global_position + (direction * _radius)
	
# 18. signal listeners
# 19. subclasses

