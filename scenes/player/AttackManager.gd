class_name AttackManager
extends Node

@export var player: Node2D
@onready var meleeHitBox: Area2D = $MeleeHitBox
@onready var attack_rate: Timer = $AttackRate

var animation_scene = preload("res://scenes/ability/slash_curved_attack.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	attack_rate.timeout.connect(on_timer_timeout)

func _process(delta):
	$MeleeHitBox.global_position = player.global_position - Vector2(0, 14)


func on_timer_timeout():
	if(!is_instance_valid(meleeHitBox)):
		return
	var close_enemy = meleeHitBox.get_overlapping_areas()
	if close_enemy.size() == 0 :
		return
	
	close_enemy.sort_custom(func(a: Node2D, b: Node2D):
		var a_distance = a.global_position.distance_squared_to(player.global_position)
		var b_distance = b.global_position.distance_squared_to(player.global_position)
		
		return a_distance < b_distance
	)

	var attackNode2D = animation_scene.instantiate() as Node2D
	attackNode2D.global_position = player.global_position
	attackNode2D.look_at(close_enemy[0].global_position)

	get_parent().add_child(attackNode2D)
