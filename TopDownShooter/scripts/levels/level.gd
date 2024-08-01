extends Node2D

#------DATA------------------------------------------

const LASER_SCENE : PackedScene = preload("res://scenes/projectiles/laser.tscn")
const GRENADE : PackedScene     = preload("res://scenes/projectiles/grenade.tscn")

#------FUNCTIONS CALLED AUTOMATICALLY---------------

func _ready() -> void:
	$FoneMusic.play()


#------WORK FUNCTIONS---------------------------------

#------SIGNALS----------------------------------------

func _on_gate_1_player_entered_gate(body) -> void:
	print(body)


func _on_gate_2_player_entered_gate(body) -> void:
	print("hi")

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





