extends RigidBody2D

@export var target : Node2D
@onready var animation_2d = get_node("AnimatedSprite2D") as AnimatedSprite2D

var move_speed: int = 50

# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group("monsters")
	gravity_scale = 0 # 중력제거

func play_animation(direction: Vector2) -> void:
	if direction.y > 0 :
		animation_2d.play("move_down")
	elif direction.y < 0:
		animation_2d.play("move_up")
	elif direction.x > 0:
		animation_2d.play("move_right")
	elif direction.x < 0:
		animation_2d.play("move_left")
	else:
		animation_2d.stop()

func _physics_process(_delta):
	var direction = position.direction_to(target.global_position)
	play_animation(direction)
	linear_velocity = direction * move_speed