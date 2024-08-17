extends Node2D


#------DATA---------------------------------------------------------------------
@onready var collision_column_01 := $Columns/Column_01/CollisionPolygon_01
@onready var polygon_column_01   := $Columns/Column_01/Polygon_01
@onready var collision_column_02 := $Columns/Column_02/CollisionPolygon_02
@onready var polygon_column_02   := $Columns/Column_02/Polygon_02
@onready var collision_column_03 := $Columns/Column_03/CollisionPolygon_03
@onready var polygon_column_03   := $Columns/Column_03/Polygon_03
@onready var collision_column_04 := $Columns/Column_04/CollisionPolygon_04
@onready var polygon_column_04   := $Columns/Column_04/Polygon_04
@onready var collision_column_05 := $Columns/Column_05/CollisionPolygon_05
@onready var polygon_column_05   := $Columns/Column_05/Polygon_05
@onready var collision_column_06 := $Columns/Column_06/CollisionPolygon_06
@onready var polygon_column_06   := $Columns/Column_06/Polygon_06
@onready var collision_column_07 := $Columns/Column_07/CollisionPolygon_07
@onready var polygon_column_07   := $Columns/Column_07/Polygon_07
@onready var collision_column_08 := $Columns/Column_08/CollisionPolygon_08
@onready var polygon_column_08   := $Columns/Column_08/Polygon_08
@onready var collision_column_09 := $Columns/Column_09/CollisionPolygon_09
@onready var polygon_column_09   := $Columns/Column_09/Polygon_09
@onready var collision_column_10 := $Columns/Column_10/CollisionPolygon_10
@onready var polygon_column_10   := $Columns/Column_10/Polygon_10

@onready var collision_lever_01  := $Levers/Lever_01/CollisionPolygon_01
@onready var polygon_lever_01    := $Levers/Lever_01/Polygon_01
@onready var collision_lever_02  := $Levers/Lever_02/CollisionPolygon_02
@onready var polygon_lever_02    := $Levers/Lever_02/Polygon_02
@onready var collision_lever_03  := $Levers/Lever_03/CollisionPolygon_03
@onready var polygon_lever_03    := $Levers/Lever_03/Polygon_03
@onready var collision_lever_04  := $Levers/Lever_04/CollisionPolygon_04
@onready var polygon_lever_04    := $Levers/Lever_04/Polygon_04
@onready var collision_lever_05  := $Levers/Lever_05/CollisionPolygon_05
@onready var polygon_lever_05    := $Levers/Lever_05/Polygon_05
@onready var collision_lever_06  := $Levers/Lever_06/CollisionPolygon_06
@onready var polygon_lever_06    := $Levers/Lever_06/Polygon_06
@onready var collision_lever_07  := $Levers/Lever_07/CollisionPolygon_07
@onready var polygon_lever_07    := $Levers/Lever_07/Polygon_07
@onready var collision_lever_08  := $Levers/Lever_08/CollisionPolygon_08
@onready var polygon_lever_08    := $Levers/Lever_08/Polygon_08

@onready var collision_beam_bottom := $Beams/BeamBottom/CollisionBeamBottom
@onready var poligon_beam_bottom   := $Beams/BeamBottom/PoligonBeamBottom
@onready var collision_roof        := $Beams/BeamRoof/CollisionRoof
@onready var polygon_roof          := $Beams/BeamRoof/PolygonRoof
@onready var collision_bowl        := $Beams/Bowl/CollisionBowl
@onready var polygon_bowl          := $Beams/Bowl/PolygonBowl

@onready var collision_top_column    := $Columns/TopColumn/TopColumn_01/CollisionPolygon2D
@onready var polygon_top_column      := $Columns/TopColumn/TopColumn_01/Polygon2D
@onready var collision_top_column_01 := $Columns/TopColumn/TopColumn_02/CollisionPolygon2D
@onready var polygon_top_column_01   := $Columns/TopColumn/TopColumn_02/Polygon2D
@onready var collision_top_column_02 := $Columns/TopColumn/TopColumn_03/CollisionPolygon2D
@onready var polygon_top_column_02   := $Columns/TopColumn/TopColumn_03/Polygon2D
@onready var collision_top_column_03 := $Columns/TopColumn/TopColumn_04/CollisionPolygon2D
@onready var polygon_top_column_03   := $Columns/TopColumn/TopColumn_04/Polygon2D
@onready var collision_top_column_04 := $Columns/TopColumn/TopColumn_05/CollisionPolygon2D
@onready var polygon_top_column_04   := $Columns/TopColumn/TopColumn_05/Polygon2D
@onready var collision_top_column_05 := $Columns/TopColumn/TopColumn_06/CollisionPolygon2D
@onready var polygon_top_column_05   := $Columns/TopColumn/TopColumn_06/Polygon2D
@onready var collision_top_column_06 := $Columns/TopColumn/TopColumn_07/CollisionPolygon2D
@onready var polygon_top_column_06   := $Columns/TopColumn/TopColumn_07/Polygon2D

@onready var fon_music := $FonMusic
@onready var beam_roof := $Beams/BeamRoof

var text_number := 0
var add_number  := 0


