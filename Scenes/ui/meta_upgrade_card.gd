class_name MetaUpgradeCard
extends PanelContainer

# @tool
# class_name
# extends
# docstring
# signals
signal purchased(meta_upgrade: MetaUpgrade)

# enums
# constants
# exported variables
# public variables
var meta_upgrade: MetaUpgrade

# private variables

# onready variables
@onready var name_label: Label = %NameLabel
@onready var description_label: Label = %DescriptionLabel
@onready var percent_label: Label = %PercentLabel
@onready var progress_bar: ProgressBar = %ProgressBar
@onready var purchase_button = $MarginContainer/VBoxContainer/PurchaseButton


# optional built-in virtual _init method
# optional built-in virtual _enter_tree() method
# built-in virtual _ready method
func _ready():
	update_display()
	MetaProgressionManager.meta_upgrade_currency_changed.connect(update_display)
	
	
# remaining built-in virtual methods
# public methods
func update_display():
	name_label.text = meta_upgrade.title
	description_label.text = meta_upgrade.description
	purchase_button.disabled = MetaProgressionManager.game_data.meta_upgrade_currency < meta_upgrade.cost

	var percent = meta_upgrade.cost / MetaProgressionManager.game_data.meta_upgrade_currency
	percent = min(percent, 1.0)
	progress_bar.value = percent
	percent_label.text = "%d/%d" % [MetaProgressionManager.game_data.meta_upgrade_currency, meta_upgrade.cost]


# private methods
func _purchase():
	$AnimationPlayer.play("selected")
	purchased.emit()
	
	

func _on_purchase_button_pressed():
	_purchase()
	
	
# subclasses



