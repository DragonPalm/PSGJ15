extends Node2D

var id:int = 0
var health:int = 0
var damage:int = 0
var speed:int = 0
var harvest:int = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	$minion_sprite.texture = load(Minions.minion_list[id]["sprite_file"])
	health = Minions.minion_list[id]["health"]
	damage = Minions.minion_list[id]["damage"]
	speed = Minions.minion_list[id]["speed"]
	harvest = Minions.minion_list[id]["harvest"]

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
