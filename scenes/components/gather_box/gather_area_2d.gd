extends Area2D

func _ready():
	body_entered.connect(on_body_entered)

func on_body_entered(item):
	var node_item = item as MediPackItem
	node_item.target = owner
	print('gather area :', item)
