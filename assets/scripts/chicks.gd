extends Node

@export var chick: PackedScene
@export var chickNumber: int = 50
@export var chicksDistances: Array[float] = []

@export_category("environment")
@export_range(0, 50) var spawnRange = 20
#scène player
@export var player: Node3D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player = get_node("../Player")
	for i in range(chickNumber):
		chicksDistances.append(randf_range(0, player.distance_max))
	chicksDistances.sort()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if (chicksDistances.size() == 0):
		return
	if (chicksDistances.front() < player.distance):
		var new_chick = chick.instantiate(player.distance)
		new_chick.player = player
		new_chick.position.z = -spawnRange
		add_child(new_chick)
		chicksDistances.pop_front()
