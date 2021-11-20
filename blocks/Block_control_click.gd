extends Node


signal new_input_vector(input_vector)

var input_vector = Vector2.ZERO

onready var target = get_parent().position

onready var screen_size = get_viewport().get_visible_rect().size


func _input(event):
	if event is InputEventMouseButton:
		target = event.position


func _physics_process(_delta):
	input_vector = Vector2.ZERO
	var position = get_parent().position
	
	if position.distance_to(target) > 0.1:
		input_vector = position.direction_to(target)
	
	
	emit_signal("new_input_vector", input_vector)
