extends Area2D
var lines:Array[String] = ["moo, I am a space cow."]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	


func _on_body_entered(body: Node2D) -> void:
	var position = global_position
	position.x -= 20
	position.y += 70
	Dialogue.startDialogue(position,lines)
