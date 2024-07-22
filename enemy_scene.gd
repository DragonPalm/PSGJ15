extends Node2D

var enemy = self
var target = null

# Called when the node enters the scene tree for the first time.
func _ready():
	CombatManager.enemies.append(enemy)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
