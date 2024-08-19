extends TileMap

@export var height: int = 16
@export var width: int = 32

func _ready():
	Global.level_size = Vector2(tile_set.tile_size.x * width, tile_set.tile_size.y * height)
	for h in range(height):
		for w in range(width):
			set_cell(0, Vector2i(w, h), 0, Vector2i(0, 0))
