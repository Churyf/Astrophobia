extends Label

var score = 0
var timer = 1.0

func _ready():
	set_process(true)

func _process(delta):
	timer -= delta
	if timer <= 0:
		score += 1
		update_score()
		timer = 1.0

func update_score():
	text = "Score: " + str(score)
	print(score)
func getScore():
	return score
