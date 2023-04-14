class_name MetaUpgradeCard
extends PanelContainer

# @tool
# class_name
# extends
# docstring
# signals
# enums
# constants
# exported variables
# public variables
var meta_upgrade: MetaUpgrade : set = _set_meta_upgrade

# private variables

# onready variables
@onready var name_label: Label = %NameLabel
@onready var description_label: Label = %DescriptionLabel

# optional built-in virtual _init method
# optional built-in virtual _enter_tree() method
# built-in virtual _ready method
# remaining built-in virtual methods
# public methods
# private methods
func _set_meta_upgrade(value: MetaUpgrade):
	meta_upgrade = value
	name_label.text = meta_upgrade.name
	description_label.text = meta_upgrade.description
	

func _on_selected():
	$AnimationPlayer.play("selected")

# subclasses
