extends Area2D

@onready var animation_player = $AnimationPlayer

func _ready():
	animation_player.stop()

func _on_animation_finished(anim_name):
	if anim_name == "press":
		animation_player.play("press")

func _on_area_entered(area: Area2D) -> void:
	if not animation_player.is_playing():
		animation_player.play("press")
	if animation_player.is_playing():
		animation_player.play("static")
