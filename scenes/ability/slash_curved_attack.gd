extends Node2D

@onready var area_2d: Area2D = $Area2D
# Called when the node enters the scene tree for the first time.
func _ready():
	area_2d.area_entered.connect(on_area_entered)


func on_area_entered(area: Area2D):
	if !area.get_parent().is_in_group("monsters"):
		return
	

	var hurt_box = area as HurtBoxComponent
	hurt_box.addDemage(5)
