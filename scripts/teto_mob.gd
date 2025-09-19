extends CharacterBody2D

@onready var player: CharacterBody2D = $"../../player"
@onready var hurt_box: Area2D = %HurtBox

var speed = randf_range(100, 150)

func _physics_process(delta: float) -> void:
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * speed
	move_and_slide()
	
