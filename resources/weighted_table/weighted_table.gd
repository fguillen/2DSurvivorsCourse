class_name WeightedTable
extends Resource

@export var table: Array[WeightedElement] = [] : set = _set_table

var _total_weight := 0


func pick() -> Resource:
	return _pick_base().content
	

func pick_many(amount: int, allow_duplicate: bool = true) -> Array[Resource]:
	if allow_duplicate:
		return _pick_many_allow_duplicate(amount)
	else: 
		return _pick_many_no_allow_duplicate(amount)
	

#func duplicate() -> WeightedTable:
#	var duplicated_weighted_table = WeightedTable.new()
#	duplicated_weighted_table.table = table.duplicate()
#	return duplicated_weighted_table
	
func _pick_base() -> WeightedElement:
	var random_index := randi_range(1, _total_weight)
	var actual_index := 0
	
	for i in table:
		actual_index += i.weight
		if random_index <= actual_index:
			return i
		
	push_warning("WeightedTable._pick_base() not element found. table.size(): ", table.size(), ", _total_weight: ", _total_weight, ", random_index: ", random_index)
	return null
	
	
func _pick_many_allow_duplicate(amount: int) -> Array[Resource]:
	var result: Array[Resource] = []
	
	for i in amount:
		var element = _pick_base()
		if element:
			result.append(element.content)
		else:
			break # no more elments
		
	return result
	
	
func _pick_many_no_allow_duplicate(amount: int) -> Array[Resource]:
	var original_table = table.duplicate()
	var result: Array[Resource] = []
	
	for i in amount:
		var element = _pick_base()
		if element: 
			result.append(element.content)
			table.erase(element)
			_total_weight -= element.weight
		else:
			break # no more elments
		
	self.table = original_table
	return result
	
	
func _set_table(value: Array[WeightedElement]):
	table = value
	_total_weight = 0
	
	for i in table:
		_total_weight += i.weight
