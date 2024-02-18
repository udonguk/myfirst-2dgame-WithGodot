class_name FloatingText
extends Node2D

@onready var label: Label = $Label

func floatText(target: Node2D, floating_text: String) -> void:
	label.text = floating_text
	global_position = target.global_position + (Vector2.UP * target.scale * 20)
	var tween = create_tween()
	tween.tween_property(self, "global_position", global_position + (Vector2.UP * 20), 0.3)\
		.set_ease(Tween.EASE_OUT)\
		.set_trans(Tween.TRANS_CIRC)
	
	tween.tween_callback(queue_free)
