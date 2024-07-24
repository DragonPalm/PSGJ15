extends Node2D


var enemy_scene = preload("res://base_enemy.tscn")
var level_name = null
var S1 = "possible_placements/grid_spots/S1"
var S2 = "possible_placements/grid_spots/S2"
var S3 = "possible_placements/grid_spots/S3"
var S4 = "possible_placements/grid_spots/S4"
var S5 = "possible_placements/grid_spots/S5"
var S6 = "possible_placements/grid_spots/S6"
var S7 = "possible_placements/grid_spots/S7"
var S8 = "possible_placements/grid_spots/S8"
var S9 = "possible_placements/grid_spots/S9"
var S10 = "possible_placements/grid_spots/S10"
var S11 = "possible_placements/grid_spots/S11"
var S12 = "possible_placements/grid_spots/S12"
var S13 = "possible_placements/grid_spots/S13"
var S14 = "possible_placements/grid_spots/S14"
var S15 = "possible_placements/grid_spots/S15"
var S16 = "possible_placements/grid_spots/S16"
var S17 = "possible_placements/grid_spots/S17"


var grid_columns = {
	"front": [S1, S2, S3],
	"middle_front": [S4, S5, S6, S7],
	"middle": [S8, S9, S10],
	"middle_back": [S11, S12, S13, S14],
	"back": [S15, S16, S17]
}

var stage_zero_grid_sets = {
	"LittleDiamond": [S9, S12, S13, S16],
	"Bow": [S12, S13, S15, S17],
	"ReverseBow": [S8, S10, S12, S13],
	"Gap": [S8, S10, S11, S14],
	"Line": [S11, S12, S13, S14]
}


func _ready():
	Global.level_name = "crypt" # for testing
	get_grid_stage()
	spawn_enemies()


func get_grid_stage():
	level_name = Global.level_name


func spawn_enemies():
	if level_name == "crypt":
		var grid_set = stage_zero_grid_sets["Line"]
		position += Vector2(110, 0)
		for path in grid_set:
			var grid = get_node(path)
			var instance = enemy_scene.instantiate()
			instance.id = 7
			instance.set_stats()
			instance.position = grid.position
			add_child(instance)
			CombatManager.enemies.append(instance)


func _grid_placeholders_for_copy_pasting():
	var grid_sets = {
		"Basic1": [S1, S2, S3, S4, S5, S6, S7, S8, S9, S10],
		"Basic2": [S4, S5, S6, S7, S8, S9, S10, S11, S12, S13, S14],
		"LittleDiamond": [S2, S5, S6, S9],
		"ForwardV": [S2, S5, S6, S8, S10],
		"BackwardV": [S1, S3, S5, S6, S9],
		"BigX": [S1, S3, S5, S6, S9, S12, S13, S15, S17],
		"LittleX": [S5, S6, S9, S12, S13]
	}
