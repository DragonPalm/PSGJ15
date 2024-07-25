extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	CombatManager.set_nodes()

func victory_screen(victory):
	$game_over.visible = true
	if victory == "win":
		if Global.level_name == "crypt":
			Global.unlocked_maps.append("village")
			Global.unlocked_maps.append("city")
		elif Global.level_name == "village":
			Global.unlocked_maps.append("forest")
		elif Global.level_name == "city":
			Global.unlocked_maps.append("cathedral")
		elif Global.level_name == "forest" or Global.level_name == "cathedral":
			Global.unlocked_maps.append("castle")
		$game_over/you_win.visible = true
	if victory == "lose":
		$game_over/you_lose.visible = true


func _on_win_continue_button_up():
	get_tree().change_scene_to_file("res://world_map.tscn")

func _on_win_menu_button_up():
	get_tree().change_scene_to_file("res://Main Menu/main_menu.tscn")

func _on_lose_continue_button_up():
	get_tree().change_scene_to_file("res://world_map.tscn")

func _on_lose_menu_button_up():
	get_tree().change_scene_to_file("res://Main Menu/main_menu.tscn")
