extends Control

@export() var type:Minions.MinionType = 0

func _ready():
	$Button.text = Minions.minion_list[type]["name"]
	$Button.icon = load(Minions.minion_list[type]["sprite_file"])


func _on_button_pressed():
	DropManager.minion = preload("res://base_minion.tscn")
	DropManager.minion_id = type
