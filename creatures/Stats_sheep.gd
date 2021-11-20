extends "res://creatures/Stats.gd"

func _init():
	type = "sheep"

	sprite = preload("res://sprites/sheep.png")
#	sprite_frames = 1
	
#	collision_radius = 0.5
#	collision_height = 0
#	collision_angle = 0
	
	sight_radius = 25
	
	## blocks
	# movement
	var moving = blocks["moving"]
	moving["active"] = true
	moving["max_speed"] = 10
	moving["acceleration"] = 15
	moving["friction"] = 50

#	# player control
	var control = blocks["control"]
	control["active"] = false
#	control["type"] = "keyboard"

	# wandering
	var wandering = blocks["wandering"]
	wandering["active"] = true
	
	# flocking
	var flocking = blocks["flocking"]
	flocking["active"] = true
	flocking["flocking_distance"] = 20
	flocking["flocking_desire"] = 0.6
	flocking["space_desire"] = 0.4
	flocking["flocks"] = ["sheep"]
	flocking["fears"] = ["player"]
	
