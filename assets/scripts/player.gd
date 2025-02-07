extends Node3D

#la distance se compte en centimêtres (1cm = 1px)
@export var distance: float = 0
@export var distance_max: int = 1000
@export var roadWidth: int = 2
#la vitesse se compte en cm/s
@export var speed: float = 10.0
@export var school: PackedScene
@export var Justine: PackedScene
@export var interface: CanvasLayer
@export var home_hud: CanvasLayer
var musicPlayer: AudioStreamPlayer
@export var retardPlayer: AudioStreamPlayer
@export var bonjourPlayer: AudioStreamPlayer
var lateralSpeed: float = 1
var playing: bool = true
var timer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	lateralSpeed = float(speed) / 2.3
	timer = get_node("../Interface")
	musicPlayer = get_node("../AudioStreamPlayer")
	

func reset() -> void:
	distance = 0
	
func finish():
	playing = false
	interface.hide()
	var new_shool = school.instantiate()
	get_parent().add_child(new_shool)
	new_shool.player = self
	new_shool.position.z = -50
	await get_tree().create_timer(2).timeout
	musicPlayer.stream_paused = true
	var justine = Justine.instantiate()
	var justine_image: AnimatedSprite2D = justine.get_child(0)
	get_parent().add_child(justine)
	if timer.time <= 300:
		bonjourPlayer.play()
	else:
		retardPlayer.play()
		justine_image.frame = 1
	await get_tree().create_timer(5).timeout
	
	home_hud.show()
	get_parent().queue_free()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	distance += speed*delta
	lateralSpeed = float(speed) / 2.3
	move(delta)
	if (distance > distance_max and playing):
		finish()

func move(delta: float) -> void:
	if (Input.is_action_pressed("ui_left") and position.x > -roadWidth):
		position.x -= lateralSpeed * delta
	if (Input.is_action_pressed("ui_right") and position.x < roadWidth):
		position.x += lateralSpeed * delta
	$AnimatedSprite3D.speed_scale = int(speed/5)
	speed += 0.1*delta
