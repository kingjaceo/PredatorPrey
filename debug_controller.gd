extends Camera2D

@export var dash_speed: float = 60
@export var speed: float = 30
@export var max_zoom: Vector2 = Vector2(4, 4)
@export var min_zoom: Vector2 = Vector2(0.1, 0.1)
var zoom_step = Vector2(0.05, 0.05)

func _process(_delta):
	_check_change_position()


func _check_change_position():
	var direction = Vector2.ZERO
	if Input.is_action_pressed("up"):
		direction.y -= 1
	if Input.is_action_pressed("down"):
		direction.y += 1
	if Input.is_action_pressed("left"):
		direction.x -= 1
	if Input.is_action_pressed("right"):
		direction.x += 1
	direction = direction.normalized()
	
	var position_change = Vector2.ZERO

	if Input.is_action_pressed("dash"):
		position_change = direction * dash_speed
	else:
		position_change = direction * speed
	position += position_change


func _input(event):
	if event is InputEventMouseButton:
		if event.is_pressed() and not event.is_echo():
			var mouse_position = event.position
			if event.button_index == MOUSE_BUTTON_WHEEL_UP:
				zoom = clamp(zoom + zoom_step, min_zoom, max_zoom)
			else : if event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
				zoom = clamp(zoom - zoom_step, min_zoom, max_zoom)

