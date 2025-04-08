extends StaticBody2D
var door = self

func _on_button_2_area_entered(area: Area2D) -> void:
	door.queue_free()
