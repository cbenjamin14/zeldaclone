extends CharacterBody2D


const SPEED = 300.0
const ACCEL = 20.0
var input : Vector2
var last_input = null
func get_input():
	input.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left") 
	input.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up") 
	if Input.is_action_pressed("interact"):
		print("done")
	if Input.is_action_pressed("ui_up"):
		last_input = "up"
	elif Input.is_action_pressed("ui_down"):
		last_input = "down"
	elif Input.is_action_pressed("ui_left"):
		last_input = "left"
	elif Input.is_action_pressed("ui_right"):
		last_input = "right"
	print(last_input)
	if Input.is_action_pressed("attack"):
		if last_input == "up":
			$up_attack/UpHB.disabled = false
		elif last_input == "down":
			$down_attack/DownHB.disabled = false
		elif last_input == "left":
			$left_attack/LeftHB.disabled = false
		elif last_input == "right":
			$right_attack/RightHB.disabled = false
		else:
			pass
		#rest of code here
		"""
			make it so when an enemy is in one of these hit
			boxes it hurts them 
			$left_attack/LeftHB.disabled = true
			$down_attack/DownHB.disabled = true
			$up_attack/UpHB.disabled = true
			$right_attack/RightHB.disabled = true
		"""
	return input.normalized()
	
func _physics_process(delta):
	var action = get_input()
	velocity = lerp(velocity, action * SPEED, delta * ACCEL)
	move_and_slide()
