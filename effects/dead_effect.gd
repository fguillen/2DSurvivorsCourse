# 01. @tool
# 02. class_name
# 03. extends
extends Node2D

# 04. # docstring
#
# 05. signals
# 06. enums
# 07. constants
# 08. exported variables
@export var texture: Texture2D
# 09. public variables
# 10. private variables
# 11. onready variables
@onready var particles: CPUParticles2D = $CPUParticles2D
@onready var free_timer: Timer = $FreeTimer
#
# 12. optional built-in virtual _init method
# 13. optional built-in virtual _enter_tree() method
# 14. built-in virtual _ready method
# 15. remaining built-in virtual methods
# 16. public methods
func perform(pos: Vector2):
	_reparent(pos)
	particles.texture = texture
	particles.emitting = true
	free_timer.start()
	
	
# 17. private methods
func _reparent(pos: Vector2):
	get_parent().remove_child(self)
	GroupsUtils.foreground_layer.add_child(self)
	global_position = pos
	
	
# 18. signal listeners
func _on_free_timer_timeout():
	print("DeadFeedback.free_timer_timeout()")
	queue_free()
	
	
# 19. subclasses




