extends Control

func _on_play_button_down() -> void:
	get_tree().change_scene_to_file("res://world.tscn")

func _on_quit_button_down() -> void:
	get_tree().quit()
