extends Node

@export var player: Node2D
@export var monster_scene: PackedScene
@onready var timer: Timer = $Timer

var SPAWN_RADIUS = 300

# Called when the node enters the scene tree for the first time.
func _ready():
	timer.timeout.connect(on_timer_timeout)

func on_timer_timeout():
	var monster = monster_scene.instantiate() as Node2D

	var random_direction = Vector2.RIGHT.rotated(randf_range(0, TAU))
	var spawn_position = player.global_position + (random_direction * SPAWN_RADIUS)
	monster.position = spawn_position
	monster.target = player

	get_parent().add_child(monster)
