extends CharacterBody2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@export var SPEED = 300.0

var last_direction: Vector2 = Vector2.ZERO

func _physics_process(delta: float) -> void:
	var direction = Input.get_vector("move_left","move_right","move_up","move_down")
	
	animated_sprite_2d.flip_h = false
	
	if direction == Vector2.ZERO:
		animated_sprite_2d.play("idle")
		
	else:
		if direction.x > 0:
			animated_sprite_2d.flip_h = false
			
		elif direction.x < 0:
			animated_sprite_2d.flip_h = true
			
			
		animated_sprite_2d.play("running")
		
		
	velocity = direction * SPEED
	move_and_slide()
	
