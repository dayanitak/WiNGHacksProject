extends MarginContainer

@onready var label = $MarginContainer/Label
@onready var timer = $TypeTime

const MAX_WIDTH = 250

var text = ""
var letterInd = 0

var letterTime = 0.03
signal finished()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass# Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	

func display(text_to_show:String) -> void:
	text = text_to_show
	label.text = text_to_show
	await resized
	custom_minimum_size.x = min(size.x,MAX_WIDTH)
	
	
	
	if(size.x > MAX_WIDTH):
		label.autowrap_mode =  TextServer.AUTOWRAP_WORD
		await resized
		await resized
		custom_minimum_size.y = size.y
	
	global_position.x -= size.x/2
	global_position.y -= size.y + 24
	label.text = ""
	displayLetter()


func displayLetter() -> void:
	label.text += text[letterInd]
	letterInd += 1
	if(letterInd >= text.length()):
		finished.emit()
		return
		
	timer.start(letterTime)


func _on_type_time_timeout() -> void:
	displayLetter() # Replace with function body.
