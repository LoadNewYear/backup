extends Node2D

export var acceleration = 10.0
export var max_speed = 5.0
export var deceleration = 10.0

var current_speed = 0.0

func _process(delta):
	var target_speed = 0.0

	if Input.is_action_pressed("move"):
		target_speed = max_speed


	# Smoothly accelerate or decelerate to the target speed
	if target_speed != 0:
		current_speed = lerp(current_speed, target_speed, acceleration * delta)
	else:
		current_speed = lerp(current_speed, 0, deceleration * delta)

	# Rotate the Node2D based on the current speed
	rotate(current_speed * delta)
