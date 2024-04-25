class_name HurtBoxComponent
extends Area2D

@export var health: Node
var _life:float = 10.0


func addDemage(demage: float):
	print('HurtBoxCom')
	health.deal_demage(demage)
