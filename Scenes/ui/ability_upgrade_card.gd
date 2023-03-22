class_name AbilityUpgradeCard
extends Panel

# @tool
# class_name
# extends
# docstring
# signals
signal ability_upgrade_selected(ability_upgrade: AbilityUpgrade)

# enums
# constants
# exported variables
# public variables
var ability_upgrade: AbilityUpgrade : set = _set_ability_upgrade

# private variables
# onready variables
@onready var name_label: Label = %NameLabel
@onready var description_label: Label = %DescriptionLabel

# optional built-in virtual _init method
# optional built-in virtual _enter_tree() method
# built-in virtual _ready method
# remaining built-in virtual methods
# public methods

# private methods
func _set_ability_upgrade(value: AbilityUpgrade):
	ability_upgrade = value
	name_label.text = ability_upgrade.name	
	description_label.text = ability_upgrade.description


func _on_selected():
	emit_signal("ability_upgrade_selected", ability_upgrade)	
	
	
func _on_gui_input(event: InputEvent):
	if event.is_action_pressed("mouse_left"):
		_on_selected()


# subclasses


