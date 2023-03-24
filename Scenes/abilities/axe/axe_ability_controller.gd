# 01. @tool
# 02. class_name
# 03. extends
extends Node

# 04. # docstring
#
# 05. signals
# 06. enums
# 07. constants
# 08. exported variables
@export var axe_ability_scene: PackedScene

# 09. public variables
# 10. private variables
# 11. onready variables
#
# 12. optional built-in virtual _init method
# 13. optional built-in virtual _enter_tree() method
# 14. built-in virtual _ready method
# 15. remaining built-in virtual methods
# 16. public methods
func attack():
	var axe_abilithy := axe_ability_scene.instantiate() as Node2D
	GroupsUtils.foreground_layer.add_child(axe_abilithy)
	axe_abilithy.global_position = GroupsUtils.player.global_position
	axe_abilithy.damage = 10
	
# 17. private methods
# 18. signal listeners
func _on_timer_timeout():
	attack()
	
# 19. subclasses




