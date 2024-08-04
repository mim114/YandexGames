extends Area2D


#------DATA---------------------------------------------------------------------
signal player_entered(body)
signal player_exited(body)


#------SIGNALS------------------------------------------------------------------
func _on_body_entered(body) -> void:
	player_entered.emit(body)


func _on_body_exited(body) -> void:
	player_exited.emit(body)
