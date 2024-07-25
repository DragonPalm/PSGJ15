extends Node

enum MinionType {
	NULL, SHADOW, FLESH, BONE, BILE, MIND, BLOOD, VILLAGER, KNIGHT, SOLDIER, ARCHER, PRIEST, MAGE
}

var minion_list:Dictionary = {
	1: {"name": "Shadow",
		"sprite_file": "res://Graphics/MinionSprites/MBaseNUSprite.png",
		"health": 100,
		"damage": 5,
		"speed": 0.6,
		"harvest": 5,
		"ranged": false
		},
	2: {"name": "Flesh",
		"sprite_file": "res://Graphics/MinionSprites/MFleshSprite.png",
		"health": 360,
		"damage": 10,
		"speed": 0.5,
		"harvest": 5,
		"ranged": false
		},
	3: {"name": "Bone",
		"sprite_file": "res://Graphics/MinionSprites/MBoneSprite.png",
		"health": 200,
		"damage": 35,
		"speed": 1.2,
		"harvest": 20,
		"ranged": false
		},
	4: {"name": "Bile",
		"sprite_file": "res://Graphics/MinionSprites/MBileSprite.png",
		"health": 140,
		"damage": 40,
		"speed": 0.8,
		"harvest": 10,
		"ranged": true
		},
	5: {"name": "Mind",
		"sprite_file": "res://Graphics/MinionSprites/MMindSprite.png",
		"health": 100,
		"damage": 5,
		"speed": 0.8,
		"harvest": 15,
		"ranged": false
		},
	6: {"name": "Blood",
		"sprite_file": "res://Graphics/MinionSprites/MBloodSprite.png",
		"health": 120,
		"damage": 20,
		"speed": 1,
		"harvest": 25,
		"ranged": true
		},
	7: {"name": "Villager",
		"sprite_file": "res://Graphics/EnemySprites/EBaseNUSprite.png",
		"health": 100,
		"damage": 5,
		"speed": 0.6,
		"harvest": 5,
		"ranged": false
		},
	8: {"name": "Knight",
		"sprite_file": "res://Graphics/EnemySprites/EFleshSprite.png",
		"health": 360,
		"damage": 10,
		"speed": 0.5,
		"harvest": 5,
		"ranged": false
		},
	9: {"name": "Soldier",
		"sprite_file": "res://Graphics/EnemySprites/EBoneSprite.png",
		"health": 200,
		"damage": 35,
		"speed": 1.2,
		"harvest": 20,
		"ranged": false
		},
	10: {"name": "Archer",
		"sprite_file": "res://Graphics/EnemySprites/EBileSprite.png",
		"health": 140,
		"damage": 40,
		"speed": 0.8,
		"harvest": 10,
		"ranged": true
		},
	11: {"name": "Priest",
		"sprite_file": "res://Graphics/EnemySprites/EMindSprite.png",
		"health": 100,
		"damage": 5,
		"speed": 0.8,
		"harvest": 15,
		"ranged": false
		},
	12: {"name": "Mage",
		"sprite_file": "res://Graphics/EnemySprites/EBloodSprite.png",
		"health": 120,
		"damage": 20,
		"speed": 1,
		"harvest": 25,
		"ranged": true
		}
}
