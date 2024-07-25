extends Sprite2D

var has_spawn = false
var minion = null
var circle_instance = self
var grid_spot = ""

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_input_event(viewport, event, shape_idx):
	if DropManager.can_spawn:
		if event is InputEventMouseButton and event.button_index == 1 and event.pressed == false:
			if has_spawn == false:
				minion = DropManager.spawn_minion(position, grid_spot)
				CombatManager.minions.append(minion)
				has_spawn = true
			if has_spawn == true:
				CombatManager.minions.erase(minion)
				minion.queue_free()
				minion = DropManager.spawn_minion(position, grid_spot)
				CombatManager.minions.append(minion)
				has_spawn = true
	else:
		pass
			
