extends CanvasLayer

# @tool
# class_name
# extends
# docstring
# signals
# enums
# constants
# exported variables
# public variables
# private variables
# onready variables
@onready var progress_bar = %ProgressBar

# optional built-in virtual _init method
# optional built-in virtual _enter_tree() method
# built-in virtual _ready method
func _ready():
	progress_bar.value = 0
	
# remaining built-in virtual methods
# public methods
func on_value_changed(current:int, target:int):
	var percentage = current / float(target)
	progress_bar.value = percentage
	
# private methods
# subclasses

