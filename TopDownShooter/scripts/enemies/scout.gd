extends CharacterBody2D


#------DATA---------------------------------------------------------------------
signal laser(pos, direction)

var player_nearby : bool = false
var can_laser : bool     = true


#------FUNCTIONS CALLED AUTOMATICALLY-------------------------------------------
func _physics_process(_delta) -> void:
	if player_nearby:
		look_at(Globals.player_pos)
		if can_laser:
			var pos : Vector2 = %Marker2D1.global_position
			var direction : Vector2 = (Globals.player_pos - position).normalized()
			laser.emit(pos, direction)
			can_laser = false
			$TimerLaserCooldown.start()


#------SIGNALS------------------------------------------------------------------
func _on_attack_zone_body_entered(_body) -> void:
	player_nearby = true


func _on_attack_zone_body_exited(_body) -> void:
	player_nearby = false


func _on_timer_laser_cooldown_timeout() -> void:
	can_laser = true
