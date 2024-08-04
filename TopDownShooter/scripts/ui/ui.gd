extends CanvasLayer


#------DATA---------------------------------------------------------------------
signal up_light
signal down_light

@onready var bullet_label : Label              = $Count/UI/Bullet/BulletLabel
@onready var grenade_label : Label             = $Count/UI/Grenade/GrenadeLabel
@onready var progress_bar : TextureProgressBar = $Count/UI/Health/ProgressBar
@onready var audio_button : AudioStreamPlayer  = $AudioButton

const LIGHT_DOWN       = preload("res://src/icon/pocket_flashligh_downt.png")
const LIGHT_DOWN_HOVER = preload("res://src/icon/pocket_flashligh_down_hover.png")
const LIGHT_UP         = preload("res://src/icon/pocket_flashligh_up.png")
const LIGHT_UP_HOVER   = preload("res://src/icon/pocket_flashligh_up_hover.png")
const CURSOR_WHITE     = preload("res://src/graphics/ui/main_cursor.png")

var is_light_up : bool


#------FUNCTIONS CALLED AUTOMATICALLY-------------------------------------------
func _ready() -> void:
	Globals.connect("stat_change", update_stat_text)
	update_grenade_text()
	update_laser_text()
	update_health_text()


#------WORK FUNCTIONS-----------------------------------------------------------
func update_stat_text() -> void:
	update_grenade_text()
	update_laser_text()
	update_health_text()


func update_health_text() -> void:
	progress_bar.value = Globals.health


func update_laser_text() -> void:
	bullet_label.text = str(Globals.laser_amount)


func update_grenade_text() -> void:
	grenade_label.text = str(Globals.grenade_amount)


func update_texture(texture_norm, texture_hov, is_light : bool) -> void:
		$Count/PocketFlashlight.texture_normal = texture_norm
		$Count/PocketFlashlight.texture_hover  = texture_hov
		is_light_up                            = is_light


#------SIGNALS------------------------------------------------------------------
func _on_menu_pressed() -> void:
	Input.set_custom_mouse_cursor(CURSOR_WHITE)
	audio_button.play()
	$TransitionLayer.change_scene("res://scenes/ui/menu.tscn")


func _on_pocket_flashlight_pressed() -> void:
	audio_button.play()

	if not is_light_up:
		update_texture(LIGHT_UP, LIGHT_UP_HOVER, true)
		up_light.emit()
	else:
		update_texture(LIGHT_DOWN, LIGHT_DOWN_HOVER, false)
		down_light.emit()


func _on_menu_mouse_entered() -> void:
	Globals.can_laser = false


func _on_menu_mouse_exited() -> void:
	Globals.can_laser = true


func _on_pocket_flashlight_mouse_entered() -> void:
	Globals.can_laser = false


func _on_pocket_flashlight_mouse_exited() -> void:
	Globals.can_laser = true
