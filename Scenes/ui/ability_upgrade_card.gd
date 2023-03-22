class_name AbilityUpgradeCard
extends Panel

# @tool
# class_name
# extends
# docstring
# signals
# enums
# constants
# exported variables
# public variables
# private variables
# onready variables
@onready var name_label:Label = %NameLabel
@onready var description_label:Label = %DescriptionLabel

# optional built-in virtual _init method
# optional built-in virtual _enter_tree() method
# built-in virtual _ready method
# remaining built-in virtual methods
# public methods
func set_ability_upgrade(ability_upgrade: AbilityUpgrade):
	name_label.text = ability_upgrade.name	
	description_label.text = ability_upgrade.description

# private methods
# subclasses

