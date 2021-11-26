extends "res://creatures/Stats.gd"

func _init():
	type = "player"

	sprite = preload("res://sprites/person.png")
	sprite_frames = 3
	
	collision_radius = 0.5
	collision_height = 2
#	collision_angle = 0
	
	sight_radius = 0
	
	## blocks
	# movement
	blocks["moving"]["active"] = true
#	blocks["moving"]["max_speed"] = 10
	blocks["moving"]["acceleration"] = 150
#	blocks["moving"]["friction"] = 500
	
	# control type
	blocks["control"]["active"] = true
	blocks["control"]["type"] = "keyboard"
	
	# wandering
	blocks["wandering"]["active"] = false
	
	# flocking
	blocks["flocking"]["active"] = false
	
