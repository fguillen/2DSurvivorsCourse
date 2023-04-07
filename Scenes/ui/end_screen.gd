# 01. @tool
# 02. class_name
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
@onready var background_fade: BackgroundFade = $BackgroundFade
@onready var animation_player = $AnimationPlayer

#
# 12. optional built-in virtual _init method
# 13. optional built-in virtual _enter_tree() method
# 14. built-in virtual _ready method
func _ready():
	get_tree().paused = true
	background_fade.fade_in()
	
# 15. remaining built-in virtual methods
# 16. public methods
# 17. private methods
# 18. signal listeners
func _on_restart_button_pressed():
	animation_player.play("out")
	await animation_player.animation_finished
	await background_fade.fade_out()
	get_tree().paused = false
	get_tree().reload_current_scene()


func _on_quit_button_pressed():
	await background_fade.fade_out()
	get_tree().quit()

# 19. subclasses


