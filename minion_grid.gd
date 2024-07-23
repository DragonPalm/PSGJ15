extends Node2D


var placement_circle = preload("res://placement_circles.tscn")
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

func _ready():
	randomize()
	set_spawn_grid()


var grid_columns = {
	"front": [S1, S2, S3],
	"middle_front": [S4, S5, S6, S7],
	"middle": [S8, S9, S10],
	"middle_back": [S11, S12, S13, S14],
	"back": [S15, S16, S17]
}

var grid_sets = {
	"Basic1": [S1, S2, S3, S4, S5, S6, S7, S8, S9, S10],
	"Basic2": [S4, S5, S6, S7, S8, S9, S10, S11, S12, S13, S14],
	"LittleDiamond": [S2, S5, S6, S9],
	"ForwardV": [S2, S5, S6, S8, S10],
	"BackwardV": [S1, S3, S5, S6, S9],
	"BigX": [S1, S3, S5, S6, S9, S12, S13, S15, S17],
	"LittleX": [S5, S6, S9, S12, S13]
}


func choose_random_grid_set():
	var keys = grid_sets.keys()
	var random_index = randi() % keys.size()
	var random_key = keys[random_index]
	return grid_sets[random_key]


func set_spawn_grid():
	var grid_set = choose_random_grid_set()
	for path in grid_set:
		var grid = get_node(path)
		var instance = placement_circle.instantiate()
		instance.position = grid.position
		add_child(instance)
