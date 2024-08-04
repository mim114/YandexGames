extends Area2D


#------DATA---------------------------------------------------------------------
var speed : int = 5
var options : Array[String] = ["laser", "laser", "laser", "grenade", "health"]
var type : String = options[randi() % len(options)]
var direction : Vector2
var distance : int = randi_range(150, 250)


#------WORK FUNCTIONS-----------------------------------------------------------
func _ready() -> void:
	if type == "laser":
		$Sprite2D.modulate = Color("24ff02")
	elif type == "grenade":
		$Sprite2D.modulate = Color("48559d")
	elif type == "health":
		$Sprite2D.modulate = Color("ffff00")

	var target_pos = position + direction * distance
	var tween = create_tween()
	tween.set_parallel(true)
	tween.tween_property(self, "position", target_pos, 0.5)
	tween.tween_property(self, "scale", Vector2(1, 1), 0.5).from(Vector2(0, 0))

func _physics_process(delta) -> void:
	rotation += speed * delta


#------SIGNALS------------------------------------------------------------------
func _on_body_entered(_body) -> void:
	if type == "laser":
		Globals.laser_amount += 3
	elif type == "grenade":
		Globals.grenade_amount += 1
	elif type == "health":
		if Globals.health <= 85:
			Globals.health += 15
		elif Globals.health > 85:
			Globals.health = 100

	queue_free()
