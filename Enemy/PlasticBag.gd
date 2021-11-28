extends "res://Enemy/TrashEnemyBase.gd"

onready var stats = $Stats

func _on_Hurtbox_area_entered(area):
	stats.health -= area.damage
	knockback = area.knockback_vector * 50

func _on_Stats_no_health():
	queue_free()
	pop_up()
	Global.enemyCount -= 1

