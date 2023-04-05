class_name LevelEnemyTable
extends Resource

@export var level: int
@export var enemy_table: Array[EnemyWeight] = [] : set = _set_enemy_table

var _total_weight := 0


func pick() -> PackedScene:
	var random_index := randi_range(1, _total_weight)
	var actual_index := 0
	
	for i in enemy_table:
		actual_index += i.weight
		if random_index <= actual_index:
			return i.scene
		
	push_error("SceneWeightTable.pick() not PackedScene found")
	return null
	
	
func _set_enemy_table(value: Array[EnemyWeight]):
	enemy_table = value
	for i in enemy_table:
		_total_weight += i.weight
