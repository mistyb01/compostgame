extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_PickupDetector_area_entered(area : Area2D):
	if area.is_in_group("compost"):
		Global.items += 1
	else:
		Global.items = 0 
	area.queue_free()


