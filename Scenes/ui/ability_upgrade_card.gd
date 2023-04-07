class_name AbilityUpgradeCard
extends PanelContainer

# @tool
# class_name
# extends
# docstring
# signals
signal ability_upgrade_selected(ability_upgrade: AbilityUpgrade)
signal animation_finished

# enums
# constants
# exported variables
# public variables
var ability_upgrade: AbilityUpgrade : set = _set_ability_upgrade

# private variables

# onready variables
@onready var name_label: Label = %NameLabel
@onready var description_label: Label = %DescriptionLabel

# optional built-in virtual _init method
# optional built-in virtual _enter_tree() method
# built-in virtual _ready method
# remaining built-in virtual methods
# public methods
func animation_in(delay: float):
	modulate = Color.TRANSPARENT
	await get_tree().create_timer(delay).timeout
	$AnimationPlayer.play("in")


func animation_discarded(delay: float):
	_disable()
	await get_tree().create_timer(delay).timeout
	$AnimationPlayer.play("discarded")
	await $AnimationPlayer.animation_finished
	animation_finished.emit()


# private methods
func _set_ability_upgrade(value: AbilityUpgrade):
	ability_upgrade = value
	name_label.text = ability_upgrade.name
	description_label.text = ability_upgrade.description


func _disable():
	mouse_filter = Control.MOUSE_FILTER_IGNORE
	

func _on_selected():
	_disable()
	ability_upgrade_selected.emit(ability_upgrade)
	$AnimationPlayer.play("selected")
	await $AnimationPlayer.animation_finished
	
	animation_finished.emit()


func _on_gui_input(event: InputEvent):
	if event.is_action_pressed("mouse_left"):
		_on_selected()


func _on_mouse_entered():
	$HoverAnimationPlayer.play("hover")

# subclasses
