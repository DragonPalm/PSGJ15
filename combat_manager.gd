extends Node

var level = preload("res://level.tscn")
var minion_grid = null
var enemy_grid = null
var minions = []
var enemies = []
var placement_circles = []
var colliding = false


func _ready():
	set_process(false)


func start_fight():
	for circle in placement_circles:
		circle.queue_free()
	for enemy in enemies:
		enemy.colliding.connect(stop_moving)
	set_process(true)


func set_nodes():
	minion_grid = get_tree().get_current_scene().get_node("minion_grid")
	enemy_grid = get_tree().get_current_scene().get_node("enemy_grid")


func move_grids():
	if not colliding:
		minion_grid.position.x += 5
		enemy_grid.position.x -= 5


func stop_moving():
	colliding = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	move_grids()
