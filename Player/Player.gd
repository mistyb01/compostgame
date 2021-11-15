extends KinematicBody2D

const MAX_SPEED = 150
const ACCELERATION = 200
const FRICTION = 50

# list of states
enum {
	MOVE,
	ATTACK
}

# initialize state and velocity
var state = MOVE
var velocity = Vector2.ZERO

onready var animationPlayer = $AnimationPlayer
onready var animationTree = $AnimationTree
onready var animationState = animationTree.get("parameters/playback")
onready var hitbox = $HitboxPivot/PlayerHitbox

# player movement
# delta contains the time it took for the last frame to process
# whenever you have something that changes over time, multiply it by delta
func _ready():
	animationTree.active = true
	hitbox.knockback_vector = Vector2.LEFT
	
func _process(delta):
	# 'match' is like switch statements
	# "if the state matches MOVE, then run that code"
	# there will only ever be one state running at a time
	match state:
		MOVE:
			move_state(delta)
		ATTACK:
			attack_state(delta)

func move_state(delta):
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized()
	
	if input_vector != Vector2.ZERO:
		hitbox.knockback_vector = input_vector
		animationTree.set("parameters/Idle/blend_position", input_vector)
		animationTree.set("parameters/Walk/blend_position", input_vector)
		animationTree.set("parameters/Attack/blend_position", input_vector)
		animationState.travel("Walk")
		velocity += input_vector * ACCELERATION * delta
		velocity = velocity.clamped(MAX_SPEED * delta)
	else:
		animationState.travel("Idle")
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)

	# multiply by delta, so the velocity is relative to the framerate
	move_and_collide(velocity)
	
	if Input.is_action_just_pressed("attack"):
		state = ATTACK # state changed; now match state will run attack_state!

func attack_state(delta):
	animationState.travel("Attack")

func attack_animation_finished():
	state = MOVE


