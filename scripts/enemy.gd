extends CharacterBody2D
@export var health = 3
var player = get_tree().get_first_node_in_group("player")

func _physics_process(delta: float) -> void:
	var path = global.go_to_player(global_position)
	if path.size() > 1:
		var next_tile_coords = path[1]
	move_and_slide()
 #not near finished, wiill do later --Aiden




func _on_sight_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		pass

func get_hit():
	pass
	
