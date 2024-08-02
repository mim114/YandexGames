extends Node2D

#------DATA------------------------------------------

const LASER_SCENE : PackedScene = preload("res://scenes/projectiles/laser.tscn")
const GRENADE : PackedScene     = preload("res://scenes/projectiles/grenade.tscn")

#------FUNCTIONS CALLED AUTOMATICALLY---------------

func _ready() -> void:
	$FoneMusic.play()


#------WORK FUNCTIONS---------------------------------

#------SIGNALS----------------------------------------

func _on_gate_1_player_entered_gate(_body) -> void:
	var tween = create_tween()
	tween.tween_property($Player, "speed", 0, 0.3)


func _on_gate_2_player_entered_gate(_body) -> void:
	var tween = create_tween()
	tween.tween_property($Player, "speed", 0, 0.3)


func _on_player_laser_shot(pos, direction) -> void:
	var laser = LASER_SCENE.instantiate() as Area2D
	laser.position = pos
	laser.rotation_degrees = rad_to_deg(direction.angle()) + 90
	laser.direction = direction
	$Projectlies.add_child(laser)


func _on_player_throw_grenade(pos, direction) -> void:
	var grenade = GRENADE.instantiate() as RigidBody2D
	grenade.position = pos
	grenade.linear_velocity = direction * grenade.SPEED
	$Projectlies.add_child(grenade)


func _on_house_1_player_entered(body) -> void:
	if body == $Player:
		var tween = get_tree().create_tween()
		tween.tween_property($Player/Camera2D, "zoom", Vector2(1, 1), 1)


func _on_house_1_player_exited(body) -> void:
	if body == $Player:
		var tween = get_tree().create_tween()
		tween.tween_property($Player/Camera2D, "zoom", Vector2(0.6, 0.6), 2)


func _on_house_player_entered(body) -> void:
	if body == $Player:
		var tween = get_tree().create_tween()
		tween.tween_property($Player/Camera2D, "zoom", Vector2(1, 1), 1)


func _on_house_player_exited(body) -> void:
	if body == $Player:
		var tween = get_tree().create_tween()
		tween.tween_property($Player/Camera2D, "zoom", Vector2(0.6, 0.6), 2)
