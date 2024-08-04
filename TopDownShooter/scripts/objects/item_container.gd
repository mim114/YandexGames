class_name ItemContainer
extends StaticBody2D


#------DATA---------------------------------------------------------------------
signal open(pos, direction)
var opened : bool = false
@onready var current_direction : Vector2 = Vector2.DOWN.rotated(rotation)
