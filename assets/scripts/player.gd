extends Node3D

#la distance se compte en centimêtres (1cm = 1px)
@export var distance: float = 0
@export var distance_max: int = 1000
@export var roadWidth: int = 2
#la vitesse se compte en cm/s
@export var speed: int = 3
@export var school: PackedScene
@export var home_hud: Node3D
var lateralSpeed: float = 1
var playing: bool = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	lateralSpeed = float(speed) / 2.3

func reset() -> void:
	distance = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	distance += speed*delta
	lateralSpeed = float(speed) / 2.3
	move(delta)
	#finish
	if (distance > distance_max and playing):
		playing = false
		var new_shool = school.instantiate()
		get_parent().add_child(new_shool)
		new_shool.player = self
		new_shool.position.z = -50
		await get_tree().create_timer(3).timeout
		
		get_parent().queue_free()
		home_hud.get_child(0).show()

func move(delta: float) -> void:
	if (Input.is_action_pressed("ui_left") and position.x > -roadWidth):
		position.x -= lateralSpeed * delta
	if (Input.is_action_pressed("ui_right") and position.x < roadWidth):
		position.x += lateralSpeed * delta
