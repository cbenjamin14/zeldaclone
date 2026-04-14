extends CharacterBody2D



func _physics_process(delta: float) -> void:

	move_and_slide()





func _on_sight_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		pass
