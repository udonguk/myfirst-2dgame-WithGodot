class_name HurtBox
extends Area2D

@export var health: Node
var _life:float = 10.0


func addDemage(demage: float):
	print('HurtBox')
	health.deal_demage(demage)
