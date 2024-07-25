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


var grid_columns = {
	"front": [S1, S2, S3],
	"middle_front": [S4, S5, S6, S7],
	"middle": [S8, S9, S10],
	"middle_back": [S11, S12, S13, S14],
	"back": [S15, S16, S17]
}

var grid_sets = {}


func get_grid_stage():
	var grid_stage = Global.map_stage
	if grid_stage == 0:
		grid_sets = {
			"LittleDiamond": [S9, S12, S13, S16],
			"Bow": [S12, S13, S15, S17],
			"ReverseBow": [S8, S10, S12, S13],
			"Gap": [S8, S10, S11, S14],
		}

#func _grid_placeholders_for_copy_pasting():
	#var grid_sets = {
		#"Basic1": [S1, S2, S3, S4, S5, S6, S7, S8, S9, S10],
		#"Basic2": [S4, S5, S6, S7, S8, S9, S10, S11, S12, S13, S14],
		#"LittleDiamond": [S2, S5, S6, S9],
		#"ForwardV": [S2, S5, S6, S8, S10],
		#"BackwardV": [S1, S3, S5, S6, S9],
		#"BigX": [S1, S3, S5, S6, S9, S12, S13, S15, S17],
		#"LittleX": [S5, S6, S9, S12, S13]
	#}


func _ready():
	randomize()
	get_grid_stage()
	set_spawn_grid()


func choose_random_grid_set():
	var keys = grid_sets.keys()
	var random_index = randi() % keys.size()
	var random_key = keys[random_index]
	return grid_sets[random_key]


func check_grid_columns(grid_set):
	var back = grid_columns["back"]
	var mid_back = grid_columns["middle_back"]
	var back_found = false
	var midback_found = false
	
	for i in back:
		if i in grid_set:
			back_found = true
			break
	
	for i in mid_back:
		if i in grid_set:
			midback_found = true
			break
	
	return {"back_exists": back_found, "midback_exists": midback_found}


func extract_grid_number(path: String) -> int:
	var spot_string = path.substr(path.length() - 2, 2)
	var number_string = ""
	for chara in spot_string:
		if chara >= '0' and chara <= '9':
			number_string += chara
	return int(number_string)

func set_spawn_grid():
	var grid_set = choose_random_grid_set()
	var check_columns = check_grid_columns(grid_set)
	if not check_columns["back_exists"] and not check_columns["midback_exists"]:
		position -= Vector2(220, 0)
	elif not check_columns["back_exists"]:
		position -= Vector2(110, 0)
	for path in grid_set:
		var grid = get_node(path)
		var instance = placement_circle.instantiate()
		instance.position = grid.position
		instance.grid_spot = extract_grid_number(path)
		$circles.add_child(instance)
		CombatManager.placement_circles.append(instance)


func sort_minions():
	var children = $minions.get_children()
	children.sort_custom(sort_by_y)
	for child in children:
		child.get_parent().remove_child(child)
		$minions.add_child(child)

func sort_by_y(node_a: Node, node_b: Node) -> bool:
	return node_a.position.y < node_b.position.y
