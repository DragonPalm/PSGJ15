extends Control

@export() var id:int = 0

func _ready():
	$Button.text = Minions.minion_list[id]["name"]
	$Button.icon = load(Minions.minion_list[id]["sprite_file"])


func _on_button_pressed():
	DropManager.minion = preload("res://base_minion.tscn")
	DropManager.minion_id = id
