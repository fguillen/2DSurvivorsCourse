# 01. @tool
# 02. class_name
class_name AbilitiesInventoryComponent
# 03. extends
extends Node2D

# 04. # docstring
#
# 05. signals
# 06. enums
# 07. constants
# 08. exported variables
# 09. public variables
# 10. private variables
# 11. onready variables
#
# 12. optional built-in virtual _init method
# 13. optional built-in virtual _enter_tree() method
# 14. built-in virtual _ready method
func _ready():
	GameEvents.ability_upgrade_added.connect(_on_ability_upgrade_added)
	
	
# 15. remaining built-in virtual methods
# 16. public methods
func _append_ability_acquisition(ability_acquisition: AbilityAcquisition):
	add_child(ability_acquisition.ability_scene.instantiate())
	
	
# 17. private methods
# 18. signal listeners
func _on_ability_upgrade_added(ability_upgrade: AbilityUpgrade):
	if ability_upgrade is AbilityAcquisition:
		_append_ability_acquisition(ability_upgrade)
# 19. subclasses

