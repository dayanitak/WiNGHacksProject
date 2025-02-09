extends Area2D
var lines:Array[String] = ["Mom: It's dangerous out there.", "You could just stay here with us."]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	


func _on_body_entered(body: Node2D) -> void:
	var position = global_position
	position.y += 100
	position.x -= 20
	print("mom")
	Dialogue.startDialogue(position,lines)
