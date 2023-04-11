# -- 01 @tool
# -- 02 class_name
# -- 03 extends
extends CanvasLayer

# -- 04 # docstring
#
# -- 05 signals
# -- 06 enums
# -- 07 constants
# -- 08 exported variables
@export var options_menu_scene: PackedScene


# -- 09 public variables
# -- 10 private variables
var _paused := false
var _animating := false

# -- 11 onready variables
@onready var background_fade: BackgroundFade = $BackgroundFade
@onready var margin_container = $MarginContainer

#
# -- 12 optional built-in virtual _init method
# -- 13 optional built-in virtual _enter_tree() method
# -- 14 built-in virtual _ready method
func _ready():
	margin_container.visible = false
	
	
# -- 15 remaining built-in virtual methods
func _unhandled_input(event):
	if _animating: 
		return
		
	if event.is_action_pressed("pause"):
		if _paused:
			_resume()
		else:
			_pause()
		
		
# -- 16 public methods
# -- 17 private methods
func _pause():
	_animating = true	
	_paused = true
	get_tree().paused = true
	await background_fade.fade_in()
	margin_container.visible = true
	_animating = false
	
	
func _resume():
	_animating = true
	margin_container.visible = false
	await background_fade.fade_out()
	get_tree().paused = false
	_paused = false
	_animating = false
	

func _show_options_menu():
	var options_menu = options_menu_scene.instantiate()
	add_child(options_menu)
	
	
# -- 18 signal listeners
func _on_resume_button_pressed():
	_resume()


func _on_options_button_pressed():
	_show_options_menu()


func _on_quit_button_pressed():
	await _resume()
	get_tree().change_scene_to_file("res://Scenes/main_menu/main_menu.tscn")
	
# -- 19 subclasses







