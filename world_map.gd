extends Node2D

func _ready():
	DropManager.can_spawn = true
	check_buttons()

func check_buttons():
	if "village" not in Global.unlocked_maps:
		$village_button.disabled = true
	else:
		$village_button.disabled = false
	if "city" not in Global.unlocked_maps:
		$city_button.disabled = true
	else:
		$city_button.disabled = false
	if "forest" not in Global.unlocked_maps:
		$forest_button.disabled = true
	else:
		$forest_button.disabled = false
	if "cathedral" not in Global.unlocked_maps:
		$cathedral_button.disabled = true
	else:
		$cathedral_button.disabled = false
	if "castle" not in Global.unlocked_maps:
		$castle_button.disabled = true
	else:
		$castle_button.disabled = false

func _on_crypt_button_button_up():
	Global.level_name = "crypt"
	get_tree().change_scene_to_file("res://level.tscn")


func _on_village_button_button_up():
	Global.level_name = "village"
	get_tree().change_scene_to_file("res://level.tscn")


func _on_city_button_button_up():
	Global.level_name = "city"
	get_tree().change_scene_to_file("res://level.tscn")


func _on_forest_button_button_up():
	Global.level_name = "forest"
	get_tree().change_scene_to_file("res://level.tscn")


func _on_cathedral_button_button_up():
	Global.level_name = "cathedral"
	get_tree().change_scene_to_file("res://level.tscn")


func _on_castle_button_button_up():
	Global.level_name = "castle"
	get_tree().change_scene_to_file("res://level.tscn")
