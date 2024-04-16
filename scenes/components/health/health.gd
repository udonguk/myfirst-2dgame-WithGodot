class_name Health
extends Node

@export var initial_health_point: float = 10
var floating_text_scene = preload("res://scenes/components/fx/floating_text.tscn")

signal died

var _health_point: float = 0:
	get:
		return _health_point
	set(point):
		_health_point = point


func _ready():
	_health_point = initial_health_point
	
	
func deal_demage(demage: float) -> float :
	var floatingText = floating_text_scene.instantiate() as FloatingText
	owner.get_parent().add_child(floatingText)
	floatingText.floatText(owner, str(demage))
	_health_point = max(_health_point - demage, 0)
	
	if(_health_point == 0):
		died.emit()
		
	return _health_point
