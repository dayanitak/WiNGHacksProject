extends RigidBody2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	linear_velocity = Vector2(0,-200)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if(global_position.y <= -800):
		print("level two")
