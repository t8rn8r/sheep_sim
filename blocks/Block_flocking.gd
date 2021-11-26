extends Node


signal new_input_vector(input_vector)

var input_vector = Vector2.ZERO
var bodies


func _physics_process(_delta):
	var flocking = get_parent().stats.blocks["flocking"]
	var friendly_body
	
	bodies = get_parent().sight.get_overlapping_bodies()
	input_vector = Vector2.ZERO
	
	
	if bodies.size() > 0:
		var body = bodies[randi() % bodies.size()]

		if body.type in flocking["flocks"]:
			friendly_body = body
			var distance = get_parent().position.distance_to(body.position)
			if randf() < flocking["flocking_desire"]:
				if distance > flocking["distance"]:
					input_vector += get_parent().position.direction_to(body.position)
				elif distance < flocking["distance"]:
					input_vector -= get_parent().position.direction_to(body.position)
			if randf() < flocking["space_desire"]:
					input_vector -= get_parent().position.direction_to(body.position)
#
	for body in bodies:
		if body.type in flocking["fears"]:
			if friendly_body:
				input_vector += friendly_body.velocity
				if randf() < 0.7:
					continue

			var distance = get_parent().position.distance_to(body.position)
			var inverse_distance = 1/distance

			input_vector -= get_parent().position.direction_to(body.position)*inverse_distance
#			input_vector.x += (randf()-0.5)
#			input_vector.y += (randf()-0.5)
			
	emit_signal("new_input_vector",input_vector.normalized())
