extends CharacterBody2D

var speed = 400

@onready var player_animation_2d = get_node("AnimatedSprite2D") as AnimatedSprite2D

# func _ready():
# 	$MelleArea2D.body_entered.connect(on_area_enterd)


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
