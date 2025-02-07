extends Area3D

@export var roadWidth: float = 0.3
@export var player: Node3D
var playerTouched: bool = false
var spawn: Vector2
var final: Vector2

func _ready() -> void:
	spawn = Vector2(randi_range(-10, 10), 10)
	final = Vector2(randf_range(-roadWidth, roadWidth), 0)
	position.x = spawn.x
	position.y = spawn.y

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#avancer
	position.z = position.z + (player.speed * delta)
	if position.y >=0:
		position.x += final.x-spawn.x * 2 * delta
		position.y += final.y-spawn.y * 2 * delta
	
	if position.z > 20:
		queue_free()
	


func _on_body_entered(body: Node3D) -> void:
	if (body == player and !playerTouched):
		if (player.speed > 10):
			player.speed -= 2
		$AnimatedSprite3D.animation = "explosion"
		$chocPoulet.play()
		await get_tree().create_timer(1).timeout
		queue_free()