#------MAIN FUNCTIONS-----------------------------------------------------------
func _ready():
	YandexSDK.init_game()
	fon_music.play()

	polygon_column_01.polygon = collision_column_01.polygon
	polygon_column_02.polygon = collision_column_02.polygon
	polygon_column_03.polygon = collision_column_03.polygon
	polygon_column_04.polygon = collision_column_04.polygon
	polygon_column_05.polygon = collision_column_05.polygon
	polygon_column_06.polygon = collision_column_06.polygon
	polygon_column_07.polygon = collision_column_07.polygon
	polygon_column_08.polygon = collision_column_08.polygon
	polygon_column_09.polygon = collision_column_09.polygon
	polygon_column_10.polygon = collision_column_10.polygon

	polygon_lever_01.polygon = collision_lever_01.polygon
	polygon_lever_02.polygon = collision_lever_02.polygon
	polygon_lever_03.polygon = collision_lever_03.polygon
	polygon_lever_04.polygon = collision_lever_04.polygon
	polygon_lever_05.polygon = collision_lever_05.polygon
	polygon_lever_06.polygon = collision_lever_06.polygon
	polygon_lever_07.polygon = collision_lever_07.polygon
	polygon_lever_08.polygon = collision_lever_08.polygon

	poligon_beam_bottom.polygon = collision_beam_bottom.polygon
	polygon_roof.polygon        = collision_roof.polygon
	polygon_bowl.polygon        = collision_bowl.polygon

	polygon_top_column.polygon    = collision_top_column.polygon
	polygon_top_column_01.polygon = collision_top_column_01.polygon
	polygon_top_column_02.polygon = collision_top_column_02.polygon
	polygon_top_column_03.polygon = collision_top_column_03.polygon
	polygon_top_column_04.polygon = collision_top_column_04.polygon
	polygon_top_column_05.polygon = collision_top_column_05.polygon
	polygon_top_column_06.polygon = collision_top_column_06.polygon


func _process(_delta) -> void:
	$Menu/Control/TopNumber.text = str(text_number)
	$Menu/Control/CenterContainer/VBoxContainer/Label.text = str(add_number)

#------SIGNALS------------------------------------------------------------------
func _on_add_pressed() -> void:
	$Button.play()
	var obj := $Beams/BeamRoof
	var tween := create_tween()
	tween.tween_property(obj, "position:x", 355, 10.0)
	tween.tween_property(obj, "position:x", 848, 2.0).set_trans(Tween.TRANS_BOUNCE)


func _on_count_1_body_exited(_body) -> void:
	text_number -= 1


func _on_count_2_body_exited(_body) -> void:
	text_number -= 2


func _on_count_3_body_exited(_body) -> void:
	text_number -= 4


func _on_count_4_body_exited(_body) -> void:
	text_number -= 8


func _on_count_5_body_exited(_body) -> void:
	text_number -= 16


func _on_count_6_body_exited(_body) -> void:
	text_number -= 32


func _on_count_7_body_exited(_body) -> void:
	text_number -= 64


func _on_count_8_body_exited(_body) -> void:
	text_number -= 128


func _on_count_1_body_entered(_body) -> void:
	text_number += 1


func _on_count_2_body_entered(_body) -> void:
	text_number += 2


func _on_count_3_body_entered(_body) -> void:
	text_number += 4


func _on_count_4_body_entered(_body) -> void:
	text_number += 8


func _on_count_5_body_entered(_body) -> void:
	text_number += 16


func _on_count_6_body_entered(_body) -> void:
	text_number += 32


func _on_count_7_body_entered(_body) -> void:
	text_number += 64


func _on_count_8_body_entered(_body) -> void:
	text_number += 128


func _on_add_1_body_entered(_body) -> void:
	add_number += 1


func _on_add_1_body_exited(_body) -> void:
	add_number -= 1


func _on_add_2_body_entered(_body) -> void:
	add_number += 2


func _on_add_2_body_exited(_body) -> void:
	add_number -= 2


func _on_add_3_body_entered(_body) -> void:
	add_number += 4


func _on_add_3_body_exited(_body) -> void:
	add_number -= 4


func _on_add_4_body_entered(_body) -> void:
	add_number += 8


func _on_add_4_body_exited(_body) -> void:
	add_number -= 8


func _on_add_5_body_entered(_body) -> void:
	add_number += 16


func _on_add_5_body_exited(_body) -> void:
	add_number -= 16


func _on_add_6_body_entered(_body) -> void:
	add_number += 32


func _on_add_6_body_exited(_body) -> void:
	add_number -= 32


func _on_add_7_body_entered(_body) -> void:
	add_number += 64


func _on_add_7_body_exited(_body) -> void:
	add_number -= 64


func _on_add_8_body_entered(_body) -> void:
	add_number += 128


func _on_add_8_body_exited(_body) -> void:
	add_number -= 128


func _on_overflow_body_entered(_body) -> void:
	$IncorectInput.play()
	$Menu/Overflow.visible = true
	$Timer.start()


func _on_timer_timeout() -> void:
	$Menu/Overflow.visible = false


func _on_hint_pressed() -> void:
	$Button.play()
	$Menu/Explanation.visible = true


func _on_close_pressed() -> void:
	$Button.play()
	$Menu/Explanation.visible = false


func _on_use_pressed() -> void:
	$Button.play()
	$Menu/Explanation/Panel/Use.visible    = true
	$Menu/Explanation/Panel/Theory.visible = false


func _on_theory_pressed() -> void:
	$Button.play()
	$Menu/Explanation/Panel/Use.visible    = false
	$Menu/Explanation/Panel/Theory.visible = true
