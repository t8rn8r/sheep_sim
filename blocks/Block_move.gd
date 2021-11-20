extends Node

signal move(velocity)

var velocity = Vector2.ZERO
var input_vector = Vector2.ZERO

onready var screen_size = get_viewport().get_visible_rect().size


func _physics_process(delta):
	var movement = get_parent().stats.blocks["moving"]
	# if there's an input vector...
	if input_vector != Vector2.ZERO:
		# normalize the input vector
		input_vector = input_vector.normalized()
		# steer object in direction of input vector
		velocity = velocity.move_toward(input_vector*movement["max_speed"], movement["acceleration"] * delta)
		input_vector = Vector2.ZERO
	else:
		velocity = velocity.move_toward(Vector2.ZERO, movement["friction"] * delta)
	
	var position_x = get_parent().position.x
	var position_y = get_parent().position.y
	
	if position_x < 0 || position_x > screen_size.x:
		velocity.x = -velocity.x
	if position_y < 0 || position_y > screen_size.y:
		velocity.y = -velocity.y
	
	get_parent().position.x = \
	  clamp(get_parent().position.x, 0, screen_size.x)
	get_parent().position.y = \
	  clamp(get_parent().position.y, 0, screen_size.y)
	
	emit_signal("move",velocity)
	velocity = get_parent().move_and_slide(velocity)

func _on_new_input_vector(n):
	input_vector += n
