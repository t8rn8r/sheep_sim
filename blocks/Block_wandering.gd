extends Node


signal new_input_vector(input_vector)

var input_vector = Vector2.ZERO


func _physics_process(_delta):
	input_vector = Vector2.ZERO
		
	input_vector.x += (randf()-0.5)
	input_vector.y += (randf()-0.5)
	
	emit_signal("new_input_vector", input_vector.normalized())
