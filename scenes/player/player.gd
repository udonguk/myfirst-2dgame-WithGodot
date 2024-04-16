extends CharacterBody2D

var speed = 400

@onready var player_animation_2d = get_node("AnimatedSprite2D") as AnimatedSprite2D
@onready var body_collision_shape_2d: CollisionShape2D = $CollisionShape2D

func _ready():
	#body_collision_shape_2d.connect()
	pass


func get_input():
	var input_direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	
	if(input_direction.x == 0 and input_direction.y == 0 ):
		player_animation_2d.stop()
	else:
		Common.play_animation_by_direction(input_direction, player_animation_2d)
	velocity = input_direction * speed


func _physics_process(delta):
	get_input()
	move_and_slide()

func body_entered():
	pass
