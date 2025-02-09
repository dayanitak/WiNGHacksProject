extends Area2D
var lines: Array[String] = ["What the- Hey! You there!","Nice to meet you! I'm Rey. "]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	position = global_position
	position.x -= 60
	position.y += 100
	Dialogue.startDialogue(position,lines)
	 # Replace with function body.
