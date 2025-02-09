extends Node

@onready var textBoxScene = preload("res://speech_bubble.tscn")

var dialogueLines: Array[String] = []
var index = 0

var textBox
var textBoxPos: Vector2

var dialogueOn = false
var advanceLine = false


func startDialogue(position: Vector2, lines: Array[String]):
	
	if dialogueOn:
		return
	dialogueLines = lines
	textBoxPos = position
	
	show()
	
	dialogueOn = true;
	
func show():
	textBox = textBoxScene.instantiate()
	textBox.finished.connect(_on_textBox_finished)
	get_tree().root.add_child(textBox)
	textBox.global_position = textBoxPos
	textBox.display(dialogueLines[index])
	advanceLine = false
	
func _on_textBox_finished():		
	advanceLine = true
	
func _unhandled_input(_event: InputEvent) -> void:
	if(Input.is_action_just_pressed("ui_down") && dialogueOn && advanceLine):
		
		textBox.queue_free()
		
		index += 1
		if (index >= dialogueLines.size()):
			dialogueOn = false
			
			index = 0
			return
		else:
			show()
		
	
extends MarginContainer

@onready var label = $MarginContainer/Label
@onready var timer = $TypeTime

const MAX_WIDTH = 100

var text = ""
var letterInd = 0

var letterTime = 0.03
signal finished()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


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
