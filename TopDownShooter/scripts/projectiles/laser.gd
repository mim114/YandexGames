extends Area2D

#------DATA-----------------------------------------

const SPEED : int = 700
var direction: Vector2 = Vector2.UP

#------FUNCTIONS CALLED AUTOMATICALLY---------------

func _ready() -> void:
	$SelfDistructionTimer.start()


func _process(delta) -> void:
	position += direction * SPEED * delta

#------SIGNALS--------------------------------------

func _on_body_entered(body):
	if "hit" in body:
		body.hit()


func _on_self_distruction_timer_timeout():
	queue_free()
