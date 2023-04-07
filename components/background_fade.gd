# 01. @tool
# 02. class_name
class_name BackgroundFade
# 03. extends
extends CanvasLayer

# 04. # docstring
#
# 05. signals
signal fade_finished
# 06. enums
# 07. constants
# 08. exported variables
# 09. public variables
# 10. private variables
# 11. onready variables
@onready var animation_player = $AnimationPlayer

# 12. optional built-in virtual _init method
# 13. optional built-in virtual _enter_tree() method
# 14. built-in virtual _ready method
# 15. remaining built-in virtual methods
# 16. public methods
func fade_in():
	animation_player.play("in")
	await animation_player.animation_finished
	fade_finished.emit()
	
	
func fade_out():
	animation_player.play("out")
	await animation_player.animation_finished
	fade_finished.emit()
	
	
# 17. private methods
# 18. signal listeners
# 19. subclasses

