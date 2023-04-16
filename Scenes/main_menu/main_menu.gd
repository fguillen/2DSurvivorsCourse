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
# -- 11 onready variables
#
# -- 12 optional built-in virtual _init method
# -- 13 optional built-in virtual _enter_tree() method
# -- 14 built-in virtual _ready method
# -- 15 remaining built-in virtual methods
# -- 16 public methods
# -- 17 private methods
func _show_options_menu():
	var options_menu = options_menu_scene.instantiate()
	add_child(options_menu)
	
	
# -- 18 signal listeners
func _on_play_button_pressed():
	SceneSwitcher.switch_to("game")


func _on_upgrades_button_pressed():
	SceneSwitcher.switch_to("meta_upgrades_menu")
	

func _on_options_button_pressed():
	_show_options_menu()


func _on_quit_button_pressed():
	print("XXX: _on_quit_button_pressed")
	get_tree().quit()
	
# -- 19 subclasses
