extends CharacterBody2D

@export var base_speed = 3000
@export var sprint_mult = 1.5 #made it 3 in the player for convenience, change later
var move
var input : Vector2
var last_input = null
var currently_attacking = false
var sprint = false
#need to make slightly faster -- Eli 
#need to fix animation looping -- carson
#need to add sword + other things
func get_input():
	if currently_attacking == true:
		return Vector2.ZERO
	move = Vector2.ZERO
	if Input.is_action_pressed("sprint"):
		sprint = true
	else:
		sprint = false
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
	else:
		$down_attack/DownHB.disabled = true
		$up_attack/UpHB.disabled = true
		$right_attack/RightHB.disabled = true
		$left_attack/LeftHB.disabled = true
	return move.normalized()
	
func _physics_process(delta):
	var action = get_input()
	if sprint == false:
		velocity = action * base_speed * delta
	else:
		velocity = action * (base_speed * sprint_mult) * delta
	move_and_slide()

	
#need to fix sword anim on attack, the player freezes for some reason -- carson
func attack():
	currently_attacking = true
	if last_input == "up":
		$Sprite2D/AnimationPlayer.play("attack_up")
		print("attacked up")
		$Sword_up.show()
		$Sword_up/AnimationPlayer.play("attack")
		#await $Sword_up/AnimationPlayer.animation_finished
		await $Sprite2D/AnimationPlayer.animation_finished
		$Sword_up.hide()
		currently_attacking = false
		
	elif last_input == "down":
		$Sprite2D/AnimationPlayer.play("attack_down")
		print("attacked down")
		$Sword_down.show()
		$Sword_down/AnimationPlayer.play("attack")
		#await $Sword_down/AnimationPlayer.animation_finished
		await $Sprite2D/AnimationPlayer.animation_finished
		$Sword_down.hide()
		currently_attacking = false

	elif last_input == "left":
		$Sprite2D/AnimationPlayer.play("attack_left")
		print("attacked left")
		$Sword_left.show()
		$Sword_left/AnimationPlayer.play("attack")
		#await $Sword_left/AnimationPlayer.animation_finished
		await $Sprite2D/AnimationPlayer.animation_finished
		$Sword_left.hide()
		currently_attacking = false
		
	elif last_input == "right":
		$Sprite2D/AnimationPlayer.play("attack_right")
		print("attacked right")
		$Sword_right.show()
		$Sword_right/AnimationPlayer.play("attack")
		#await $Sword_right/AnimationPlayer.animation_finished
		await $Sprite2D/AnimationPlayer.animation_finished
		$Sword_right.hide()
		currently_attacking = false
	else: #means they probably didt move yet, else thats not good
		$Sprite2D/AnimationPlayer.play("attack_down")
		print("default attack")
		$Sword_down.show()
		$Sword_down/AnimationPlayer.play("attack")
		#await $Sword_down/AnimationPlayer.animation_finished
		await $Sprite2D/AnimationPlayer.animation_finished
		$Sword_down.hide()
		currently_attacking = false


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
