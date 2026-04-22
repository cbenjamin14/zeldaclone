extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimationPlayer.play("Outro") # Replace with function body.
	await $AnimationPlayer.animation_finished 
	get_tree().change_scene_to_file("res://scenes/titlescreen.tscn")
