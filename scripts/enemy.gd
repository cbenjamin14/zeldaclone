extends CharacterBody2D
@export var health = 3
@export var speed = 10
var player = global.player
var sees_player = false

#significant collision bugs --Aiden

func _physics_process(delta: float) -> void: #need to make it tile based still --Aiden
	if sees_player == false:
		pass
	else:
		var path = global.go_to_player(global_position) 
		if path.size() > 1:
			var next_tile_coords = path[1]
			var target_position = global.tilemap.map_to_local(next_tile_coords)
			var direction = (target_position - global_position).normalized()
			velocity = direction * speed
		else:
			velocity = Vector2.ZERO
		move_and_slide()




func _on_sight_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		sees_player = true


func get_hit():
	pass
	
