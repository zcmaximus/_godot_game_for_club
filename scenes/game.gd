extends Node2D

var times = 0
@onready var timer: Timer = $Timer

func spawn_mob():
	var new_mob = preload("res://scenes/teto_mob.tscn").instantiate()
	%PathFollow2D.progress_ratio = randf()
	new_mob.global_position = %PathFollow2D.global_position
	add_child(new_mob)


func _on_timer_timeout() -> void:
	spawn_mob()
	times += 1
	if times == 5:
		timer.wait_time = 1.0
	elif times == 20:
		timer.wait_time = 1.0
	elif times == 50:
		timer.wait_time = 0.5
