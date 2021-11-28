extends Area2D

var knockback = Vector2.ZERO

var direction = Vector2.ZERO

var max_point = Vector2.ZERO
var min_point = Vector2.ZERO

export var min_speed = 30
export var max_speed = 80

var notCompostPopup = preload("res://UI/NotCompostPopup.tscn")

func _ready():
	direction = position.direction_to(
				lerp(max_point, min_point, randf()))
	
func _physics_process(delta):
	knockback = knockback.move_toward(Vector2.ZERO, 200 * delta)
	position += direction * delta * max_speed
	
	if position.y < max_point.y || position.y > min_point.y:
		queue_free()
		Global.enemyCount -= 1

func pop_up():
	var popUp = notCompostPopup.instance()
	popUp.global_position = Vector2(global_position.x, global_position.y)
	get_tree().get_root().call_deferred("add_child", popUp)

#func _on_ChangeDirection_timeout():
#	direction = position.direction_to(
#				lerp(max_point, min_point, randf()))
