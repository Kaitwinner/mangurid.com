extends Node

var is_paused = false

func _unhandled_input(event):
	if event.is_action_pressed("pause"):
		toggle_pause()
		get_viewport().set_input_as_handled()

func toggle_pause():
	is_paused = !is_paused
	get_tree().paused = is_paused
	$PauseMenu.visible = is_paused
