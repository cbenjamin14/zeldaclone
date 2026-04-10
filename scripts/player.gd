extends CharacterBody2D

@export var base_speed_mult = 3000
var move
var input : Vector2
var last_input = null
func get_input():
	move = Vector2.ZERO
	if Input.is_action_pressed("up"):
		move = Vector2(0, -1)
	elif Input.is_action_pressed("down"):
		move = Vector2(0, 1)
	elif Input.is_action_pressed("left"):
		move = Vector2(-1, 0)
	elif Input.is_action_pressed("right"):
		move = Vector2(1, 0)
	if Input.is_action_pressed("interact"):
		print("done")
	if Input.is_action_pressed("up"):
		last_input = "up"
	elif Input.is_action_pressed("down"):
		last_input = "down"
	elif Input.is_action_pressed("left"):
		last_input = "left"
		$Sprite2D.flip_h = true
	elif Input.is_action_pressed("right"):
		last_input = "right"
		$Sprite2D.flip_h = false
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
		#rest of code here, ill do it when theres an enemy
		"""
			make it so when an enemy is in one of these hit
			boxes it hurts them 
			
			$left_attack/LeftHB.disabled = true
			$down_attack/DownHB.disabled = true
			$up_attack/UpHB.disabled = true
			$right_attack/RightHB.disabled = true
		"""
	return move.normalized()
	
func _physics_process(delta):
	var action = get_input()
	velocity = action * base_speed_mult * delta
	move_and_slide()
