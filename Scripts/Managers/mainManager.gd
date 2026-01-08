extends Node2D

var grid: GameGrid
var player: Player
var last_saved_player_grid_pos: Vector2i
var input_man : InputMan

var actions_delay: float = Constants.MINIMUM_DELAY_BETWEEN_ACTIONS


func _ready() -> void:
	grid = %Grid;
	player = %Player
	input_man = InputMan.new()
	last_saved_player_grid_pos = player.grid_postion
	## center the character
	var grid_pos := grid.get_grid_pos_clamp(player.grid_postion.x, player.grid_postion.y)
	player.position = grid_pos + (player.get_size() * 0.5) ;
	pass # Replace with function body.


func _process(_delta: float) -> void:
	if last_saved_player_grid_pos == player.grid_postion:
		return
	last_saved_player_grid_pos = player.grid_postion
	var grid_pos := grid.get_grid_pos_clamp(player.grid_postion.x, player.grid_postion.y)
	player.position = grid_pos + (player.get_size() * 0.5) ;

	pass


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("menu"):
		print_rich("[color=00AA11FF] DOES NOTHING FOR NOW [/color]");

	if event.is_action_pressed("move_up"):
		player.grid_postion.y = clampi(player.grid_postion.y - 1, 0, grid.get_grid_colum());

	if event.is_action_pressed("move_down"):
		player.grid_postion.y = clampi(player.grid_postion.y + 1, 0, grid.get_grid_colum());

	if event.is_action_pressed("move_right"):
		player.grid_postion.x = clampi(player.grid_postion.x + 1, 0, grid.get_grid_row());

	if event.is_action_pressed("move_left"):
		player.grid_postion.x = clampi(player.grid_postion.x - 1, 0, grid.get_grid_row());

	pass
