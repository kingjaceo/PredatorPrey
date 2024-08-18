extends CanvasLayer

@onready var lifetime = %Lifetime
var entity: Entity

func _ready():
	entity = get_parent().get_parent()
	lifetime.max_value = entity.max_lifetime

func _process(_delta):
	lifetime.value = entity.lifetime
