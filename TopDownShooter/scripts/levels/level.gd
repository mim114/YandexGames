class_name LevelParent
extends Node2D


#------DATA---------------------------------------------------------------------
const LASER_SCENE : PackedScene = preload("res://scenes/projectiles/laser.tscn")
const GRENADE : PackedScene     = preload("res://scenes/projectiles/grenade.tscn")
const ITEM_SCENE : PackedScene  = preload("res://scenes/objects/item.tscn")
const CURSOR_RED                = preload("res://src/graphics/ui/cursor_red.png")
const CURSOR_WHITE              = preload("res://src/graphics/ui/crosshair159.png")


#------FUNCTIONS CALLED AUTOMATICALLY-------------------------------------------
func _ready() -> void:
	Input.set_custom_mouse_cursor(CURSOR_WHITE)
	$FoneMusic.play()
	for container in get_tree().get_nodes_in_group("Container"):
		container.connect("open", container_opened)

	for scout in get_tree().get_nodes_in_group("Scouts"):
		scout.connect("laser", scout_laser)


#------WORK FUNCTIONS-----------------------------------------------------------
func scout_laser(pos : Vector2, direction : Vector2) -> void:
	#create_laser(pos, direction)
	print('scout')


func container_opened(pos : Vector2, direction : Vector2) -> void:
	var item = ITEM_SCENE.instantiate()

	item.position = pos
	item.direction = direction
	$Items.call_deferred("add_child", item)


func create_laser(pos : Vector2, direction : Vector2) -> void:
	var laser = LASER_SCENE.instantiate() as Area2D
	laser.position = pos
	laser.rotation_degrees = rad_to_deg(direction.angle()) + 90
	laser.direction = direction
	$Projectlies.add_child(laser)


#------SIGNALS------------------------------------------------------------------
func _on_player_laser_shot(pos : Vector2, direction : Vector2) -> void:
	Input.set_custom_mouse_cursor(CURSOR_RED)
	$TimerRedCursor.start()
	$AudioLaser.play()
	create_laser(pos, direction)
	$UI.update_laser_text()


func _on_player_throw_grenade(pos : Vector2, direction : Vector2) -> void:
	var grenade = GRENADE.instantiate() as RigidBody2D
	grenade.position = pos
	grenade.linear_velocity = direction * grenade.SPEED
	$Projectlies.add_child(grenade)
	$UI.update_grenade_text()


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


func _on_ui_down_light() -> void:
	%PocketLight2.visible = false


func _on_ui_up_light() -> void:
	%PocketLight2.visible = true


func _on_timer_red_cursor_timeout() -> void:
	Input.set_custom_mouse_cursor(CURSOR_WHITE)
