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
# -- 09 public variables
# -- 10 private variables
var _scenes = {
	"main_menu": "res://Scenes/main_menu/main_menu.tscn",
	"game": "res://Scenes/Main/Main.tscn",
	"meta_upgrades_menu": "res://Scenes/meta_upgrades_menu/meta_upgrades_menu.tscn",
}

# -- 11 onready variables
@onready var animation_player = $AnimationPlayer


# -- 12 optional built-in virtual _init method
# -- 13 optional built-in virtual _enter_tree() method
# -- 14 built-in virtual _ready method
# -- 15 remaining built-in virtual methods
# -- 16 public methods
func switch_to(scene_name: String):
	animation_player.play("in")
	await animation_player.animation_finished
	get_tree().change_scene_to_file(_scenes[scene_name])
	animation_player.play_backwards("in")
	
	
# -- 17 private methods
# -- 18 signal listeners
# -- 19 subclasses

