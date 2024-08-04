extends StaticBody2D


#------DATA---------------------------------------------------------------------
signal player_entered_gate(body)


#------SIGNALS------------------------------------------------------------------
func _on_area_2d_body_entered(body) -> void:
	player_entered_gate.emit(body)
