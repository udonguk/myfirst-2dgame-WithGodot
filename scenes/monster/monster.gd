extends RigidBody2D

@export var target : Node2D
@export_range(0.0, 1.0) var medi_pack_gen_rate: float = 0.0
@onready var animation_2d = get_node("AnimatedSprite2D") as AnimatedSprite2D
@export var health_item_scene: PackedScene
@onready var health: Health = $Health

var move_speed: int = 50

# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group("monsters")
	gravity_scale = 0 # 중력제거
	health.died.connect(on_died)


func _physics_process(_delta):
	if(target == null):
		return
	var direction = position.direction_to(target.global_position)
	# play_animation(direction)
	Common.play_animation_by_direction(direction, animation_2d)
	linear_velocity = direction * move_speed


func on_died():
	print(medi_pack_gen_rate)
	if(randf_range(0.0, 1.0) < medi_pack_gen_rate):
		var heal_item: Node2D = health_item_scene.instantiate() as Node2D
		heal_item.global_position = global_position
		get_parent().add_child(heal_item)	
	
	queue_free()
