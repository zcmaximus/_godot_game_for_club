extends CharacterBody2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@export var SPEED = 300.0
@onready var hurt_box: Area2D = $HurtBox
@onready var label: Label = $Label
@onready var progress_bar: ProgressBar = $ProgressBar
@onready var sword: Node2D = $orbit_pivot/sword
@onready var orbit_pivot: Node2D = $orbit_pivot

var last_direction: Vector2 = Vector2.ZERO
var health = 100

func _ready() -> void:
	sword.position = Vector2(125, 0)

func _process(delta: float) -> void:
	orbit_pivot.rotation += delta * 2

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
	


func _on_ready() -> void:

	label.hide()
	


func _on_hurt_box_body_entered(body: Node2D) -> void:
	print("damage")
	print("HurtBox triggered by:", body.name)
	if body.is_in_group("enemies"):
		health -= 10
	
	progress_bar.value = health
	
	print(health)
	
	if(health <= 0):
		var tween = create_tween()
		label.show()
		Engine.time_scale = 0.0
