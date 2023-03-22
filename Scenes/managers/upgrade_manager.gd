class_name UpgradeManager
extends Node

# docstring
# signals
# enums
# constants
# exported variables
@export var upgrade_pool: Array[AbilityUpgrade]
@export var upgrade_screen_scene:PackedScene

# public variables
var current_upgrades = {}

# private variables
# onready variables
# optional built-in virtual _init method
# optional built-in virtual _enter_tree() method
# built-in virtual _ready method
# remaining built-in virtual methods
# public methods
func show_upgrade_screen(current_level:int):
	var ability_upgrade = upgrade_pool.pick_random()
	
	var upgrade_screen:UpgradeScreen = upgrade_screen_scene.instantiate()
	add_child(upgrade_screen)
	upgrade_screen.set_ability_upgrades([ability_upgrade])
	
	
func add_ability_upgrade(ability_upgrade:AbilityUpgrade):
	if not current_upgrades.has(ability_upgrade["id"]):
		current_upgrades[ability_upgrade["id"]] = {
			"resource": ability_upgrade,
			"quantity": 1
		}
	else:
		current_upgrades[ability_upgrade["id"]]["quantity"] += 1
		
	print("UpgradeManager.current_upgrades: ", current_upgrades)
# private methods
# subclasses

