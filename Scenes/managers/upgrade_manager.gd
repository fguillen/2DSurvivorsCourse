class_name UpgradeManager
extends Node

# docstring
# signals
# enums
# constants
# exported variables
@export var default_upgrade: AbilityUpgrade
@export var upgrade_pool: WeightedTable
@export var num_upgrades_shown := 3
@export var upgrade_screen_scene:PackedScene

# public variables
var current_upgrades = {}

# private variables
var _original_upgrade_pool: WeightedTable

# onready variables
# optional built-in virtual _init method

# optional built-in virtual _enter_tree() method
# built-in virtual _ready method
func _ready():
	_original_upgrade_pool = upgrade_pool.duplicate()
	_clean_upgrade_pool()
	Callable(func(): _apply_ability_upgrade(default_upgrade)).call_deferred()
	
	
# remaining built-in virtual methods
# public methods
func show_upgrade_screen(current_level:int):
	# Picking ability upgrades
	var ability_upgrades_chosen = _pick_random_upgrades(num_upgrades_shown)
	if ability_upgrades_chosen.size() == 0:
		push_warning("UpgradeManager not available ability upgrades")
		return
		
	# setup UpgradeScreen
	var upgrade_screen:UpgradeScreen = upgrade_screen_scene.instantiate()
	add_child(upgrade_screen)
	upgrade_screen.connect("ability_upgrade_selected", _apply_ability_upgrade)
	
	# setup upgrades
	upgrade_screen.set_ability_upgrades(ability_upgrades_chosen)
	

# private methods
func _pick_random_upgrades(quantity: int = 2) -> Array[AbilityUpgrade]:
	var result: Array[AbilityUpgrade] = [] 
	for i in upgrade_pool.pick_many(quantity, false):
		result.append(i as AbilityUpgrade)
	
	return result
	
		
func _apply_ability_upgrade(ability_upgrade:AbilityUpgrade):
	if not current_upgrades.has(ability_upgrade["id"]):
		current_upgrades[ability_upgrade["id"]] = {
			"resource": ability_upgrade,
			"quantity": 1
		}
	else:
		current_upgrades[ability_upgrade["id"]]["quantity"] += 1
		
	_clean_upgrade_pool()
	
	GameEvents.emit_ability_upgrade_added(ability_upgrade)


func _clean_upgrade_pool():
	# Filter out by max_quantity
	var clean_table = _original_upgrade_pool.table
	clean_table = clean_table.filter(
		func(e):
			if not current_upgrades.has(e.content["id"]):
				return true
			else:
				return current_upgrades[e.content["id"]]["quantity"] < e.content.max_quantity
	)	
	
	# Filter out by required_id
	clean_table = clean_table.filter(
		func(e):
			if e.content["required_id"] == "":
				return true
			else:
				return current_upgrades.has(e.content["required_id"])
	)
	
	upgrade_pool.table = clean_table
	
	
# subclasses

