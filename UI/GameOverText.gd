extends Label


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	text = "You were able to divert " + String(Global.items) + " items from the landfill!"

