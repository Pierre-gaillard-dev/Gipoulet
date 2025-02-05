extends Area3D

@export var roadWidth: float = 2.5
@export var player: Node3D
var playerTouched: bool = false

func _ready() -> void:
	position.x = randf_range(-roadWidth, roadWidth)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#avancer
	position.z = position.z + (player.speed * delta)
	


func _on_body_entered(body: Node3D) -> void:
	if (body == player and !playerTouched):
		if (player.speed > 10):
			player.speed -= 1
		$AnimatedSprite3D.animation = "explosion"
		await get_tree().create_timer(1).timeout
		queue_free()
