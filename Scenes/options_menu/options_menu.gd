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
# -- 11 onready variables
@onready var sfx_slider = %SFXSlider
@onready var music_slider = %MusicSlider
@onready var full_screen_check_button = %FullScreenCheckButton

#
# -- 12 optional built-in virtual _init method
# -- 13 optional built-in virtual _enter_tree() method
# -- 14 built-in virtual _ready method
func _ready():
	_update_display()
	
	
# -- 15 remaining built-in virtual methods
# -- 16 public methods
# -- 17 private methods
func _update_display():
	sfx_slider.value = _get_bus_volume("SFX")
	music_slider.value = _get_bus_volume("Music")
	full_screen_check_button.button_pressed = _get_full_screen()
	
	
func _get_bus_volume(bus_name: String) -> float:
	var bus_index = AudioServer.get_bus_index(bus_name)
	var volume_db = AudioServer.get_bus_volume_db(bus_index)
	return db_to_linear(volume_db)
	
	
func _set_bus_volume(bus_name: String, volume: float):
	var bus_index = AudioServer.get_bus_index(bus_name)
	var volume_db = linear_to_db(volume)
	AudioServer.set_bus_volume_db(bus_index, volume_db)
	

func _get_full_screen() -> bool:
	return DisplayServer.window_get_mode() == DisplayServer.WINDOW_MODE_FULLSCREEN
	
	
func _set_full_screen(value: bool):
	if value: 
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
	
	
# -- 18 signal listeners
func _on_sfx_slider_value_changed(value):
	_set_bus_volume("SFX", value)


func _on_music_slider_value_changed(value):
	_set_bus_volume("Music", value)
	
	
func _on_full_screen_check_button_toggled(button_pressed):
	_set_full_screen(button_pressed)
	

func _on_back_button_pressed():
	queue_free()
	
# -- 19 subclasses













