class_name Main
extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	var viewport = get_tree().get_root()
	viewport.size = Vector2(480, 720)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
