extends Node3D

@export var LignesRoute: Node3D
@export var lineLength: float = 10.5
var player = Node3D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	player = get_node_or_null("../game/Player")
	if (player):
		LignesRoute.position.z = int(player.distance) % int(lineLength)
