extends CharacterBody2D

#------DATA-----------------------------------------

const SPEED : int = 400

#------FUNCTIONS CALLED AUTOMATICALLY---------------

func _process(_delta) -> void:
	var direction = Vector2.RIGHT
	velocity = direction * SPEED
	move_and_slide()
