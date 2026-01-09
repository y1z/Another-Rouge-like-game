class_name DataClases extends Node
## Clases that all they do is contain data

class GameEventData:
	var input_result: Enums.InputResult
	var player_position: Vector2
	var grid_position: Vector2i


	static func create(input_result_: Enums.InputResult, player_pos_: Vector2, grid_pos_: Vector2i) -> GameEventData:
		var result: GameEventData = GameEventData.new()
		result.input_result = input_result_
		result.player_position = player_pos_
		result.grid_position = grid_pos_
		return result
	pass
