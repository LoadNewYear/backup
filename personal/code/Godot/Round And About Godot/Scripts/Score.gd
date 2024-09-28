extends Node

var score = 0
var highscore = 0

const SAVE_PATH = "user://high_score.dat"

func _ready():
	load_highscore()

func _on_Ball_hit():
	score += 1
	$"../ScoreLabel".text = "%s" % score
	$"../ScoreLabel2".text = "%s" % highscore
	if score > highscore:
		highscore = score
		save_highscore()

func save_highscore():
	var file = File.new()
	var err = file.open(SAVE_PATH, File.WRITE)
	if err != OK:
		print("Failed to open file for writing: ", err)
		return
	file.store_var(highscore)
	file.close()

func load_highscore():
	var file = File.new()
	if file.file_exists(SAVE_PATH):
		file.open(SAVE_PATH, File.READ)
		highscore = file.get_var()
		file.close()
		$"../ScoreLabel2".text = "%s" % highscore
	else:
		print("awiue")
