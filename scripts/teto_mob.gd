extends CharacterBody2D

@onready var player = get_node("/root/game/player")


@export var Health = 0
var speed = randf_range(100, 150)

func _ready() -> void:
	add_to_group("enemies")

func _physics_process(_delta: float) -> void:
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * speed
	move_and_slide()
	
