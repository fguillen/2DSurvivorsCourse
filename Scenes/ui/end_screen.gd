# 01. @tool
# 02. class_name
# 03. extends
extends CanvasLayer

# 04. # docstring
#
# 05. signals
signal victory
signal fail

# 06. enums
# 07. constants
# 08. exported variables
# 09. public variables
var result: String

# 10. private variables
# 11. onready variables
@onready var background_fade: BackgroundFade = $BackgroundFade
@onready var animation_player = $AnimationPlayer
@onready var title_label = %TitleLabel
@onready var description_label = %DescriptionLabel

#
# 12. optional built-in virtual _init method
# 13. optional built-in virtual _enter_tree() method
# 14. built-in virtual _ready method
func _ready():
	get_tree().paused = true
	background_fade.fade_in()
	
	if result == "victory":
		_setup_victory()
	elif result == "fail":
		_setup_fail()
	else:
		push_error("EndScreen.result not valid: ", result)
		
	
# 15. remaining built-in virtual methods
# 16. public methods
# 17. private methods
# 18. signal listeners
func _on_restart_button_pressed():
	animation_player.play("out")
	await animation_player.animation_finished
	await background_fade.fade_out()
	get_tree().paused = false
	SceneSwitcher.switch_to("game")


func _on_quit_button_pressed():
	await background_fade.fade_out()
	get_tree().quit()
	

func _setup_victory():
	victory.emit()	
	title_label.text = "Victory"
	description_label.text = "You have succeeded"


func _setup_fail():
	fail.emit()	
	title_label.text = "Fail"
	description_label.text = "You have failed"
	

# 19. subclasses


