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

var stage_grid_sets = {
	"crypt": [S11, S12, S13, S14],
	"village": [S5, S6, S8, S9, S10],
	"city": [S2, S5, S6, S8, S10],
	"forest": [S1, S3, S5, S6, S8, S9, S10],
	"cathedral": [S5, S6, S8, S9, S10, S12, S13]
}


func _ready():
	get_grid_stage()
	spawn_enemies()


func get_grid_stage():
	level_name = Global.level_name


func extract_grid_number(path: String) -> int:
	var spot_string = path.substr(path.length() - 2, 2)
	var number_string = ""
	for chara in spot_string:
		if chara >= '0' and chara <= '9':
			number_string += chara
	return int(number_string)
	


func spawn_enemies():
	if level_name == "crypt":
		var grid_set = stage_grid_sets["crypt"]
		position += Vector2(110, 0)
		for path in grid_set:
			var grid = get_node(path)
			var instance = enemy_scene.instantiate()
			instance.id = 7
			instance.position = grid.position
			instance.grid_spot = extract_grid_number(path)
			add_child(instance)
			CombatManager.enemies.append(instance)
	elif level_name == "village":
		var grid_set = stage_grid_sets["village"]
		position += Vector2(220, 0)
		for path in grid_set:
			var grid = get_node(path)
			var instance = enemy_scene.instantiate()
			if path == S5 or path == S6:
				instance.id = 9
			elif path == S8 or path == S10:
				instance.id = 7
			elif path == S9:
				instance.id = 10
			instance.position = grid.position
			instance.grid_spot = extract_grid_number(path)
			add_child(instance)
			CombatManager.enemies.append(instance)
	elif level_name == "city":
		var grid_set = stage_grid_sets["city"]
		position += Vector2(220, 0)
		for path in grid_set:
			var grid = get_node(path)
			var instance = enemy_scene.instantiate()
			if path == S2:
				instance.id = 8
			elif path == S5 or path == S6:
				instance.id = 7
			elif path == S8 or path == S10:
				instance.id = 10
			instance.position = grid.position
			instance.grid_spot = extract_grid_number(path)
			add_child(instance)
			CombatManager.enemies.append(instance)
	elif level_name == "forest":
		var grid_set = stage_grid_sets["forest"]
		position += Vector2(220, 0)
		for path in grid_set:
			var grid = get_node(path)
			var instance = enemy_scene.instantiate()
			if path == S1 or path == S3:
				instance.id = 9
			elif path == S5 or path == S6 or path == S8 or path == S10:
				instance.id = 10
			elif path == S9:
				instance.id = 12
			instance.position = grid.position
			instance.grid_spot = extract_grid_number(path)
			add_child(instance)
			CombatManager.enemies.append(instance)
	elif level_name == "cathedral":
		var grid_set = stage_grid_sets["cathedral"]
		position += Vector2(110, 0)
		for path in grid_set:
			var grid = get_node(path)
			var instance = enemy_scene.instantiate()
			if path == S5 or path == S6:
				instance.id = 8
			elif path == S8 or path == S10 or path == S12 or path == S13:
				instance.id = 10
			elif path == S9:
				instance.id = 11
			instance.position = grid.position
			instance.grid_spot = extract_grid_number(path)
			add_child(instance)
			CombatManager.enemies.append(instance)


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
