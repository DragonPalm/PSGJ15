extends Control

var scene = null
var current_music = null


func _ready():
	var scene_tree = get_tree()
	scene_tree.connect("tree_changed", Callable(self, "_on_tree_changed"))


func _on_tree_changed():
	if not get_tree() or not get_tree().root:
		return
		
	var current_scene = get_tree().current_scene
	if current_scene == scene:
		pass
	else:
		if current_scene:
			if current_scene.is_in_group("MainMenu"):
				if current_music and current_music != $menu_music:
					current_music.stop()
					$menu_music.play()
					current_music = $menu_music
				elif not current_music:
					$menu_music.play()
					current_music = $menu_music
				else:
					pass
			elif current_scene.is_in_group("BattleMap"):
				if current_music and current_music != $battle_music:
					current_music.stop()
					$battle_music.play()
					current_music = $battle_music
				else:
					pass
