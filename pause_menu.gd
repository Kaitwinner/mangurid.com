extends Control

func _ready():
	visible = false

func _on_continue_button_down() -> void:
	get_tree().paused = false
	visible = false

func _on_quit_button_down() -> void:
	get_tree().quit()
