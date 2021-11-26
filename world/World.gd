extends Node2D


var Creature = preload("res://creatures/scenes/Creature.tscn")
var Chunk = preload("res://world/Chunk.tscn")

var chunk_size = 64
var chunk_render_radius = 3
onready var chunks = {}

var player
var player_chunk_old
var player_chunk = Vector2.ZERO
var creatures = []


func _ready():
	player = Creature.instance().duplicate()
	player.init("player")
	player.set_camera_current()
	add_child(player)
	
	for i in range(1):
		creatures.append(Creature.instance().duplicate())
		creatures[i].init("sheep")
		creatures[i].position = Vector2(randf()*80,randf()*80)
		add_child(creatures[i])


func _process(delta):
	player_chunk.x = int(player.position.x / chunk_size)
	player_chunk.y = int(player.position.y / chunk_size)
	
	if player_chunk != player_chunk_old:
		update_chunks()
		
	player_chunk_old = player_chunk


func update_chunks():
	for i in range(-chunk_render_radius,chunk_render_radius):
		for ii in range(-chunk_render_radius,chunk_render_radius):
			var current_chunk = Vector2(player_chunk.x+i,player_chunk.y+ii)
			if current_chunk in chunks:
				continue
			else:
				chunks[current_chunk] = Chunk.instance().duplicate()
				add_child(chunks[current_chunk])
				chunks[current_chunk].new_chunk(chunk_size, current_chunk)
