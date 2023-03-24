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
	if upgrade_pool.size() == 0:
		push_warning("UpgradeManager.upgrade_pool.size() == 0")
		return
		
	# setup UpgradeScreen
	var upgrade_screen:UpgradeScreen = upgrade_screen_scene.instantiate()
	add_child(upgrade_screen)
	upgrade_screen.connect("ability_upgrade_selected", _apply_ability_upgrade)
	
	# setup upgrades
	var ability_upgrades_chosen = _pick_random_upgrades()
	upgrade_screen.set_ability_upgrades(ability_upgrades_chosen)
	

# private methods
func _pick_random_upgrades(quantity: int = 2) -> Array[AbilityUpgrade]:
	var ability_upgrades_chosen = upgrade_pool.duplicate()
	ability_upgrades_chosen.shuffle()
	ability_upgrades_chosen = ability_upgrades_chosen.slice(0, quantity)
		
	return ability_upgrades_chosen
	
		
func _apply_ability_upgrade(ability_upgrade:AbilityUpgrade):
	if not current_upgrades.has(ability_upgrade["id"]):
		current_upgrades[ability_upgrade["id"]] = {
			"resource": ability_upgrade,
			"quantity": 1
		}
	else:
		current_upgrades[ability_upgrade["id"]]["quantity"] += 1
		
	GameEvents.emit_ability_upgrade_added(ability_upgrade)
	
	
# subclasses

