extends CharacterBody2D

#------DATA-----------------------------------------

signal laser_shot(pos, direction)
signal throw_grenade(pos, direction)

const SPEED : int = 500

var can_laser : bool   = true
var can_grenade : bool = true

#------FUNCTIONS CALLED AUTOMATICALLY---------------

func _process(_delta) -> void:
	var direction : Vector2 = Input.get_vector("left", "right", "up", "down")
	velocity = direction * SPEED
	var player_direction = (get_global_mouse_position() - position).normalized()

	look_at(get_global_mouse_position())
	attack(player_direction)
	move_and_slide()


#------WORK FUNCTIONS-------------------------------

func attack(player_direction) -> void:
	if Input.is_action_pressed("shoot") and can_laser:
		var laser_markers = $LaserStartPosition.get_children()
		var selected_laser = laser_markers[randi() % laser_markers.size()]
		can_laser = false
		%TimerShoot.start()
		laser_shot.emit(selected_laser.global_position, player_direction)

	if Input.is_action_pressed("grenade") and can_grenade:
		var grenade_markers = $GrenadeStartPosition.get_child(0)
		can_grenade = false
		%TimerGrenade.start()
		throw_grenade.emit(grenade_markers.global_position, player_direction)

#------SIGNALS--------------------------------------

func _on_timer_shoot_timeout() -> void:
	can_laser = true


func _on_timer_grenade_timeout() -> void:
	can_grenade = true























