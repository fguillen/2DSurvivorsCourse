# -- 01 @tool
# -- 02 class_name
class_name MetaUpgradesMenu
# -- 03 extends
extends CanvasLayer

# -- 04 # docstring
#
# -- 05 signals
# -- 06 enums
# -- 07 constants
# -- 08 exported variables
@export var meta_upgrade_card_scene: PackedScene
@export var meta_upgrades: Array[MetaUpgrade] = []
@onready var grid_container = %GridContainer

# -- 09 public variables
# -- 10 private variables
var _meta_upgrade_cards: Array[MetaUpgradeCard] = []

# -- 11 onready variables
#
# -- 12 optional built-in virtual _init method
# -- 13 optional built-in virtual _enter_tree() method
# -- 14 built-in virtual _ready method
func _ready():
	# Cleaning debug elements
	for child in grid_container.get_children():
		child.queue_free()

	_setup_cards()
	
	
# -- 15 remaining built-in virtual methods
# -- 16 public methods
# -- 17 private methods
func _setup_cards():
	for meta_upgrade in meta_upgrades:
		var meta_upgrade_card = meta_upgrade_card_scene.instantiate()
		meta_upgrade_card.meta_upgrade = meta_upgrade
		print("XXX: meta_upgrade_card.meta_upgrade: ", meta_upgrade_card.meta_upgrade)
		meta_upgrade_card.purchased.connect(_on_purchased.bind(meta_upgrade))
		grid_container.add_child(meta_upgrade_card)
		
		_meta_upgrade_cards.append(meta_upgrade_card)
		
		
# -- 18 signal listeners
func _on_purchased(meta_upgrade: MetaUpgrade):
	MetaProgressionManager.purchase(meta_upgrade)
	

func _on_back_button_pressed():
	SceneSwitcher.switch_to("main_menu")

# -- 19 subclasses



