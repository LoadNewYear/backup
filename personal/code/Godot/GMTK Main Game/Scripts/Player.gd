extends KinematicBody2D

# Declare member variables
var velocity = Vector2.ZERO
var speed = 1000
var gravity = 1000  # Increased for more realistic falling
var jump_force = -600  # Adjusted for a more balanced jump
var friction = 0.8  # Adjusted for smoother stopping

# Animation states
var rightAnim = true

func _ready():
	# Optionally set initial states or preload assets
	pass

func _physics_process(_delta):
	var direction = Vector2.ZERO
	
	# Handle horizontal input
	if Input.is_action_pressed("left"):
		direction.x = -1
		rightAnim = false
	elif Input.is_action_pressed("right"):
		direction.x = 1
		rightAnim = true

	# Calculate movement
	direction = direction.normalized()
	velocity.x = lerp(velocity.x, direction.x * speed, 0.2)  # Smooth acceleration/deceleration
	
	# Handle gravity
	velocity.y += gravity * _delta
	
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump_force
	
	# Move the body and handle collisions
	velocity = move_and_slide(velocity, Vector2.UP)
	
	# Animation handling
	if direction.x != 0:
		if rightAnim:
			if $AnimatedSprite.animation != "right":
				$AnimatedSprite.play("right")
		else:
			if $AnimatedSprite.animation != "left":
				$AnimatedSprite.play("left")
	else:
		if rightAnim:
			if $AnimatedSprite.animation != "idleRight":
				$AnimatedSprite.play("idleRight")
		else:
			if $AnimatedSprite.animation != "idleLeft":
				$AnimatedSprite.play("idleLeft")
	
	# Apply friction to the velocity to slow down when no input is given
	velocity.x *= friction

func _on_Area2D_body_entered(body):
	if body.name == 'Player':
		scale -= Vector2(0.4, 0.4)
		speed = max(0.1, speed - 0.4)  # Ensure speed doesn't go below a threshold
