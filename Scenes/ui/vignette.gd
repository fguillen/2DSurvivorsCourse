# 01. @tool
# 02. class_name
class_name Vignette
# 03. extends
extends CanvasLayer

# 04. # docstring
#
# 05. signals
# 06. enums
# 07. constants
# 08. exported variables
# 09. public variables
# 10. private variables
# 11. onready variables
@onready var animation_player = $AnimationPlayer

#
# 12. optional built-in virtual _init method
# 13. optional built-in virtual _enter_tree() method
# 14. built-in virtual _ready method
func _ready():
	GameEvents.player_hurt.connect(_on_player_hurt)
	
# 15. remaining built-in virtual methods
# 16. public methods
# 17. private methods
# 18. signal listeners
func _on_player_hurt(_damage: int):
	print("Vignette._on_player_hurt()")
	animation_player.play("hurt")
	
	
# 19. subclasses

