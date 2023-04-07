class_name UpgradeScreen
extends CanvasLayer

# @tool
# class_name
# extends
# docstring
# signals
signal ability_upgrade_selected(ability_upgrade: AbilityUpgrade)

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
func _ready():
	get_tree().paused = true


# remaining built-in virtual methods
# public methods
func set_ability_upgrades(ability_upgrades: Array[AbilityUpgrade]):
	var delay = 0
	for ability_upgrade in ability_upgrades:
		var ability_upgrade_card:AbilityUpgradeCard = ability_upgrade_card_scene.instantiate()
		ability_upgrade_cards_container.add_child(ability_upgrade_card)
		ability_upgrade_card.ability_upgrade = ability_upgrade
		ability_upgrade_card.ability_upgrade_selected.connect(_on_ability_upgrade_selected)
		ability_upgrade_card.animation_in(delay)
		delay += 0.2


# private methods
func _on_ability_upgrade_selected(ability_upgrade: AbilityUpgrade):
	emit_signal("ability_upgrade_selected", ability_upgrade)
	get_tree().paused = false
	queue_free()


# subclasses
