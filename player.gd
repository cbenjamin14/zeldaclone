extends CharacterBody2D


const SPEED = 300.0
const ACCEL = 20.0
var input : Vector2

func get_input():
	input.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left") 
	input.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up") 
	if Input.is_action_pressed("interact"):
		print("done")
	return input.normalized()
	
func _physics_process(delta):
	var action = get_input()
	velocity = lerp(velocity, action * SPEED, delta * ACCEL)
	move_and_slide()
