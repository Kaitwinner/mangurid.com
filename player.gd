class_name Player extends CharacterBody2D

var _this_scene = preload("res://Player.tscn")

func new() -> Player:
	return _this_scene.instantiate()

@export var speed = 400
@export var gravity = 980
@export var jump_force = -500 


func _get_input():
	if Input.is_action_just_pressed("up") and is_on_floor():
		velocity.y = jump_force
	if Input.is_action_just_pressed("shoot"):
		_shoot()

func _physics_process(delta):
	velocity.y += gravity * delta
	
	velocity *= 0.99
	
	_get_input()
	move_and_slide()
	
	var angle = (get_global_mouse_position() - global_position).angle()
	
	$GunPos.position = Vector2(
		cos(angle),
		sin(angle)
	) * 80.0
		
	if ($GunPos.position.x < 0):
		$GunPos/Gun.scale = Vector2(1.0, -1.0)
	else:
		$GunPos/Gun.scale = Vector2(1.0, 1.0)

func _shoot():
	var angle_vec = (get_global_mouse_position() - global_position).normalized()
	
	velocity = -angle_vec * 1000.0
