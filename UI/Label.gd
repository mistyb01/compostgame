extends Label

func _process(delta):
	text = "Compostable items diverted from landfill: " + String(Global.items)
