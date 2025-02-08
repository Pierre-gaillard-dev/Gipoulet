extends Node3D

@export var player: Node3D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if (position.z < -10):
		position.z += player.speed * delta
