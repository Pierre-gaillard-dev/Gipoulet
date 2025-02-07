extends Button

@export var game: PackedScene
var root
var parent
var time: int = 0

func _ready() -> void:
	root = get_tree().root.get_child(0)
	parent = get_parent()

func _on_pressed() -> void:
	var new_game = game.instantiate()
	root.add_child(new_game)
	new_game.get_node("Player").home_hud = parent.get_parent()
	parent.hide()
