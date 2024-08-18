extends LevelParent


#------SIGNALS------------------------------------------------------------------
func _on_gate_1_player_entered_gate(_body) -> void:
	var tween = create_tween()
	tween.tween_property($Player, "speed", 0, 0.3)
	TransitionLayer.change_scene("res://scenes/levels/inside.tscn")


func _on_gate_2_player_entered_gate(_body) -> void:
	var tween = create_tween()
	tween.tween_property($Player, "speed", 0, 0.3)
	TransitionLayer.change_scene("res://scenes/levels/inside_1.tscn")
