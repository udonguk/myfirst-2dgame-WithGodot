extends RigidBody2D

@export var target : Node2D
@onready var animation_2d = get_node("AnimatedSprite2D") as AnimatedSprite2D

var move_speed: int = 50

# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group("monsters")
	gravity_scale = 0 # 중력제거


func _physics_process(_delta):
	if(target == null):
		return
	var direction = position.direction_to(target.global_position)
	# play_animation(direction)
	Common.play_animation_by_direction(direction, animation_2d)
	linear_velocity = direction * move_speed
