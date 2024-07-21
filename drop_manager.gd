extends Node

var minion = null
var minion_id:int = 0

func spawn_minion(pos):
	var instance = minion.instantiate()
	instance.position = pos
	instance.scale = Vector2(0.3, 0.3)
	instance.id = minion_id
	get_tree().get_current_scene().add_child(instance)


# Called when the node enters the scene tree for the first time.
# func _ready():
	# pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
# func _process(delta):
	# pass
