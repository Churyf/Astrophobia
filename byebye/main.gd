extends Node

# Třída pro asteroid
class_name Asteroid
@onready var asteroid_field = $"Node"
# Metoda pro vytvoření nového asteroidu
var currentasteroids = 0
var maxasteroids = 7

func create_asteroid():
	var asteroid = preload("res://asteroid.tscn").instantiate()
	# Náhodná pozice X v horní části obrazovky
	var random_x = randi() % int(get_viewport().size.x)  
	asteroid.position.x = random_x
	asteroid.position.y = randf_range(-50, -300) # Spawnovat mimo obrazovku, aby se neobjevil najednou
	asteroid.rotation_degrees = randf_range(45, 135)
	#Druhý asteroid

	
	
	asteroid_field.add_child(asteroid)
	
func create_power_speed():
	var power_speed = preload("res://power_speed.tscn").instantiate()
	var random_x = randi() % int(get_viewport().size.x)  
	power_speed.position.x = random_x
	power_speed.position.y = 600
	
func _ready():
	# Spustí metodu create_asteroid() každých 2 sekund
	create_asteroid()
	create_power_speed()
	set_process(true)


# Pohyb asteroidu dolů
func _process(delta):
	for child in asteroid_field.get_children():
		child.position.y += 200 * delta # Rychlost pohybu asteroidu dolů

	if currentasteroids < maxasteroids:
		var chanceToSpawn = randi_range(0,1000)
		var higherChance = maxasteroids - currentasteroids # když MAX = 5, current = 0, hodnota = 5
		if chanceToSpawn*higherChance > 950*higherChance:
			create_asteroid()
			currentasteroids +=1
		
	#print("lenth: ", len(asteroid_field.get_children()))
	currentasteroids = len(asteroid_field.get_children())


