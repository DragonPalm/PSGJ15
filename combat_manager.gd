extends Node

var level = preload("res://level.tscn")
var minion_grid = null
var enemy_grid = null
var minions = []
var enemies = []
var colliding_units = []
var placement_circles = []
var colliding = false

var minion_spots = {
	"front": [null, null, null],
	"midfront": [null, null, null, null],
	"mid": [null, null, null],
	"midback": [null, null, null, null],
	"back": [null, null, null]
}
var enemy_spots = {
	"front": [null, null, null],
	"midfront": [null, null, null, null],
	"mid": [null, null, null],
	"midback": [null, null, null, null],
	"back": [null, null, null]
}

var adjacency = {
	"front"[0]: ["front"[1], "midfront"[0], "midfront"[1]]
}


# === Set Up ===

func _ready():
	set_process(false)

func reset_combat_manager():
	minion_grid = null
	enemy_grid = null
	minions = []
	enemies = []
	colliding_units = []
	placement_circles = []
	colliding = false
	reset_grid_spots()

func place_unit_in_grid(unit, list, grid_spot):
	if grid_spot in range(1, 4):
		list["front"][grid_spot - 1] = unit
	if grid_spot in range(4, 8):
		list["midfront"][grid_spot - 4] = unit
	if grid_spot in range(8, 11):
		list["mid"][grid_spot - 8] = unit
	if grid_spot in range(11, 15):
		list["midback"][grid_spot - 11] = unit
	if grid_spot in range(15, 18):
		list["back"][grid_spot - 15] = unit

func reset_grid_spots():
	minion_spots = {
		"front": [null, null, null],
		"midfront": [null, null, null, null],
		"mid": [null, null, null],
		"midback": [null, null, null, null],
		"back": [null, null, null]
	}
	enemy_spots = {
		"front": [null, null, null],
		"midfront": [null, null, null, null],
		"mid": [null, null, null],
		"midback": [null, null, null, null],
		"back": [null, null, null]
	}


func set_grid_spots():
	reset_grid_spots()
	for minion in minions:
		var grid_spot = minion.grid_spot
		place_unit_in_grid(minion, minion_spots, grid_spot)
	for enemy in enemies:
		var grid_spot = enemy.grid_spot
		place_unit_in_grid(enemy, enemy_spots, grid_spot)

func set_nodes():
	minion_grid = get_tree().get_current_scene().get_node("minion_grid")
	enemy_grid = get_tree().get_current_scene().get_node("enemy_grid")

func start_fight():
	initialize_everything()
	for circle in placement_circles:
		circle.queue_free()
	set_process(true)

func initialize_everything():
	set_grid_spots()
	listen_for_collision()
	listen_for_damage()
	listen_for_death()
	determine_front_lines()
	find_front_line_targets()


# === Grid Movement ===

func listen_for_collision():
	for enemy in enemies:
		enemy.colliding.connect(add_colliding.bind(enemy))
		enemy.not_colliding.connect(remove_colliding.bind(enemy))

func move_grids():
	if not colliding:
		minion_grid.position.x += 5
		enemy_grid.position.x -= 5

func add_colliding(unit):
	colliding_units.append(unit)
	check_to_move()
	set_front_line_attack_state()

func remove_colliding(unit):
	colliding_units.erase(unit)
	check_to_move()
	set_front_line_attack_state()

func check_to_move():
	colliding = colliding_units.size() > 0


# === Front Line Combat ===

var minion_front_line = []
var enemy_front_line = []

func determine_front_lines():
	determine_front_line(minion_spots, "minion_front_line")
	determine_front_line(enemy_spots, "enemy_front_line")

func determine_front_line(spots, front_line):
	for key in ["front", "midfront", "mid", "midback", "back"]:
		for unit in spots[key]:
			if unit != null:
				if front_line == "minion_front_line":
					minion_front_line = spots[key]
				if front_line == "enemy_front_line":
					enemy_front_line = spots[key]
				return

