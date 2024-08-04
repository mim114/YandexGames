extends LevelParent


#------SIGNALS------------------------------------------------------------------
func _on_exit_body_entered(body) -> void:
	if body == $Player:
		var tween = get_tree().create_tween()
		tween.tween_property($Player, "speed", 0, 0.3)
		TransitionLayer.change_scene("res://scenes/levels/outside.tscn")
