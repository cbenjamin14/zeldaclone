extends Node
var room = 0
var ispushing = false
var player: CharacterBody2D
var astar_grid: AStarGrid2D
var tilemap: TileMapLayer

func go_to_player(enemy_position: Vector2) -> Array[Vector2i]:
	if not player or not astar_grid or not tilemap:
		print("something went wrong") #if something ends up breaking im going to crash out, this was not fun --Aiden
		return []
	var start = tilemap.local_to_map(tilemap.to_local(enemy_position))
	var end = tilemap.local_to_map(tilemap.to_local(player.global_position))
	return astar_grid.get_id_path(start, end)
