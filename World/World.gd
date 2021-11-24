extends Node2D

export (Array, PackedScene) var Enemy

var items = 0
onready var max_point = $max_point.position
onready var min_point = $min_point.position


func _ready():
	$SpawnTimer.start()
	$SpawnTimer2.start()

func _on_SpawnTimer_timeout():
	if Global.enemyCount < 6:
		# Choose a random location on Path2D.
		$SpawnPath/SpawnPoint.offset = randi()
		
		var enemy = Enemy[int(randf() * Enemy.size())].instance()
		
		enemy.position = $SpawnPath/SpawnPoint.position
		enemy.max_point = max_point
		enemy.min_point = min_point
		Global.enemyCount += 1
		add_child(enemy)


func _on_SpawnTimer2_timeout():
	if Global.enemyCount < 6:
		$SpawnPath2/SpawnPoint2.offset = randi()
		
		var enemy = Enemy[int(randf() * Enemy.size())].instance()
		
		enemy.position = $SpawnPath2/SpawnPoint2.position
		enemy.max_point = max_point
		enemy.min_point = min_point
		Global.enemyCount += 1
		add_child(enemy)

