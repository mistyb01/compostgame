extends Area2D

var knockback = Vector2.ZERO
var compostPopup = preload("res://UI/CompostPopup.tscn")

var direction = Vector2.ZERO

var max_point = Vector2.ZERO
var min_point = Vector2.ZERO

export var min_speed = 30
export var max_speed = 80

func _ready():
	direction = position.direction_to(
				lerp(max_point, min_point, randf()))

func _physics_process(delta):
	knockback = knockback.move_toward(Vector2.ZERO, 200 * delta)
	#knockback = move_and_slide(knockback)
	position += direction * delta * max_speed
	
	if position.y < max_point.y || position.y > min_point.y:
		queue_free()
		Global.enemyCount -= 1
	
	if direction.x > 0:
		$AnimatedSprite.flip_h = true

func pop_up():
	var popUp = compostPopup.instance()
	popUp.global_position = Vector2(global_position.x, global_position.y)
	get_tree().get_root().call_deferred("add_child", popUp)

func _on_ChangeDirection_timeout():
	direction = position.direction_to(
				lerp(max_point, min_point, randf()))


