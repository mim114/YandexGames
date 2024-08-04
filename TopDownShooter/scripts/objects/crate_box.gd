extends ItemContainer


#------DATA---------------------------------------------------------------------
@onready var spown_pos = $SpownPosition


#------WORK FUNCTIONS-----------------------------------------------------------
func hit() -> void:
	if not opened:
		$LidSprite.hide()

		for i in range(2):
			var pos = spown_pos.get_child(randi() % spown_pos.get_child_count()).global_position
			open.emit(pos, current_direction)

		opened = true
