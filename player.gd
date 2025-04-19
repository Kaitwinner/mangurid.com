class_name Player extends CharacterBody2D

@export var speed = 400
@export var gravity = 980

@onready var gun_dist = global_position.distance_to($Gun.global_position)
var gun_force = 780.0
const GUN_INITIAL_AMMO = 5
var gun_ammo = GUN_INITIAL_AMMO

func _get_input():
	if Input.is_action_just_pressed("shoot"):
		_shoot()

func _physics_process(delta):
	velocity.y += gravity * delta
	
	velocity *= 0.99
	
	_get_input()
	_make_gun_rotation()
	move_and_slide()
	
	if (is_on_floor() && gun_ammo != GUN_INITIAL_AMMO):
		print("Gave player " + str(GUN_INITIAL_AMMO) + " ammo")
		gun_ammo = GUN_INITIAL_AMMO

func _make_gun_rotation():
	var angle_vec = (get_global_mouse_position() - global_position).normalized()
	
	$Gun.position = angle_vec * gun_dist
	$Gun.rotation = angle_vec.angle()
	
	if ($Gun.position.x < 0):
		$Gun.scale = Vector2(1.0, -1.0)
	else:
		$Gun.scale = Vector2(1.0, 1.0)

func _shoot():
	if gun_ammo == 0: # pole kuule enam :(
		print("Out of ammo")
		return
	
	var angle_vec = (get_global_mouse_position() - global_position).normalized()
	velocity = -angle_vec * gun_force
	
	gun_ammo -= 1
	
	print("Ammo left: ", str(gun_ammo))
