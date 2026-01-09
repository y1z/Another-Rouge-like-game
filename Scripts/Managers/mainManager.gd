extends Node2D

@export var repeat_input_delay: float = Constants.MINIMUM_DELAY_BETWEEN_ACTIONS
@export var start_input_delay: float = Constants.MINIMUM_DELAY_BETWEEN_ACTIONS

var grid: GameGrid
var player: Player
var last_saved_player_grid_pos: Vector2i
var input_man: InputMan


func _ready() -> void:
	grid = %Grid;
	player = %Player
	input_man = InputMan.new()
	input_man.set_up_delays(repeat_input_delay, start_input_delay)
	last_saved_player_grid_pos = player.grid_postion
	## center the character
	var grid_pos := grid.get_grid_pos_clamp(player.grid_postion.x, player.grid_postion.y)
	player.position = grid_pos + (player.get_size() * 0.5) ;
	pass # Replace with function body.


func _process(delta: float) -> void:

	var input_result := input_man.handle_input(delta)

	match input_result:
		Enums.InputResult.NONE:
			pass
		Enums.InputResult.UP:
			player.grid_postion.y = clampi(player.grid_postion.y - 1, 0, grid.get_grid_colum());

		Enums.InputResult.DOWN:
			player.grid_postion.y = clampi(player.grid_postion.y + 1, 0, grid.get_grid_colum());

		Enums.InputResult.LEFT:
			player.grid_postion.x = clampi(player.grid_postion.x - 1, 0, grid.get_grid_row());

		Enums.InputResult.RIGHT:
			player.grid_postion.x = clampi(player.grid_postion.x + 1, 0, grid.get_grid_row());

		_:
			printerr("CASE NOT HANDLED = %s" % input_result)

	if last_saved_player_grid_pos == player.grid_postion:
		return
	last_saved_player_grid_pos = player.grid_postion
	var grid_pos := grid.get_grid_pos_clamp(player.grid_postion.x, player.grid_postion.y)
	player.position = grid_pos + (player.get_size() * 0.5) ;

	pass


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("menu"):
		print_rich("[color=00AA11FF] DOES NOTHING FOR NOW [/color]");

	pass
