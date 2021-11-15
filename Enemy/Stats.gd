extends Node

# exporting a variable allows us to change it in the inspector for 
# the different instances !
export var max_health = 1
onready var health = max_health setget set_health

signal no_health

func set_health(value):
	health = value
	if health <= 0:
		emit_signal("no_health")
