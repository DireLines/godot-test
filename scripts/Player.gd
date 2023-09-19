extends RigidBody2D

export (int) var speed = 500
export (int) var max_speed = 400
export (float) var rotation_speed = 100000
export (float) var max_rotation_speed = 3.5
export (float) var rotation_smooth_speed = 10


var velocity = Vector2()
var rotation_dir=0

func get_input():
	velocity = Vector2()
	rotation_dir = 0
	if Input.is_action_pressed('right'):
		rotation_dir += 1
	if Input.is_action_pressed('left'):
		rotation_dir -= 1
	if Input.is_action_pressed('up'):
		velocity += Vector2(0, -speed).rotated(rotation)
	if Input.is_action_pressed('down'):
		velocity += Vector2(0, speed*0.2).rotated(rotation)
	velocity = velocity.normalized() * speed

func _physics_process(delta):
	get_input()
	apply_torque_impulse(rotation_dir*rotation_speed*delta)
	if abs(angular_velocity) >= max_rotation_speed:
		angular_velocity = sign(angular_velocity)*max_rotation_speed
	if rotation_dir == 0:
		angular_velocity *= 0.7
	apply_central_impulse(velocity*delta)
	if linear_velocity.length() >= max_speed:
		linear_velocity = max_speed*linear_velocity.normalized()
