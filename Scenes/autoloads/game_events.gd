extends Node

signal experiece_vial_collected(value: int)
signal ability_upgrade_added(ability_upgrade: AbilityUpgrade)


func emit_experiece_vial_collected(value: int):
	experiece_vial_collected.emit(value)
	
	
func emit_ability_upgrade_added(ability_upgrade: AbilityUpgrade):
	print("GameEvents.emit_ability_upgrade_added()")
	emit_signal("ability_upgrade_added", ability_upgrade)
