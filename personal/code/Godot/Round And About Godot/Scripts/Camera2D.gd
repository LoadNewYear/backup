extends Camera2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var randomStrength = 30.0
export var shakeFade = 5.0

var rng = RandomNumberGenerator.new()

var shake_strength = 0.0


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func apply_shake(strength):
	shake_strength = strength


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if shake_strength > 0:
		shake_strength = lerp(shake_strength, 0, shakeFade * delta)
		offset = Vector2(rng.randf_range(-shake_strength, shake_strength), rng.randf_range(-shake_strength, shake_strength))
