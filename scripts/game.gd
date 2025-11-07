extends Node2D

var times = 0
@onready var timer: Timer = $Timer
@onready var retry_button: Button = $player/retry_button

func _ready():
	retry_button.hide()

func spawn_mob():
	var new_mob = preload("res://scenes/teto_mob.tscn").instantiate()
	%PathFollow2D.progress_ratio = randf()
	new_mob.global_position = %PathFollow2D.global_position
	add_child(new_mob)


func _on_timer_timeout() -> void:
	spawn_mob()
	times += 1
	
	if times == 5:
		timer.wait_time = 1.5
	elif times == 20:
		timer.wait_time = 1.0
	elif times == 50:
		timer.wait_time = 0.5
	elif times == 100:
		timer.wait_time = 0.2



func _on_retry_button_pressed() -> void:
	var _current_scene = get_tree().current_scene
	get_tree().reload_current_scene()
	Score.ScoreCount = 0
	Engine.time_scale = 1.0
