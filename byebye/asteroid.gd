extends CharacterBody2D

func _ready():
	pass  # Implementujte vlastní logiku pro postavu při startu scény

func _process(delta):
	if position.y >= 625:  # Například zpráva, pokud postava propadne dolů
		queue_free()  # Zničit tuto postavu nebo provést jiné akce
