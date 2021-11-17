extends Node2D

export (PackedScene) var Enemy

var items = 0

func _ready():
	$SpawnTimer.start()

func _on_SpawnTimer_timeout():
	# Choose a random location on Path2D.
	$SpawnPath/SpawnPoint.offset = randi()
	
	var enemy = Enemy.instance()
	add_child(enemy)
	
	enemy.position = $SpawnPath/SpawnPoint.position
	var direction = $SpawnPath/SpawnPoint.rotation + PI / 2
	enemy.linear_velocity = Vector2(rand_range(enemy.min_speed, enemy.max_speed), 0)
	enemy.linear_velocity = enemy.linear_velocity.rotated(direction)

