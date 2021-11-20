extends KinematicBody2D

var Stats = {
	"":			preload("res://creatures/Stats.tscn"),
	"player":	preload("res://creatures/Stats_player.tscn"),
	"sheep":	preload("res://creatures/Stats_sheep.tscn")
}


var stats
var type
var sprite
var collision_shape
var sight
var sight_area

var velocity

func new_sprite():
	sprite = Sprite.new()
	sprite.set_texture(stats.sprite)
	sprite.set_hframes(stats.sprite_frames)
	add_child(sprite)
	
func set_sprite(n):
	stats.sprite = n
	sprite.set_texture(n)


func new_collision_shape():
	collision_shape = CollisionShape2D.new()
	collision_shape.set_shape(CapsuleShape2D.new())
	add_child(collision_shape)
	collision_shape = collision_shape.get_shape()
	collision_shape.set_radius(stats.collision_radius)
	collision_shape.set_height(stats.collision_height)
	
func set_collision_radius(n):
	stats.collision_radius = n
	collision_shape.set_radius(n)
	
func set_collision_height(n):
	stats.collision_height = n
	collision_shape.set_height(n)


func new_sight_area():
	sight = Area2D.new()
	add_child(sight)
	sight_area = CollisionShape2D.new()
	sight_area.set_shape(CircleShape2D.new())
	sight.add_child(sight_area)
	sight_area = sight_area.get_shape()
	sight_area.set_radius(stats.sight_radius)
	
func set_sight_radius(n):
	stats.sight_radius = n 
	sight_area.set_radius(n)


func load_block(Block):
	var block = Block.instance().duplicate()
	add_child(block)
	return block

