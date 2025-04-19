extends Control

func resume():
	get_tree().paused = false

func pause():
	get_tree().paused = true

func Esctest():
	if Input.is_action_just_pressed("pause") and get_tree().paused == false:
		pause()
	elif Input.is_action_just_pressed("pause") and get_tree().paused == false:
		pause()

func _on_continue_pressed() -> void:
	resume()


func _on_quit_pressed() -> void:
	get_tree().quit()

func toggle_pause():
	get_tree().paused = !get_tree().paused
	$CanvasLayer.visible = get_tree().paused
