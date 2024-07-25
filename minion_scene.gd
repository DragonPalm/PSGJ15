extends Node2D

signal mattacked
signal mdied
@onready var health_bar = $HealthBar
@onready var damage_bar = $HealthBar/DamageBar
@onready var timer = $HealthBar/Timer
var id:int = 0
var health:int = 0 : set = _set_health
var max_health:int = 0
var damage:int = 0
var speed:float = 0
var harvest:int = 0
var ranged = false
var grid_spot = ""
var target = null
var minion_state = ""

var frame_interval = 20
var frame_counter = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	set_process(false)
	$minion_sprite.texture = load(Minions.minion_list[id]["sprite_file"])
	health = Minions.minion_list[id]["health"]
	max_health = health
	health_bar.max_value = health
	damage_bar.max_value = health
	health_bar.value = health
	damage_bar.value = health
	damage = Minions.minion_list[id]["damage"]
	speed = Minions.minion_list[id]["speed"]
	harvest = Minions.minion_list[id]["harvest"]
	ranged = Minions.minion_list[id]["ranged"]
	set_process(true)

func _set_health(new_health):
	var prev_health = health
	if new_health < prev_health:
		health = min(max_health, new_health)
		health_bar.value = health
		if health < prev_health:
			timer.start()
		else:
			damage_bar.value = health
	else:
		health = new_health

func _on_timer_timeout():
	damage_bar.value = health


# === States ===
func set_state(state):
	if state == "attack":
		minion_state = "attack"

func randomize_damage():
	var percentage = randf_range(-0.1, 0.1)
	var variance = damage * percentage
	return int(variance + damage)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if minion_state == "attack":
		frame_counter += 1
		var adj_interval = frame_interval / speed
		if frame_counter >= adj_interval:
			var random_damage = randomize_damage()
			print(self, " attacked ", target, " for ", random_damage, " damage!")
			mattacked.emit(target, random_damage)
			frame_counter = 0
	
	if health <= 0:
		CombatManager.minions.erase(self)
		mdied.emit(self)
