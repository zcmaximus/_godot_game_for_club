extends CharacterBody2D

@onready var player: CharacterBody2D = $"../../player"
@onready var hurt_box: Area2D = %HurtBox

var speed = randf_range(100, 150)

func _physics_process(delta: float) -> void:
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * speed
	move_and_slide()
	
	var overlapping_mobs = hurt_box.get_overlapping_bodies()
	for mob in overlapping_mobs:
		if mob.is_in_group("mobs") and mob != self:
			add_collision_exception_with(mob)
			print("collision")
