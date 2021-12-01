extends HBoxContainer

enum MODES {simple}

var heart_full = preload("res://Assets/UI/heart.png")

func update_health(value):
	update_simple(value)

func update_simple(value):
	for i in get_child_count():
		get_child(i).visible = value > i

func _ready():
	update_simple(Global.playerHealth)
	
func _process(delta):
	update_simple(Global.playerHealth)
