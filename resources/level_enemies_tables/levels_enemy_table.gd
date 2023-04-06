class_name LevelsEnemyTable
extends Resource

@export var enemies_tables: Array[WeightedTable] = [] : set = _set_enemies_tables

func pick_by_level(actual_level: int) -> PackedScene:
	var result
	
	var items_lower_than_actual_level = enemies_tables.filter(func(i): return i.level <= actual_level)
	if items_lower_than_actual_level.is_empty():
		push_warning("LevelsEnemyTable not element lower to the actual level. Returing first")
		result = enemies_tables[0]
	else:
		result =  items_lower_than_actual_level[-1]
		
	return result.pick() as PackedScene


func _set_enemies_tables(value: Array[WeightedTable]):
	enemies_tables = value
	enemies_tables.sort_custom(func(a, b): return a.level < b.level)
	

