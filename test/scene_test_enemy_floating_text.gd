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
# 09. public variables
# 10. private variables
# 11. onready variables
@onready var hurtbox_component: HurtboxComponent = $EnemyBase/HurtboxComponent


# 12. optional built-in virtual _init method
# 13. optional built-in virtual _enter_tree() method
# 14. built-in virtual _ready method
# 15. remaining built-in virtual methods
# 16. public methods
# 17. private methods
# 18. signal listeners
# 19. subclasses



func _on_timer_timeout():
	hurtbox_component.get_hurt()
