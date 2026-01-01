extends Node

@export var row: int;
@export var column: int;

var grid_attribute: Array[Enums.GridAttribute]
var grid_position: Array[Vector2i]


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	assert(row > 0, "needs at minimum 1")
	assert(column > 0, "needs at minimum 1")
	generate_grid()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func generate_grid() -> void:
	for y in column:
		for x in row:
			grid_position.append(Vector2i(x, y))
			grid_attribute.append(Enums.GridAttribute.NONE)

	print(grid_position)
