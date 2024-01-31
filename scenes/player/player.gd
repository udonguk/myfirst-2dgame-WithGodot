extends CharacterBody2D

var speed = 400

@onready var player_animation_2d = get_node("AnimatedSprite2D") as AnimatedSprite2D

func get_input():
	var input_direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	
	# 동작안함
	# if input_direction.length_squared() > 0:
		# input_direction = input_direction.normalized()

	if(input_direction.x >= 1):
			player_animation_2d.play("move_right")
	if(input_direction.x <= -1):
			player_animation_2d.play("move_left")
	if(input_direction.y < 0):
		player_animation_2d.play("move_up")
	if(input_direction.y > 0):
		player_animation_2d.play("move_down")
	if(input_direction.x == 0 and input_direction.y == 0 ):
		player_animation_2d.stop()

	velocity = input_direction * speed

func _physics_process(delta):
	get_input()
	move_and_slide()