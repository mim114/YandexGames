extends Control


#------DATA---------------------------------------------------------------------
@onready var audio_player_music : AudioStreamPlayer  = $AudioStreamMusic
@onready var audio_stream_button : AudioStreamPlayer = $AudioStreamButton
@onready var first_rule : TextureRect                = $FirstRule
@onready var second_rule : TextureRect               = $SecondRule
@onready var label : Label                           = $Label
var count : int                                      = 1


#------FUNCTIONS CALLED AUTOMATICALLY-------------------------------------------
func _ready() -> void:
	audio_player_music.play()


#------WORK FUNCTIONS-----------------------------------------------------------
func image_state(label_rule : bool, firs_rule : bool, sec_ruele : bool) -> void:
	label.visible       = label_rule
	first_rule.visible  = firs_rule
	second_rule.visible = sec_ruele


#------SIGNALS------------------------------------------------------------------
func _on_back_pressed() -> void:
	audio_stream_button.play()
	if count == 3:
		image_state(false, false, true)
		count -= 1
	elif count == 2:
		image_state(false, true, false)
		count -= 1


func _on_forvard_pressed() -> void:
	audio_stream_button.play()
	if count == 1:
		image_state(false, false, true)
		count += 1
	elif count == 2:
		image_state(true, false, false)
		count += 1


func _on_menu_pressed() -> void:
	audio_stream_button.play()
	$TransitionLayer.change_scene("res://scenes/ui/menu.tscn")
