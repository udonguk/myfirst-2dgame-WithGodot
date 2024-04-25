extends Area2D

var floating_text_scene = preload("res://scenes/components/fx/floating_text.tscn")

func _ready():
	body_entered.connect(on_body_entered)

func on_body_entered(body: Node2D):
	if body is MediPackItem:
		var _medi_item = body as MediPackItem
		var _floatingText = floating_text_scene.instantiate() as FloatingText
		owner.get_parent().add_child(_floatingText)
		_floatingText.floatText(owner, '+' + str(_medi_item.point))
		body.queue_free()
		
	else:
		print('Unknown in gather spot :', body)
