extends Node

#------DATA---------------------------

signal stat_change

var laser_amount : int = 20:
	set(value):
		laser_amount = value
		stat_change.emit()

var grenade_amount : int = 5:
	set(value):
		grenade_amount = value
		stat_change.emit()

var score: int = 0

var health : int = 60:
	set(value):
		health = value
		stat_change.emit()

var player_pos : Vector2
var can_laser : bool = true
