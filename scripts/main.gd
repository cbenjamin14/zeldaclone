extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	global.room = 0 # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass






func _on_starttoleft_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	
	if (global.room!=1):
		$AnimationPlayer.play("0to1") # Replace with function body.
	global.room=1

func _on_leftotstart_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if (global.room != 0) :
		$AnimationPlayer.play("1to0") #
	global.room=0
