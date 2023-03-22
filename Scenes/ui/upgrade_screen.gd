class_name UpgradeScreen
extends CanvasLayer

# @tool
# class_name
# extends
# docstring
# signals
# enums
# constants
# exported variables
@export var ability_upgrade_card_scene:PackedScene

# public variables
# private variables
# onready variables
@onready var ability_upgrade_cards_container:Container = %AbilityUpgradeCards

# optional built-in virtual _init method
# optional built-in virtual _enter_tree() method
# built-in virtual _ready method
# remaining built-in virtual methods
# public methods
func set_ability_upgrades(ability_upgrades:Array[AbilityUpgrade]):
	for ability_upgrade in ability_upgrades:
		var ability_upgrade_card:AbilityUpgradeCard = ability_upgrade_card_scene.instantiate()
		ability_upgrade_cards_container.add_child(ability_upgrade_card)
		ability_upgrade_card.set_ability_upgrade(ability_upgrade)

# private methods
# subclasses

