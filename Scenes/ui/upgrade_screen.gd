class_name UpgradeScreen
extends CanvasLayer

# @tool
# class_name
# extends
# docstring
# signals
signal ability_upgrade_selected(ability_upgrade: AbilityUpgrade)

# enums
# constants
# exported variables
@export var ability_upgrade_card_scene:PackedScene
@onready var background_fade: BackgroundFade = $BackgroundFade


# public variables
# private variables
var _ability_upgrade_cards: Array[AbilityUpgradeCard]
var _card_animations_missing := 0

# onready variables
@onready var ability_upgrade_cards_container:Container = %AbilityUpgradeCards

# optional built-in virtual _init method
# optional built-in virtual _enter_tree() method
# built-in virtual _ready method
func _ready():
	get_tree().paused = true
	_animation_in()


# remaining built-in virtual methods
# public methods
func set_ability_upgrades(ability_upgrades: Array[AbilityUpgrade]):
	var delay = 0
	for ability_upgrade in ability_upgrades:
		var ability_upgrade_card:AbilityUpgradeCard = ability_upgrade_card_scene.instantiate()
		_ability_upgrade_cards.append(ability_upgrade_card)
		_card_animations_missing += 1

		ability_upgrade_cards_container.add_child(ability_upgrade_card)
		ability_upgrade_card.ability_upgrade = ability_upgrade
		ability_upgrade_card.ability_upgrade_selected.connect(_on_ability_upgrade_selected.bind(ability_upgrade_card))
		ability_upgrade_card.animation_finished.connect(_on_card_animation_finished)
		ability_upgrade_card.animation_in(delay)
		delay += 0.2


# private methods
func _trigger_discarded_animations(selected_ability_upgrade_card: AbilityUpgradeCard):
	var delay = 0.3
	for ability_upgrade_card in _ability_upgrade_cards:
		if ability_upgrade_card != selected_ability_upgrade_card:
			ability_upgrade_card.animation_discarded(delay)
			delay += 0.2


func _on_ability_upgrade_selected(ability_upgrade: AbilityUpgrade, selected_ability_upgrade_card: AbilityUpgradeCard):
	emit_signal("ability_upgrade_selected", ability_upgrade)
	_trigger_discarded_animations(selected_ability_upgrade_card)


func _on_card_animation_finished():
	_card_animations_missing -= 1
	if _card_animations_missing == 0:
		_all_finished()
		

func _animation_in():
	background_fade.fade_in()
	
	
func _animation_out():
	background_fade.fade_out()
	await background_fade.fade_finished


func _all_finished():
	await _animation_out()
	get_tree().paused = false
	queue_free()



# subclasses
