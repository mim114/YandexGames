extends RigidBody2D

var selected := false
var mouse_offset := Vector2(0, 0)
@onready var collision_shape := $CollisionShape2D

func _process(_delta) -> void:
	if selected:
		followMouse()


func followMouse() -> void:
	position = get_global_mouse_position() + mouse_offset
	


func _on_area_2d_input_event(_viewport, event, _shape_idx) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			mouse_offset = position - get_global_mouse_position()
			selected = true
			collision_shape.disabled = true
		else:
			selected = false
			collision_shape.disabled = false
