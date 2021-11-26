extends "res://creatures/Creature_utils.gd"


func init(name):
	# type of creature
	stats = Stats[name].instance().duplicate()
	type = stats.type
	
	# sprite
	new_sprite()
	# sight_area
	new_sight_area()
	# collision_shape
	new_collision_shape()
	# camera
	new_camera()
	
	## load blocks
	for key in stats.blocks.keys():
		var current = stats.blocks[key]
		if current["active"]:
			
			match current["type"]:
				"keyboard":
					current["location"] = \
					  preload("res://blocks/Block_control_keyboard.tscn")
				"click":
					current["location"] = \
					  preload("res://blocks/Block_control_click.tscn")
					
			var Block = current["location"]
			var block = load_block(Block)
			
			match current["controls"]:
				"moving":
					block.connect("new_input_vector",get_node("Block_move"),"_on_new_input_vector")
		
	get_node("Block_move").connect("move",get_node("."),"_on_move")


func _on_move(v):
	velocity = v
