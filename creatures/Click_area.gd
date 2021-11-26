extends Area2D


signal clicked


func _input_event(_viewport, _event, _shape_idx):
	if Input.is_action_just_pressed("ui_click"):
		emit_signal("clicked")


func get_shape():
	return $Click_shape.get_shape()
	
func set_shape(shape):
	$Click_shape.set_shape(shape)
