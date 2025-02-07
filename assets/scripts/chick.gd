extends Area3D

@export var chickSpeed: float = 1
@export var roadWidth: float = 5
@export var player: Node3D

func _ready() -> void:
	position.x = randf_range(-roadWidth, roadWidth)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#avancer
	position.z = position.z + ((player.speed + chickSpeed) * delta)
	if position.z > 10:
		queue_free()
	


func _on_body_entered(body: Node3D) -> void:
	if (body == player):
		player.speed += 4
		queue_free()
