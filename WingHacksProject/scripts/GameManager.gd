extends Node

var scenes: Array[String] = ["res://scenes/start.tscn","res://scenes/prologue.tscn","res://scenes/main_game.tscn", "res://scenes/rocket_transition.tscn","res://game_node.tscn"]
var currLevel = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func changeLevel(num: int):
	currLevel = num
	get_tree().change_scene_to_file(scenes[currLevel])
	
	
