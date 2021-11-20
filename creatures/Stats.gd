extends Node

export var type = "UNDEFINED"

export var sprite = preload("res://sprites/creature.png")
export var sprite_frames = 1

export var collision_radius = 0.5
export var collision_height = 0
export var collision_angle = 0

export var sight_radius = 10

### blocks
export (Dictionary) var blocks = {
	# does it move by itself?
	"moving": {
		"active": false,
		"type": "",
		"location": preload("res://blocks/Block_move.tscn"),
		"controls": "",
		"max_speed": 10,
		"acceleration": 20,
		"friction": 500
	},
	# type of player control
	"control": {
		"active": false,
		"type": "",
		"location": false,
		"controls": "moving"
	},
	# random wandering
	"wandering": {
		"active": false,
		"type": "",
		"location": preload("res://blocks/Block_wandering.tscn"),
		"controls": "moving",
		# "agitation" values
		"current": 0.1,
		"max": 1,
		"min": 0.1
	},
	# flocking
	"flocking": {
		"active": false,
		"type": "",
		"location": preload("res://blocks/Block_flocking.tscn"),
		"controls": "moving",
		"distance": 10,
		"flock_desire": 0.5,
		"space_desire": 0.5,
		"flocks": [""],
		"fears": [""]
	}
}
