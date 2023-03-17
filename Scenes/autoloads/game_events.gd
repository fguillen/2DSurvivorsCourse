extends Node

signal experiece_vial_collected(value: int)


func emit_experiece_vial_collected(value: int):
	experiece_vial_collected.emit(value)
