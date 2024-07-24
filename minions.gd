extends Node

enum MinionType {
	NULL, SHADOW, FLESH, BONE, BILE, MIND, BLOOD, VILLAGER, KNIGHT, SOLDIER, ARCHER, PRIEST, MAGE
}

var minion_list:Dictionary = {
	1: {"name": "Shadow",
		"sprite_file": "res://Graphics/MinionSprites/MBaseNUSprite.png",
		"health": 50,
		"damage": 5,
		"speed": 60,
		"harvest": 5
		},
	2: {"name": "Flesh",
		"sprite_file": "res://Graphics/MinionSprites/MFleshSprite.png",
		"health": 180,
		"damage": 10,
		"speed": 50,
		"harvest": 5
		},
	3: {"name": "Bone",
		"sprite_file": "res://Graphics/MinionSprites/MBoneSprite.png",
		"health": 100,
		"damage": 35,
		"speed": 120,
		"harvest": 20
		},
	4: {"name": "Bile",
		"sprite_file": "res://Graphics/MinionSprites/MBileSprite.png",
		"health": 70,
		"damage": 40,
		"speed": 80,
		"harvest": 10
		},
	5: {"name": "Mind",
		"sprite_file": "res://Graphics/MinionSprites/MMindSprite.png",
		"health": 50,
		"damage": 5,
		"speed": 80,
		"harvest": 15
		},
	6: {"name": "Blood",
		"sprite_file": "res://Graphics/MinionSprites/MBloodSprite.png",
		"health": 60,
		"damage": 20,
		"speed": 100,
		"harvest": 25
		},
	7: {"name": "Villager",
		"sprite_file": "res://Graphics/EnemySprites/EBaseNUSprite.png",
		"health": 50,
		"damage": 5,
		"speed": 60,
		"harvest": 5
		},
	8: {"name": "Knight",
		"sprite_file": "res://Graphics/EnemySprites/EFleshSprite.png",
		"health": 180,
		"damage": 10,
		"speed": 50,
		"harvest": 5
		},
	9: {"name": "Soldier",
		"sprite_file": "res://Graphics/EnemySprites/EBoneSprite.png",
		"health": 100,
		"damage": 35,
		"speed": 120,
		"harvest": 20
		},
	10: {"name": "Archer",
		"sprite_file": "res://Graphics/EnemySprites/EBileSprite.png",
		"health": 70,
		"damage": 40,
		"speed": 80,
		"harvest": 10
		},
	11: {"name": "Priest",
		"sprite_file": "res://Graphics/EnemySprites/EMindSprite.png",
		"health": 50,
		"damage": 5,
		"speed": 80,
		"harvest": 15
		},
	12: {"name": "Mage",
		"sprite_file": "res://Graphics/EnemySprites/EBloodSprite.png",
		"health": 60,
		"damage": 20,
		"speed": 100,
		"harvest": 25
		}
}
