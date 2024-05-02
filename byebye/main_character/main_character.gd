extends CharacterBody2D


var max_speed = 300.0
const ACCELERATION = 800.0
const DECELERATION = 700.0

var current_speed = 0.0
@onready var mainsong = $"mainsong"
@onready var deathsong = $"AudioStreamPlayer2D"
@onready var animation = $"AnimationPlayer"

func _ready():
	mainsong.playing = true
	
func _process(delta):
	var input_direction = 0
	var right = Input.is_action_pressed("ui_right")
	var left = Input.is_action_pressed("ui_left")

	
	if right:
		$Sprite2D.flip_h = false
		input_direction += 1
		animation.play("run")
	if left:
		$Sprite2D.flip_h = true
		input_direction -= 1
		animation.play("run")

	
	# Set velocity based on input direction
	if input_direction != 0:
		current_speed = input_direction * max_speed
	else:
		# Decelerate when no input
		current_speed = move_toward(current_speed, 0, DECELERATION * delta)

	# Clamp speed to maximum
	current_speed = clamp(current_speed, -max_speed, max_speed)

	# Apply horizontal velocity
	velocity.x = current_speed

	if position.x < 28:
		position.x = 28
	if position.x > 1123.8:
		position.x = 1123.8
	# Check vertical position


	# Perform movement
	move_and_slide()

func _on_area_2d_area_entered(area):
	if area.is_in_group("Asteroid"):
		get_tree().paused=true
		await get_tree().create_timer(1).timeout
		get_tree().paused=false
		get_tree().change_scene_to_file("res://death_screen.tscn")
	if area.is_in_group("power_speed"):
		max_speed = max_speed + 100
		
		




