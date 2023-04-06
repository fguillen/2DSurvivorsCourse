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
@export var base_damage := 10

# 09. public variables
# 10. private variables
var _initial_wait_time:float
var _actual_damage: int

# 11. onready variables
@onready var _timer := $Timer
#
# 12. optional built-in virtual _init method
# 13. optional built-in virtual _enter_tree() method
# 14. built-in virtual _ready method
func _ready():
	_actual_damage = base_damage
	_initial_wait_time = _timer.wait_time
	GameEvents.ability_upgrade_added.connect(_on_ability_upgrade_added)
	
	
# 15. remaining built-in virtual methods
# 16. public methods
func attack():
	var axe_abilithy := axe_ability_scene.instantiate() as Node2D
	GroupsUtils.foreground_layer.add_child(axe_abilithy)
	axe_abilithy.global_position = GroupsUtils.player.global_position
	axe_abilithy.damage = _actual_damage
	
# 17. private methods
# 18. signal listeners
func _on_timer_timeout():
	attack()
	
func _on_ability_upgrade_added(ability_upgrade: AbilityUpgrade):
	if ability_upgrade.id == "axe_rate":
		_timer.wait_time = _timer.wait_time * (1.0 - 0.1)
		print("AxeAbilityController.timer.wait_time: ", _timer.wait_time)
	elif ability_upgrade.id == "axe_damage":
		_actual_damage = ceil(_actual_damage * (1.0 + 0.15))
		print("AxeAbilityController.damage: ", _actual_damage)
	
	
# 19. subclasses




