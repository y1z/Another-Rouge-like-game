class_name Player extends Node2D

var sprite: Sprite2D;
var grid_postion: Vector2i

func _ready() -> void:
	sprite = %sprite
	grid_postion.x = 0;
	grid_postion.y = 0;
	pass # Replace with function body.


func _process(delta: float) -> void:
	pass

##func _draw() -> void:
	##draw_texture_rect(sprite.texture,sprite.get_rect(),true)


func get_size() -> Vector2:
	return sprite.get_rect().size
