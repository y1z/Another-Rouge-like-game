class_name GameGrid extends Node2D

const DEFAULT_NODE_SIZE: Vector2i = Vector2i(64, 64)

@export var row: int;
@export var column: int;
@export var node_size: Vector2i = Vector2i.ZERO;

var grid_attribute: Array[Enums.GridAttribute]
var grid_position: Array[Vector2i]

var max_x: int;
var max_y: int;


func _init() -> void:
	max_x = 0;
	max_y = 0;
	pass


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	assert(row > 0, "needs at minimum 1")
	assert(column > 0, "needs at minimum 1")

	if node_size.x < 1:
		node_size.x = DEFAULT_NODE_SIZE.x;

	if node_size.y < 1:
		node_size.y = DEFAULT_NODE_SIZE.y;

	generate_grid()
	pass


func generate_grid() -> void:
	for y in column:
		if max_y < y:
			max_y = y;
		for x in row:
			if max_x < x:
				max_x = x;
			grid_position.append(Vector2i(x, y))
			grid_attribute.append(Enums.GridAttribute.NONE)

	print(grid_position)


func get_grid_pos(x: int, y: int) -> Vector2:
	assert(x < max_x && x > -1)
	assert(y < max_y && y > -1)
	var index: int = (y * max_x) + x;
	var grid_pos: Vector2i = grid_position[index]
	var result: Vector2
	result.x = self.position.x + (grid_pos.x * node_size.x) as float;
	result.y = self.position.y + (grid_pos.y * node_size.y) as float;

	return result
