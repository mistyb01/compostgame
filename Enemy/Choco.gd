extends Area2D

var knockback = Vector2.ZERO
var chocoItem = preload("res://Objects/Items/ChocoItem.tscn")

var direction = Vector2.ZERO

var max_point = Vector2.ZERO
var min_point = Vector2.ZERO

export var min_speed = 30
export var max_speed = 80

onready var stats = $Stats

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

func item_drop():
	var food = chocoItem.instance()

	food.global_position = Vector2(global_position.x, global_position.y)
	get_tree().get_root().call_deferred("add_child", food)

func _on_Hurtbox_area_entered(area):
	stats.health -= area.damage
	#print(stats.health)
	knockback = area.knockback_vector * 50
	
func _on_Stats_no_health():
	queue_free()
	item_drop()
	Global.enemyCount -= 1

func _on_ChangeDirection_timeout():
	direction = position.direction_to(
				lerp(max_point, min_point, randf()))
