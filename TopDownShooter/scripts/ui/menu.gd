extends Control


#------DATA---------------------------------------------------------------------
@onready var audio_player_button = $AudioPlayerButton
@onready var audio_player_music  = $AudioPlayerMusic


#------FUNCTIONS CALLED AUTOMATICALLY-------------------------------------------
func _ready() -> void:
	audio_player_music.play()


#------SIGNALS------------------------------------------------------------------
func _on_start_pressed() -> void:
	audio_player_button.play()
	$TransitionLayer.change_scene("res://scenes/levels/outside.tscn")


func _on_rules_pressed() -> void:
	audio_player_button.play()
	$TransitionLayer.change_scene("res://scenes/ui/rules.tscn")


func _on_quit_pressed() -> void:
	$TimerQuit.start()
	audio_player_button.play()


func _on_timer_quit_timeout() -> void:
	get_tree().quit()
