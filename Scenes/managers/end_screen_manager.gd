# 01. @tool
# 02. class_name
# 03. extends
extends Node

# 04. # docstring
#
# 05. signals
# 06. enums
# 07. constants
# 08. exported variables
@export var end_screen_scene: PackedScene

# 09. public variables
# 10. private variables
# 11. onready variables
#
# 12. optional built-in virtual _init method
# 13. optional built-in virtual _enter_tree() method
# 14. built-in virtual _ready method
# 15. remaining built-in virtual methods
# 16. public methods
func show_victory_screen():
	print("EndScreenManager.show_victory_screen()")
	_show_end_screen("victory")
	
	
func show_fail_screen():
	_show_end_screen("fail")

	
# 17. private methods
func _show_end_screen(result: String):
	var end_screen = end_screen_scene.instantiate()
	end_screen.result = result
	add_child(end_screen)
	

# 18. signal listeners
# 19. subclasses

