extends Node2D

signal colliding

var enemy = self
var id:int = 0
var health:int = 0
var damage:int = 0
var speed:int = 0
var drops = null


func set_stats():
	var statblock = id
	$enemy_sprite.texture = load(Minions.minion_list[id]["sprite_file"])
	$enemy_sprite.modulate = Color(1, 0, 0)
	$enemy_sprite.scale = Vector2(0.3, 0.3)
	health = Minions.minion_list[id]["health"]
	damage = Minions.minion_list[id]["damage"]
	speed = Minions.minion_list[id]["speed"]
	CombatManager.enemies.append(enemy)


func _on_area_2d_area_entered(area):
	if area.is_in_group("MinionGroup"):
		colliding.emit()
