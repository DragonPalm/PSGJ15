extends Node2D

var id:int = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	$minion_sprite.texture = load(Minions.minion_list[id]["sprite_file"])


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
