extends KinematicBody2D

var Stats = {
	"":			preload("res://creatures/scenes/Stats.tscn"),
	"player":	preload("res://creatures/scenes/Stats_player.tscn"),
	"sheep":	preload("res://creatures/scenes/Stats_sheep.tscn")
}


var stats
var type
var sprite
var collision
var collision_shape
var click_area
var click_area_shape
var sight
var sight_area
var camera

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
	var Collision = preload("res://creatures/scenes/Collision.tscn")
	collision = Collision.instance().duplicate()
	add_child(collision)
	
	collision_shape = collision.get_shape().duplicate()
	collision_shape.set_radius(stats.collision_radius)
	collision_shape.set_height(stats.collision_height)
	collision.set_shape(collision_shape)
	
	var Click_area = preload("res://creatures/scenes/Click_area.tscn")
	click_area = Click_area.instance().duplicate()
	add_child(click_area)
	
	click_area_shape = click_area.get_shape().duplicate()
	click_area_shape.set_radius(stats.collision_radius)
	click_area_shape.set_height(stats.collision_height)
	click_area.set_shape(click_area_shape)
	click_area.connect("clicked",self,"on_click")
	
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


func new_camera():
	camera = Camera2D.new()
	add_child(camera)
	
func set_camera_current():
	camera.make_current()


func load_block(Block):
	var block = Block.instance().duplicate()
	add_child(block)
	return block


func on_click():
	set_camera_current()
