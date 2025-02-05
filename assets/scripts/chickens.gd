extends Node

@export var chicken: PackedScene

@export var chickensDistances: Array[int] = [3, 10, 40, 100]
@export_range(0, 50) var spawnRange = 5
#scène player
@export var player: Node3D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player = get_node("../Player")
	chickensDistances.sort()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if (chickensDistances.size() == 0):
		return
	if (chickensDistances.front() < player.distance):
		var new_chicken = chicken.instantiate(player.distance)
		new_chicken.player = player
		new_chicken.position.z = -spawnRange
		add_child(new_chicken)
		chickensDistances.pop_front()
	print(chickensDistances, player.distance)
