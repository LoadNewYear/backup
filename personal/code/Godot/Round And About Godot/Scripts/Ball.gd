extends KinematicBody2D

var velocity = Vector2(200, 200)
var flip_h = false

signal hit

func wait(seconds: float):
	yield(get_tree().create_timer(seconds), "timeout")

func _physics_process(delta):
	var collision_info = move_and_collide(velocity * delta)
	
	if collision_info:
		print(collision_info)
		emit_signal("hit")
		$"../Camera2D".zoom += Vector2(0.01, 0.01)
		$AudioStreamPlayer2D.play()
		$AudioStreamPlayer2D.pitch_scale = rand_range(0.5, 1.5)
		$Explosion.emitting = true
		$Explosion.restart()
		$"../Camera2D".apply_shake(15.0)
		scale += Vector2(0.03, 0.03)
		$"../Controller/StaticBody2D".position.y -= 10
		velocity = velocity.bounce(collision_info.normal)
		if flip_h:
			$AnimatedSprite.flip_h = true
			flip_h = false
		else:
			$AnimatedSprite.flip_h = false
			flip_h = true

func _process(delta):
	if position.x > 1024 or position.x < 0 or position.y > 600 or position.y < 0:
		get_tree().reload_current_scene()

