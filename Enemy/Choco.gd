extends RigidBody2D

var knockback = Vector2.ZERO
var chocoItem = preload("res://Objects/Items/ChocoItem.tscn")
var chocoWrapper = preload("res://Objects/Items/ChocoWrapper.tscn")

export var min_speed = 50
export var max_speed = 150

onready var stats = $Stats


func _physics_process(delta):
	knockback = knockback.move_toward(Vector2.ZERO, 200 * delta)
	#knockback = move_and_slide(knockback)

func item_drop():
	var food = chocoItem.instance()
	var trash = chocoWrapper.instance()

	food.global_position = Vector2(global_position.x - 50, global_position.y)
	get_tree().get_root().add_child(food)
	
	trash.global_position = Vector2(global_position.x + 50, global_position.y)
	get_tree().get_root().add_child(trash)
	
func _on_Hurtbox_area_entered(area):
	stats.health -= area.damage
	print(stats.health)
	knockback = area.knockback_vector * 50
	
func _on_Stats_no_health():
	queue_free()
	item_drop()

