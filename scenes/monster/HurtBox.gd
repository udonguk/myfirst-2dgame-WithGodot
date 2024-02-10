class_name HurtBox
extends Area2D


var _life:float = 10.0
func addDemage(demage: float):
	_life -= demage
	# print("take:" + str(demage) + " receive:" + str(_life))
	if(_life <= 0):
		get_parent().queue_free()