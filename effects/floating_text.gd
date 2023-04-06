# 01. @tool
# 02. class_name
class_name FloatingText
# 03. extends
extends Node2D

# 04. # docstring
#
# 05. signals
# 06. enums
# 07. constants
# 08. exported variables
@export var reparent := false
@export var replicate := false

# 09. public variables
# 10. private variables
# 11. onready variables
@onready var label = $Label

# 12. optional built-in virtual _init method
# 13. optional built-in virtual _enter_tree() method
# 14. built-in virtual _ready method
func _ready():
	label.visible = false
	
	
# 15. remaining built-in virtual methods
# 16. public methods
func perform(value):
	if replicate:
		var replica = _replicate()
		replica.perform(value)
		return
		
	if reparent:
		_reparent()

	label.text = str(value)
	label.visible = true
	
	_animate()
	

# 17. private methods
func _animate():
	var final_position_1 = global_position + (Vector2.UP * 16)
	var final_position_2 = global_position + (Vector2.UP * 24)
	
	var tween = create_tween()
	tween.tween_property(self, "global_position", final_position_1, 0.5)\
		.set_ease(Tween.EASE_OUT)\
		.set_trans(Tween.TRANS_CUBIC)
		
#	tween.tween_property(self, "global_position", final_position_2, 0.3)\
#		.set_delay(1.0)\
#		.set_ease(Tween.EASE_IN)\
#		.set_trans(Tween.TRANS_CUBIC)
	tween.tween_property(self, "scale", Vector2.ONE * 0.1, 0.3)\
		.set_delay(1.0)\
		.set_ease(Tween.EASE_IN)\
		.set_trans(Tween.TRANS_CUBIC)
	
	tween.tween_callback(queue_free)
	

func _reparent():
	var actual_position = global_position
	var foreground_layer = GroupsUtils.foreground_layer
	if not foreground_layer:
		return
		
	if get_parent():
		get_parent().remove_child(self)
		
	foreground_layer.add_child(self)
	global_position = actual_position
	

func _replicate():
	var instance = (load(scene_file_path) as PackedScene).instantiate() 
	instance.reparent = reparent
	instance.replicate = false
	add_child(instance)
	instance.global_position = global_position
	return instance
	

# 18. signal listeners
# 19. subclasses

