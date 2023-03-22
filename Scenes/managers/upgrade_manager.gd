class_name UpgradeManager
extends Node

# docstring
# signals
# enums
# constants
# exported variables
@export var upgrade_pool: Array[AbilityUpgrade]

# public variables
var current_upgrades = {}

# private variables
# onready variables
# optional built-in virtual _init method
# optional built-in virtual _enter_tree() method
# built-in virtual _ready method
# remaining built-in virtual methods
# public methods
func get_upgrade(current_level:int):
	var random_upgrade = upgrade_pool.pick_random()
	
	if not current_upgrades.has(random_upgrade["id"]):
		current_upgrades[random_upgrade["id"]] = {
			"resource": random_upgrade,
			"quantity": 1
		}
	else:
		current_upgrades[random_upgrade["id"]]["quantity"] += 1
		
	print("UpgradeManager.current_upgrades: ", current_upgrades)
# private methods
# subclasses

