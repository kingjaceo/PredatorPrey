extends TileMap

@export var height: int = 16
@export var width: int = 32

func _ready():
	Global.level_height = tile_set.tile_size.y * height
	Global.level_width = tile_set.tile_size.x * width
	for h in range(height):
		#set_cell(0, Vector2i(-1, h), 1, Vector2i(0, 0), 3)
		#set_cell(0, Vector2i(width, h), 1, Vector2i(0, 0), 4)
		for w in range(width):
			set_cell(0, Vector2i(w, h), 0, Vector2i(0, 0))
	
	#for w in range(width):
		#set_cell(0, Vector2i(w, -1), 1, Vector2i(0, 0), 1)
		#set_cell(0, Vector2i(w, height), 1, Vector2i(0, 0), 2)
