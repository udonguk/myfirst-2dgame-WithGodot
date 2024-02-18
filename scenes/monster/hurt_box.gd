class_name HurtBox
extends Area2D

@export var health: Node
var _life:float = 10.0


func addDemage(demage: float):
	var left_health_point = health.deal_demage(demage)
	if(left_health_point == 0):
		get_parent().queue_free()
