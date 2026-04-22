extends Node2D
var player_close = false



func _process(delta: float) -> void:
	if Input.is_action_just_pressed("interact") and player_close == true:
		$"sign text".visible = true
		
func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		$"interact prompt".visible = true
		player_close = true




func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		$"interact prompt".visible = false
		player_close = false
