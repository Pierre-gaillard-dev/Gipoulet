extends Node3D

@export var player: Node3D
@export var elements: Array[PackedScene]
@export var minDistance: int = 50
@export var maxDistance: int = 100
@export var roadSize: int = 10
var next_element: int


func nextDistance():
	next_element = player.distance + randi_range(minDistance, maxDistance)
	return next_element

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	nextDistance()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if player.distance >= next_element:
		nextDistance()
		var left = randi_range(0, 1)
		var elementId = randi_range(0, elements.size()-1)
		var new_element = elements[elementId].instantiate()
		add_child(new_element)
		new_element.position.z = -30
		new_element.player = player
		if (left == 1):
			new_element.position.x = -roadSize
		else:
			new_element.position.x = roadSize
			new_element.scale.x = new_element.scale.x * -1
