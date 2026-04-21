extends CharacterBody2D
@export var base_speed = 3000
@export var sprint_mult = 1.5 #made it 3 in the player for convenience, change later
@export var hp = 5
signal takedamage
var move
var input : Vector2
var last_input = null
var currently_attacking = false
var sprint = false


#small bug where if you go on the top of the moveable box it drags you down with it --Aiden
#can we get collisions like in our other games? -- Eli 
#need to fix animation looping -- carson
#need to add sword + other things
func _ready() -> void:
	takedamage.emit()
	global.player = self #makes it so global can find player

func get_input():
	if currently_attacking == true:
		return Vector2.ZERO
	move = Vector2.ZERO
	if Input.is_action_pressed("sprint"):
		sprint = true
		$Sprite2D/AnimationPlayer.speed_scale = sprint_mult
	else:
		sprint = false
		$Sprite2D/AnimationPlayer.speed_scale = 1
#this section of code is the movment, the movement is just x
#and y without calculating for pressing both, this means
#it will just go to your first input when you press 2 things             
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
	#six seven
func _physics_process(delta):
	var action = get_input() 
	if sprint == false: 
		velocity = action * base_speed * delta
	else: 
		velocity = action * (base_speed * sprint_mult) * delta
	 #velocity is what move_and_slide takes so if you want to edit the speed change what it equals
	for i in get_slide_collision_count():
		var collision = get_slide_collision(i)
		var collider = collision.get_collider()
		if collider == null:
			continue
		#if collision.get_collider().is_in_group("danger"):
			#hurt()
		if collision.get_collider().is_in_group("pushable"):
			if Input.is_action_pressed("up") and not Input.is_action_pressed("right") and not Input.is_action_pressed("left") and not Input.is_action_pressed("down"):
				collider.apply_central_impulse(-collision.get_normal())
	move_and_slide()

	
func attack():
	if !$Attack_cd.is_stopped():
		return
	currently_attacking = true
	$Sprite2D/AnimationPlayer.speed_scale = 1 #this is so the sword doesnt swing faster
	if last_input == "up":
		$Sprite2D/AnimationPlayer.play("attack_up")
		print("attacked up")
		$Sword_up.show()
		$Sword_up/AnimationPlayer.play("attack")
		await $Sprite2D/AnimationPlayer.animation_finished
		$Sword_up.hide()
		$Attack_cd.start()
		currently_attacking = false
		
	elif last_input == "down":
		$Sprite2D/AnimationPlayer.play("attack_down")
		print("attacked down")
		$Sword_down.show()
		$Sword_down/AnimationPlayer.play("attack")
		await $Sprite2D/AnimationPlayer.animation_finished
		$Sword_down.hide()
		$Attack_cd.start()
		currently_attacking = false

	elif last_input == "left":
		$Sprite2D/AnimationPlayer.play("attack_left")
		print("attacked left")
		$Sword_left.show()
		$Sword_left/AnimationPlayer.play("attack")
		await $Sprite2D/AnimationPlayer.animation_finished
		$Sword_left.hide()
		$Attack_cd.start()
		currently_attacking = false
		
	elif last_input == "right":
		$Sprite2D/AnimationPlayer.play("attack_right")
		print("attacked right")
		$Sword_right.show()
		$Sword_right/AnimationPlayer.play("attack")
		await $Sprite2D/AnimationPlayer.animation_finished
		$Sword_right.hide()
		$Attack_cd.start()
		currently_attacking = false
		
	else: #means they probably didt move yet, else thats not good
		$Sprite2D/AnimationPlayer.play("attack_down")
		print("default attack")
		$Sword_down.show()
		$Sword_down/AnimationPlayer.play("attack")
		await $Sprite2D/AnimationPlayer.animation_finished
		$Sword_down.hide()
		$Attack_cd.start()
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
