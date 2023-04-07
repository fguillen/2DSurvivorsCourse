extends Node

signal experiece_vial_collected(value: int)
signal ability_upgrade_added(ability_upgrade: AbilityUpgrade)
signal character_hurt(value: int)
signal player_hurt(value: int)


func emit_experiece_vial_collected(value: int):
	experiece_vial_collected.emit(value)
	
	
func emit_ability_upgrade_added(ability_upgrade: AbilityUpgrade):
	print("GameEvents.emit_ability_upgrade_added()")
	ability_upgrade_added.emit(ability_upgrade)
	
	
func emit_character_hurt(character: Node, damage: int):
	character_hurt.emit(character, damage)
	
	if character.is_in_group("player"):
		emit_player_hurt(damage)
	
	
func emit_player_hurt(damage: int):
	player_hurt.emit(damage)
	
