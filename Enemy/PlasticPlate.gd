extends Area2D

var knockback = Vector2.ZERO

var direction = Vector2.ZERO

var max_point = Vector2.ZERO
var min_point = Vector2.ZERO

export var min_speed = 30
export var max_speed = 80

onready var stats = $Stats

# Called when the node enters the scene tree for the first time.
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


func _on_ChangeDirection_timeout():
	direction = position.direction_to(
				lerp(max_point, min_point, randf()))


func _on_Hurtbox_area_entered(area):
	stats.health -= area.damage
	knockback = area.knockback_vector * 50

func _on_Stats_no_health():
	queue_free()
	Global.enemyCount -= 1