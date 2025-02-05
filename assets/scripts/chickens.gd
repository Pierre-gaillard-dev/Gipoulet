extends Node

@export_category("chicken")
@export var chicken: PackedScene
@export var chickensDistances: Array[int] = [3, 10, 40, 100]
@export var chickenNumber: int = 50

@export_category("environment")
@export_range(0, 50) var spawnRange = 5
@export var player: Node3D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player = get_node("../Player")
	for i in range(chickenNumber):
		chickensDistances.append(randi_range(0, player.distance_max))
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
