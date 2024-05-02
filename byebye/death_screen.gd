extends Node

var mainScore = preload("res://main.tscn")

@onready var deathsong = $AudioStreamPlayer2D
@onready var bye_bye = $"../Sprite2D"

func _ready():
	deathsong.play()
	var instance = mainScore.instantiate()
	var scoreValue = instance.get_node("./Score").getScore()
	print(scoreValue)
	await get_tree().create_timer(5).timeout
	bye_bye.visible =true
	
func _on_button_pressed():
	get_tree().change_scene_to_file("res://main.tscn")


func _on_button_2_pressed():
	get_tree().change_scene_to_file("res://menu.tscn")
