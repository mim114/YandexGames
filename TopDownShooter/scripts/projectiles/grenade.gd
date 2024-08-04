extends RigidBody2D


#------DATA---------------------------------------------------------------------
const SPEED : int = 750


#------WORK FUNCTIONS-----------------------------------------------------------
func explode() -> void:
	$Sprite2D.visible = false
	$LightOccluder2D2.visible = false
	$PointLight2D2.visible = false
	$AnimationPlayer.play("explosion")
	$Timer.start()


#------SIGNALS------------------------------------------------------------------
func _on_timer_timeout() -> void:
	$".".queue_free()
