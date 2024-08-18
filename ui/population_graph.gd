@tool
class_name PopulationGraph
extends CanvasItem

@export var size: Vector2i
@export var pad: int = 8
var populations_by_type: Dictionary = {"cricket": 0, "frog": 0}
var data: Dictionary = {"cricket": [], "frog": []}
var current_time: float = 0
var origin: Vector2
var max_time: float
var colors_by_type: Dictionary = {"cricket": Color.GREEN, "frog": Color.BLUE}
@export_enum("SQUISH", "TRUNCATE") var mode: int

func _ready():
	get_tree().node_added.connect(_on_node_added)
	get_tree().node_removed.connect(_on_node_removed)
	origin = Vector2(pad, size.y - pad)
	max_time = size.x - 2 * pad
	_regular_updates()


func _process(delta):
	current_time += delta
	if current_time > max_time:
		_update_data()
		max_time = current_time
	queue_redraw()


func _regular_updates():
	while true:
		await get_tree().create_timer(2.0).timeout
		for type in populations_by_type:
			data[type].append(Vector2(current_time, -populations_by_type[type]))


func _update_data():
	match mode:
		0:
			pass
		1:
			_truncate_data()


func _truncate_data():
	pass


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
	draw_rect(Rect2(Vector2.ZERO, size), Color.DIM_GRAY)
	var old_pair = origin
	
	for type in data:
		if len(data[type]) > 0:
			old_pair = data[type][0]
		for pair in data[type]:
			draw_line(origin + old_pair, origin + pair, colors_by_type[type], 2.0)
			old_pair = pair

	draw_line(origin, Vector2(size.x - pad, origin.y), Color.BLACK, 2.0)
	draw_line(origin, Vector2(origin.x, pad), Color.BLACK, 2.0)
	draw_circle(origin, 2.0, Color.BLACK)
