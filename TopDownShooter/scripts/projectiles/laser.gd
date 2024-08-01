extends Area2D

#------DATA-----------------------------------------

const SPEED : int = 700
var direction: Vector2 = Vector2.UP

#------FUNCTIONS CALLED AUTOMATICALLY---------------

func _process(delta) -> void:
	position += direction * SPEED * delta
