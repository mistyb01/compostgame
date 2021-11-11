extends KinematicBody2D

const MAX_SPEED = 150
const ACCELERATION = 200
const FRICTION = 50

var velocity = Vector2.ZERO


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# player movement
# delta contains the time it took for the last frame to process
# whenever you have something that changes over time, multiply it by delta

func _process(delta):
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized()
	if input_vector != Vector2.ZERO:
		velocity += input_vector * ACCELERATION * delta
		velocity = velocity.clamped(MAX_SPEED * delta)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
		
	# multiply by delta, so the velocity is relative to the framerate
	move_and_collide(velocity)
