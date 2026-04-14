extends CharacterBody2D

@export var base_speed_mult = 3000
var move
var input : Vector2
var last_input = null
#need to fix animation looping -- carson
#need to add sword + other things
func get_input():
	move = Vector2.ZERO
	if Input.is_action_pressed("up"):
		last_input = "up"
		move = Vector2(0, -1)
		$Sprite2D/AnimationPlayer.play("walk_up")
	elif Input.is_action_pressed("down"):
		last_input = "down"
		move = Vector2(0, 1)
		$Sprite2D/AnimationPlayer.play("walk_down")
	elif Input.is_action_pressed("left"):
		last_input = "left"
		$Sprite2D.flip_h = true
		move = Vector2(-1, 0)
		$Sprite2D/AnimationPlayer.play("walk_right")
	elif Input.is_action_pressed("right"):
		last_input = "right"
		$Sprite2D.flip_h = false
		move = Vector2(1, 0)
		$Sprite2D/AnimationPlayer.play("walk_right")
	else:
		$Sprite2D/AnimationPlayer.play("idle")
	if Input.is_action_just_pressed("interact"):
		print("done")

	if Input.is_action_just_pressed("attack"):
		attack()
	return move.normalized()
	
func _physics_process(delta):
	var action = get_input()
	velocity = action * base_speed_mult * delta
	move_and_slide()
	
func attack():
	print("attacked")
	if last_input == "up":
		$up_attack/UpHB.disabled = false
		$Sprite2D/AnimationPlayer.play("attack_up")
	elif last_input == "down":
		$down_attack/DownHB.disabled = false
		$Sprite2D/AnimationPlayer.play("attack_down")
	elif last_input == "left":
		$left_attack/LeftHB.disabled = false
		$Sprite2D/AnimationPlayer.play("attack_left")
	elif last_input == "right":
		$right_attack/RightHB.disabled = false
		$Sprite2D/AnimationPlayer.play("attack_right")
	else:
		pass
	"""
		make it so when an enemy is in one of these hit
		boxes it hurts them 
		
		$left_attack/LeftHB.disabled = true
		$down_attack/DownHB.disabled = true
		$up_attack/UpHB.disabled = true
		$right_attack/RightHB.disabled = true
	"""







func _attack_up(body: Node2D) -> void:
	if body.is_in_group("enemies"):
		pass
		

func _attack_down(body: Node2D) -> void:
	if body.is_in_group("enemies"):
		pass


func _attack_left(body: Node2D) -> void:
	if body.is_in_group("enemies"):
		pass

func _attack_right(body: Node2D) -> void:
	if body.is_in_group("enemies"):
		pass
