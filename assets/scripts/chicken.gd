extends Area3D

@export var roadWidth: float = 2.5
@export var player: Node3D

func _ready() -> void:
	position.x = randf_range(-roadWidth, roadWidth)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#avancer
	position.z = position.z + (player.speed * delta)
	


func _on_body_entered(body: Node3D) -> void:
	if (body == player):
		player.speed -= 1
		queue_free()
