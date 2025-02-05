extends Area3D

@export var player: Node3D

func _ready() -> void:
	position.x = randi_range(-3, 3)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#avancer
	position.z = position.z + (player.speed * delta)
	


func _on_body_entered(body: Node3D) -> void:
	if (body == player):
		queue_free()
		player.speed -= 1
