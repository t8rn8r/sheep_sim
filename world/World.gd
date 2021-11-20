extends Node2D


var Creature = preload("res://creatures/Creature.tscn")


func _ready():
	var player = Creature.instance().duplicate()
	player.init("player")
	player.position = Vector2(40,40)
	add_child(player)
	
	var sheeps = []
	for i in range(50):
		sheeps.append(Creature.instance().duplicate())
		sheeps[i].init("sheep")
		sheeps[i].position = Vector2(randf()*80,randf()*80)
		add_child(sheeps[i])
		
