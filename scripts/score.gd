extends Node

var ScoreCount: int = 0

var high_score: int = 0

const SAVE_PATH = "user://high_score.save"

func _ready():
	load_high_score()
	print(high_score)

func add_score(amount: int):
	Score.ScoreCount += amount
	if Score.ScoreCount > high_score:
		high_score = Score.ScoreCount
		save_high_score()

func save_high_score():
	var file = FileAccess.open(SAVE_PATH, FileAccess.WRITE)
	file.store_32(high_score)
	file.close()

func load_high_score():
	if FileAccess.file_exists(SAVE_PATH):
		var file = FileAccess.open(SAVE_PATH, FileAccess.READ)
		high_score = file.get_32()
		file.close()
