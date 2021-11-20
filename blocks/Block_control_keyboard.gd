extends Node


signal new_input_vector(input_vector)

var input_vector = Vector2.ZERO


func _physics_process(_delta):
	input_vector = Vector2.ZERO
	
	input_vector.x += Input.get_action_strength("ui_right") - \
						Input.get_action_strength("ui_left")
	input_vector.y += Input.get_action_strength("ui_down") - \
						Input.get_action_strength("ui_up")
	
	emit_signal("new_input_vector", input_vector)
