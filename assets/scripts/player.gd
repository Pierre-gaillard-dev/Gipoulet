extends Node3D

#la distance se compte en centimêtres (1cm = 1px)
@export var distance: float = 0
@export var distance_max: int = 1000
@export var roadWidth: int = 2
#la vitesse se compte en cm/s
@export var speed: int = 3
var lateralSpeed: float = 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func reset() -> void:
	distance = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	distance += speed*delta
	lateralSpeed = float(speed) / 2
	move(delta)

func move(delta: float) -> void:
	if (Input.is_action_pressed("ui_left") and position.x > -roadWidth):
		position.x -= lateralSpeed * delta
	if (Input.is_action_pressed("ui_right") and position.x < roadWidth):
		position.x += lateralSpeed * delta
