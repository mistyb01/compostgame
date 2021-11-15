extends KinematicBody2D

var knockback = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



func _physics_process(delta):
	knockback = knockback.move_toward(Vector2.ZERO, 200 * delta)
	knockback = move_and_slide(knockback)


func _on_Hurtbox_area_entered(area):
	knockback = area.knockback_vector * 120
	
