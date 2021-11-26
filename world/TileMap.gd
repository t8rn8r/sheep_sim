extends TileMap



func add_tiles(chunk_size, position):
	var chunk_position = Vector2(position.x*chunk_size, position.y*chunk_size)
	
	for x in range(chunk_size):
		for y in range(chunk_size):
			set_cell(chunk_position.x+x,chunk_position.y+y,0,false,false,false,_get_autotile_coord(0))


func _get_autotile_coord(id):
	var size = tile_set.tile_get_region(id).size
	var x = randi() % int(size.x / tile_set.autotile_get_size(id).x)
	var y = randi() % int(size.y / tile_set.autotile_get_size(id).y)
	return Vector2(x,y)
