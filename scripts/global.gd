extends Node
var room = 0
var ispushing = false
var player: CharacterBody2D
var astar_grid: AStarGrid2D

func go_to_player(enemy_position: Vector2) -> Array[Vector2i]:
	if not player or not astar_grid:
		return []
	var start = astar_grid.local_to_map(enemy_position)
	var end = astar_grid.local_to_map(player.global_position)
	return astar_grid.get_id_path(start, end)
