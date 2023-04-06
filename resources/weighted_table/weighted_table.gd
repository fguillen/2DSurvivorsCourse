class_name WeightedTable
extends Resource

@export var table: Array[WeightedElement] = [] : set = _set_table

var _total_weight := 0


func pick() -> Resource:
	var random_index := randi_range(1, _total_weight)
	var actual_index := 0
	
	for i in table:
		actual_index += i.weight
		if random_index <= actual_index:
			return i.element
		
	push_warning("WeightedTable.pick() not element found")
	return null
	

func pick_many(amount: int, duplicate: bool = true) -> Array[Resource]:
	if duplicate:
		return _pick_many_duplicate(amount)
	else: 
		return _pick_many_no_duplicate(amount)
	
	
func _pick_many_duplicate(amount: int) -> Array[Resource]:
	var result: Array[Resource] = []
	
	for i in amount:
		var element = pick()
		if element:
			result.append(element)
		else:
			break # no more elments
		
	return result
	
	
func _pick_many_no_duplicate(amount: int) -> Array[Resource]:
	var original_table = table.duplicate()
	var result: Array[Resource] = []
	
	for i in amount:
		var element = pick()
		if element: 
			result.append(element)
			table.erase(element)
			_total_weight -= element.weight
		else:
			break # no more elments
		
	self.table = original_table
	return result
	
	
func _set_table(value: Array[WeightedElement]):
	table = value
	for i in table:
		_total_weight += i.weight
