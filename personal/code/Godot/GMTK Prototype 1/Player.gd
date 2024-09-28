extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var velocity = Vector2(0, 0)
var speed = 500
var gravity = 30

func _physics_process(_delta):
	if Input.is_action_pressed("left"):
		velocity.x = -speed
	elif Input.is_action_pressed("right"):
		velocity.x = speed

	velocity.y = velocity.y + gravity # Gravity

	if Input.is_action_pressed("jump") and is_on_floor():
		velocity.y = -1000

	velocity = move_and_slide(velocity, Vector2.UP)

	velocity.x = lerp(velocity.x, 0, 0.2)




func _on_Area2D_body_entered(body):
	if body.name == 'h':
		scale -= Vector2(0.4, 0.4)
		speed -= 0.4
		

