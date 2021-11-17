extends Node2D

export (PackedScene) var Enemy

var items = 0

func _on_EnemyTimer_timeout():
	# Choose a random location on Path2D.
	$EnemyPath/EnemySpawnLocation.offset = randi()
	
	var enemy = Enemy.instance()
	add_child(enemy)
	
	var direction = $EnemyPath/EnemySpawnLocation.rotation + PI / 2
	enemy.position = $EnemyPath/EnemySpawnLocation.position



