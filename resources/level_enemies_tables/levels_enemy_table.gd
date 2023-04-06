class_name LevelsEnemyTable
extends Resource

@export var level_enemy_tables: Array[LevelEnemyTable] = [] : set = _set_level_enemy_tables

func pick_by_level(actual_level: int) -> PackedScene:
	var result
	
	var items_lower_than_actual_level = level_enemy_tables.filter(func(i): return i.level <= actual_level)
	if items_lower_than_actual_level.is_empty():
		push_warning("LevelsEnemyTable not element lower to the actual level. Returing first")
		result = level_enemy_tables[0]
	else:
		result =  items_lower_than_actual_level[-1]
		
	return result.table.pick() as PackedScene


func _set_level_enemy_tables(value: Array[LevelEnemyTable]):
	level_enemy_tables = value
	level_enemy_tables.sort_custom(func(a, b): return a.level < b.level)
	

