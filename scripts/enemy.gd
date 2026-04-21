extends CharacterBody2D #we need 2 enemies so ill probbly just make the other one inherit or copy and paste --Aiden
@export var health = 3
@export var speed = 25
var player = global.player
var sees_player = false
var moving = false
var target_position = Vector2.ZERO
var attacking = false


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


func get_hit():
	pass
	


func _on_attack_range_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		attacking = true
		print("attacked")
