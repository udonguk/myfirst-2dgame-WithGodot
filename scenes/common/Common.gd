extends Node

func play_animation_by_direction(input_direction: Vector2, animated_sprite_2d: AnimatedSprite2D) -> void:
	var input_degree: float = rad_to_deg(input_direction.angle())
	if(input_degree <= -22.5 and input_degree > -67.5): #up right corner
		animated_sprite_2d.play("move_right")
	elif(input_degree <= -67.5 and input_degree > -112.5): #up
		animated_sprite_2d.play("move_up")
	elif(input_degree <= -112.5 and input_degree > -157.5): #up left corner
		animated_sprite_2d.play("move_left")
	elif((input_degree <= -157.5 and input_degree >= -180) 
		or (input_degree <= 180 and input_degree > 157.5)): #left
		animated_sprite_2d.play("move_left")
	elif(input_degree <= 157.5 and input_degree > 112.5): #down left corner
		animated_sprite_2d.play("move_left")
	elif(input_degree <= 112.5 and input_degree > 67.5): #down
		animated_sprite_2d.play("move_down")
	elif(input_degree <= 67.5 and input_degree > 22.5): #down right corner
		animated_sprite_2d.play("move_right")
	else:
		animated_sprite_2d.play("move_right") #right
