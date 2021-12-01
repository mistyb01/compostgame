extends Label

# Called when the node enters the scene tree for the first time.
func _ready():
	text = "You were able to divert " + String(Global.items) + " items from the landfill!"

