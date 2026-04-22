extends CharacterBody2D #we need 2 enemies so ill probbly just make the other one inherit or copy and paste --Aiden
@export var health = 3
@export var speed = 10
var player = global.player
var sees_player = false
var moving = false
var target_position = Vector2.ZERO
var attacking = false
var damage = 0
func _physics_process(delta: float) -> void: 
	if sees_player == false or attacking == true:
		return
	if not moving: #this is so it only updates every block
		var path = global.go_to_player(global_position) 
		if path.size() > 1:
			target_position = global.tilemap.map_to_local(path[1]) 
			moving = true
	if moving:
		move_to(delta) 
func move_to(delta):
	var dir = global_position.direction_to(target_position) #make this into the animations when we get them
	if dir.x > 0:
		pass
	elif dir.x < 0:
		pass
	elif dir.y > 0:
		pass
	elif dir.y < 0:
		pass
	else:
		pass
	global_position = global_position.move_toward(target_position, speed * delta) #wow it moves correctly, its a miracle
	if global_position.distance_to(target_position) < 0.1: #snaps to final position
		global_position = target_position 
		moving = false


func _on_sight_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		sees_player = true


func take_damage(amount):
	health -= amount
	if health <= 0:
		queue_free()
	


func _on_attack_range_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		if body.has_method("take_damage"):
			body.take_damage(1)
		attacking = true
		print("attacked")
		$HurtSound.play()
		$Hit_stun.start()
	if body.is_in_group("player_attack"):
		$HurtSound.start()
		queue_free()


func _on_hit_stun_timeout() -> void:
	attacking = false


func _on_attack_body_entered(body: Node2D) -> void:
	if global.room == 16:
		damage+=1
	if damage > 3:
		queue_free()
