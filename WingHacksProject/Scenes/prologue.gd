extends Node
var pos:Vector2 = Vector2(-100,-100)
var lines:Array[String] = ["On a planet called Vectra, there lived a girl called Nova.", "All she and generations before her had ever known was Vectra.", "Yet one day, Nova woke up and decided she needed adventure.", "She wanted a break from the mundane and to figure out who she is.", "She decides to embark on a journey to the planet of Atlas."]
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Dialogue.startDialogue(pos,lines)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
