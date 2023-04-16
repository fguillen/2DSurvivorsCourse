# -- 01 @tool
# -- 02 class_name
# -- 03 extends
extends Node

# -- 04 # docstring
#
# -- 05 signals
signal meta_upgrade_currency_changed()

# -- 06 enums
# -- 07 constants
const DATA_FILE_PATH = "user://data.save"

# -- 08 exported variables
# -- 09 public variables
var game_data := {
	"meta_upgrade_currency": 0,
	"meta_upgrades": {}
}

# -- 10 private variables
# -- 11 onready variables
#
# -- 12 optional built-in virtual _init method
# -- 13 optional built-in virtual _enter_tree() method
# -- 14 built-in virtual _ready method
func _ready():
	GameEvents.experiece_vial_collected.connect(_on_experience_vial_collected)
	GameEvents.game_ended.connect(_on_game_ended)
	load_data()
	print("MetaProgressionManager.game_data: ", game_data)
	
	
# -- 15 remaining built-in virtual methods
# -- 16 public methods
func purchase(meta_upgrade: MetaUpgrade):
	if not game_data.meta_upgrades.has(meta_upgrade.id):
		game_data.meta_upgrades[meta_upgrade.id] = {
			"quantity": 0
		}
	
	game_data.meta_upgrades[meta_upgrade.id].quantity += 1
	game_data.meta_upgrade_currency -= meta_upgrade.cost
	
	save_data()
	meta_upgrade_currency_changed.emit()
	
	

func load_data():
	if FileAccess.file_exists(DATA_FILE_PATH):
		var file = FileAccess.open(DATA_FILE_PATH, FileAccess.READ)
		game_data = file.get_var()
		
		
func save_data():
	var file = FileAccess.open(DATA_FILE_PATH, FileAccess.WRITE)
	file.store_var(game_data)
		
	
	
# -- 17 private methods
# -- 18 signal listeners
func _on_experience_vial_collected(amount: int):
	game_data.meta_upgrade_currency += 1
	

func _on_game_ended():
	save_data()	
# -- 19 subclasses

