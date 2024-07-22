extends Node

var minions = []
var enemies = []

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()

func choose_target(instance):
	if instance in minions:
		var rand_index = randi() % enemies.size()
		var target = enemies[rand_index]
		return target
	elif instance in enemies:
		var rand_index = randi() % minions.size()
		var target = minions[rand_index]
		return target
	return null
		
func start_fight():
	for instance in minions:
		var target = choose_target(instance)
		instance.minion.target = target
	for instance in enemies:
		var target = choose_target(instance)
		instance.target = target.minion

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
