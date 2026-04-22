extends Node2D

func _ready() -> void:
	global.tilemap = $Ground
	global.room = 0 
	$Player.position=$Spawnpoint.position
	var astar_grid = AStarGrid2D.new()
	var used_rect = $Ground.get_used_rect().merge($Wall.get_used_rect())
	astar_grid.region = used_rect
	astar_grid.cell_size = $Ground.tile_set.tile_size
	astar_grid.diagonal_mode = AStarGrid2D.DIAGONAL_MODE_NEVER #no diagonal, does as it says
	astar_grid.update()
	for cell in $Wall.get_used_cells():
		astar_grid.set_point_solid(cell, true) #alarms the enemy to not go here 
	global.astar_grid = astar_grid 
	
func _process(delta: float) -> void:
	pass

func playerDied():
	$DieSound.play()
	$Player.hide()
	await $DieSound.finished
	if get_tree():
		get_tree().reload_current_scene()

@warning_ignore_start("unused_parameter")

func _on_0_to_1_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if (global.room!=1):
		$CameraControl.play("0to1") # Replace with function body.
	global.room=1


func _on_1_to_0_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if (global.room != 0) :
		$CameraControl.play("1to0") #
	global.room=0


func _on_0_to_2_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if (global.room != 2) :
		$CameraControl.play("0to2") #
	global.room=2


func _on_2_to_0_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if (global.room != 0) :
		$CameraControl.play("2to0") #
	global.room=0


func _on_0_to_3_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if (global.room != 3) :
		$CameraControl.play("0to3") #
	global.room=3


func _on_3_to_0_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if (global.room != 0) :
		$CameraControl.play("3to0") #
	global.room=0


func _on_4_to_3_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if (global.room != 3) :
		$CameraControl.play("4to3") #
	global.room=3


func _on_3_to_4_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if (global.room != 4) :
		$CameraControl.play("3to4") #
	global.room=4


func _on_7_to_4_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if (global.room != 4) :
		$CameraControl.play("7to4") #
	global.room=4


func _on_5_to_4_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if (global.room != 4) :
		$CameraControl.play("5to4") #
	global.room=4


func _on_6_to_4_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if (global.room != 4) :
		$CameraControl.play("6to4") #
	global.room=4


func _on_8_to_5_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if (global.room != 5) :
		$CameraControl.play("8to5") #
	global.room=5


func _on_4_to_5_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if (global.room != 5) :
		$CameraControl.play("4to5") #
	global.room=5


func _on_14_to_6_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if (global.room != 6) :
		$CameraControl.play("14to6") #
	global.room=6


func _on_4_to_6_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if (global.room != 6) :
		$CameraControl.play("4to6") #
	global.room=6


func _on_4_to_7_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if (global.room != 7) :
		$CameraControl.play("4to7")
	global.room=7


func _on_10_to_7_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if (global.room != 7) :
		$CameraControl.play("10to7")
	global.room=7


func _on_8_to_7_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if (global.room != 7) :
		$CameraControl.play("8to7")
	global.room=7


func _on_14_to_7_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if (global.room != 7) :
		$CameraControl.play("14to7")
	global.room=7


func _on_5_to_8_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if (global.room != 8) :
		$CameraControl.play("5to8")
	global.room=8


func _on_7_to_8_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if (global.room != 8) :
		$CameraControl.play("7to8")
	global.room=8


func _on_9_to_8_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if (global.room != 8) :
		$CameraControl.play("9to8")
	global.room=8


func _on_8_to_9_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if (global.room != 9) :
		$CameraControl.play("8to9")
	global.room=9


func _on_7_to_10_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if (global.room != 10) :
		$CameraControl.play("7to10")
	global.room=10


func _on_11_to_10_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if (global.room != 10) :
		$CameraControl.play("11to10")
	global.room=10


func _on_10_to_11_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if (global.room != 11) :
		$CameraControl.play("10to11")
	global.room=11


func _on_12_to_11_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if (global.room != 11) :
		$CameraControl.play("12to11")
	global.room=11


func _on_11_to_12_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if (global.room != 12) :
		$CameraControl.play("11to12")
	global.room=12


func _on_13_to_12_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if (global.room != 12) :
		$CameraControl.play("13to12")
	global.room=12
	$Player.position=$"13to12point".position


func _on_12_to_13_body_entered(body: Node2D) -> void:
	if (global.room != 13) :
		$CameraControl.play("12to13")
	global.room=13
	$Player.position=$"12to13point".position


func _on_6_to_14_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if (global.room != 14) :
		$CameraControl.play("6to14")
	global.room=14


func _on_7_to_14_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if (global.room != 14) :
		$CameraControl.play("7to14")
	global.room=14


func _on_15_to_14_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if (global.room != 14) :
		$CameraControl.play("15to14")
	global.room=14



func _on_16_to_15_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if (global.room != 15) :
		$CameraControl.play("16to15")
	global.room=15



func _on_14_to_15_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if (global.room != 15) :
		$CameraControl.play("14to15")
	global.room=15


func _on_15_to_16_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if (global.room != 16) :
		$CameraControl.play("15to16")
	global.room=16


func _on_17_to_16_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if (global.room != 16) :
		$CameraControl.play("17to16")
	global.room=16


func _on_16_to_17_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if (global.room != 17) :
		$CameraControl.play("16to17")
	global.room=17


func _on_player_orb_2_get() -> void:
	pass # Replace with function body.
