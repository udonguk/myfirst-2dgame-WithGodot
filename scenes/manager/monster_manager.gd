extends Node

@export var player: Node2D
@export var monster_scene: PackedScene
@onready var timer: Timer = $Timer

# Called when the node enters the scene tree for the first time.
func _ready():
	timer.timeout.connect(on_timer_timeout)

func on_timer_timeout():
	var monster = monster_scene.instantiate()
	monster.position = player.position
	monster.target = player
	add_child(monster)