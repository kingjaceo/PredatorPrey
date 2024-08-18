class_name PopulationGraph
extends CanvasItem

@export var size: Vector2i
var populations_by_type: Dictionary = {"cricket": 0, "frog": 0}
var data: Dictionary = {"cricket": [], "frog": []}
var current_time: float = 0
var origin: Vector2
var colors_by_type: Dictionary = {"cricket": Color.GREEN, "frog": Color.BLUE}

func _ready():
	get_tree().node_added.connect(_on_node_added)
	get_tree().node_removed.connect(_on_node_removed)
	origin = Vector2(0, size.y)


func _process(delta):
	current_time += delta
	queue_redraw()


func _on_node_added(node):
	var groups = node.get_groups()
	for group in groups:
		if group in populations_by_type:
			populations_by_type[group] += 1
			data[group].append(Vector2(current_time, -populations_by_type[group]))


func _on_node_removed(node):
	var groups = node.get_groups()
	for group in groups:
		if group in populations_by_type:
			populations_by_type[group] -= 1
			data[group].append(Vector2(current_time, -populations_by_type[group]))


func _draw():
	draw_rect(Rect2(Vector2.ZERO, size), Color.WHITE)
	var old_pair = origin
	
	for type in data:
		if len(data[type]) > 0:
			old_pair = data[type][0]
		for pair in data[type]:
			draw_line(origin + old_pair, origin + pair, colors_by_type[type], 2.0)
			old_pair = pair
