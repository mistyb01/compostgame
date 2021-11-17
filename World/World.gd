extends Node2D

export (Array, PackedScene) var Enemy

var items = 0
onready var max_point = $max_point.position
onready var min_point = $min_point.position


func _ready():
	$SpawnTimer.start()

func _on_SpawnTimer_timeout():
	# Choose a random location on Path2D.
	$SpawnPath/SpawnPoint.offset = randi()
	
	var enemy = Enemy[int(randf() * Enemy.size())].instance()
	
	enemy.position = $SpawnPath/SpawnPoint.position
	enemy.max_point = max_point
	enemy.min_point = min_point
	
	add_child(enemy)
	

#	var direction = $SpawnPath/SpawnPoint.rotation + PI / 2
#	enemy.linear_velocity = Vector2(rand_range(enemy.min_speed, enemy.max_speed), 0)
#	enemy.linear_velocity = enemy.linear_velocity.rotated(direction)

