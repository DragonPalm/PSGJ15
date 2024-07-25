extends Node

var minion = null
var minion_id:int = 0
var can_spawn = true

func spawn_minion(pos, grid_spot):
	if can_spawn:
		var instance = minion.instantiate()
		instance.position = pos
		instance.scale = Vector2(0.3, 0.3)
		instance.id = minion_id
		instance.grid_spot = grid_spot
		var parent = get_tree().get_current_scene().get_node("minion_grid")
		var node = get_tree().get_current_scene().get_node("minion_grid/minions")
		node.add_child(instance)
		parent.sort_minions()
		return instance
	else:
		pass


# Called when the node enters the scene tree for the first time.
# func _ready():
	# pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
# func _process(delta):
	# pass
