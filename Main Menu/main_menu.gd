class_name MainMenu
extends Control

# @onready var start_button = $MarginContainer/HBoxContainer/VBoxContainer/start_button as Button
# @onready var exit_button = $MarginContainer/HBoxContainer/VBoxContainer/exit_button as Button
# @onready var start_level = preload("res://level.tscn") as PackedScene


func _on_start_button_button_up():
	get_tree().change_scene_to_file("res://world_map.tscn")


func _on_exit_button_button_up():
	get_tree().quit()
