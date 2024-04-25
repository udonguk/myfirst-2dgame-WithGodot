class_name MediPackItem
extends RigidBody2D

var target: Node2D
var move_speed: int = 100
var point: int = 10:
	get:
		return point

func _ready():
	add_to_group("items")
	
	
func _physics_process(_delta):
	if(target == null):
		return
	var direction = position.direction_to(target.global_position)
	linear_velocity = direction * move_speed
