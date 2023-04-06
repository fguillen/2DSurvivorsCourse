class_name WeightedTable
extends Resource

@export var level: int
@export var table: Array[WeightedElement] = [] : set = _set_table

var _total_weight := 0


func pick() -> Resource:
	var random_index := randi_range(1, _total_weight)
	var actual_index := 0
	
	for i in table:
		actual_index += i.weight
		if random_index <= actual_index:
			return i.element
		
	push_error("WeightedTable.pick() not Resource found")
	return null
	
	
func _set_table(value: Array[WeightedElement]):
	table = value
	for i in table:
		_total_weight += i.weight