func find_front_line_targets():
	var minion_parity = {}
	var enemy_parity = {}
	if minion_front_line.size() == 3 and enemy_front_line.size() == 3:
		minion_parity = {1: [1], 2: [2], 3: [3]}
		enemy_parity = {1: [1], 2: [2], 3: [3]}
	elif minion_front_line.size() == 3 and enemy_front_line.size() == 4:
		minion_parity = {1: [1, 2], 2: [2, 3], 3: [3, 4]}
		enemy_parity = {1: [1], 2: [1, 2], 3: [2, 3], 4: [4]}
	elif minion_front_line.size() == 4 and enemy_front_line.size() == 3:
		minion_parity = {1: [1], 2: [1, 2], 3: [2, 3], 4: [4]}
		enemy_parity = {1: [1, 2], 2: [2, 3], 3: [3, 4]}
	elif minion_front_line.size() == 4 and enemy_front_line.size() == 4:
		minion_parity = {1: [1], 2: [2], 3: [3], 4: [4]}
		enemy_parity = {1: [1], 2: [2], 3: [3], 4: [4]}
	
	for i in range(minion_front_line.size()):
		var minion = minion_front_line[i]
		if minion:
			if is_instance_valid(minion):
				var targets = []
				if (i + 1) in minion_parity:
					for p in minion_parity[i + 1]:
						if p - 1 < enemy_front_line.size() and enemy_front_line[p - 1]:
							targets.append(enemy_front_line[p - 1])
				if targets.size() > 0:
					minion.target = targets[randi() % targets.size()]
				else:
					var non_null_targets = []
					for enemy in enemy_front_line:
						if enemy:
							non_null_targets.append(enemy)
					minion.target = non_null_targets[randi() % non_null_targets.size()]
	
	for j in range(enemy_front_line.size()):
		var enemy = enemy_front_line[j]
		if enemy:
			if is_instance_valid(enemy):
				var targets = []
				if (j + 1) in enemy_parity:
					for p in enemy_parity[j + 1]:
						if p - 1 < minion_front_line.size() and minion_front_line[p - 1]:
							targets.append(minion_front_line[p - 1])
				if targets.size() > 0:
					enemy.target = targets[randi() % targets.size()]
				else:
					var non_null_targets = []
					for minion in minion_front_line:
						if minion:
							non_null_targets.append(minion)
					enemy.target = non_null_targets[randi() % non_null_targets.size()]

func set_front_line_attack_state():
	if colliding:
		for minion in minion_front_line:
			if minion:
				if is_instance_valid(minion):
					minion.minion_state = "attack"
		for enemy in enemy_front_line:
			if enemy:
				if is_instance_valid(enemy):
					enemy.enemy_state = "attack"
	else:
		for minion in minion_front_line:
			if minion:
				if is_instance_valid(minion):
					minion.minion_state = ""
		for enemy in enemy_front_line:
			if enemy:
				if is_instance_valid(enemy):
					enemy.enemy_state = ""

func listen_for_damage():
	for minion in minions:
		minion.mattacked.connect(assign_damage)
	for enemy in enemies:
		enemy.eattacked.connect(assign_damage)

func assign_damage(target, damage):
	if is_instance_valid(target):
		target.health = target.health - damage
		var new_health = target.health
		print(target, " recieved ", damage, " damage! It's health is now ", new_health)


# === General Combat ===
func listen_for_death():
	for minion in minions:
		minion.mdied.connect(unit_died)
	for enemy in enemies:
		enemy.edied.connect(unit_died)

func unit_died(unit):
	unit.queue_free()
	initialize_everything()
	check_victory()

func check_victory():
	var victory = ""
	if minions.size() <= 0:
		victory = "lose"
		set_process(false)
		var level_node = get_tree().get_current_scene()
		level_node.victory_screen(victory)
		reset_combat_manager()
	elif enemies.size() <= 0:
		victory = "win"
		set_process(false)
		var level_node = get_tree().get_current_scene()
		level_node.victory_screen(victory)
		reset_combat_manager()



# === This Thing ===

func _process(delta):
	move_grids()
