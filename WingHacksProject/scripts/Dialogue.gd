extends Node

@onready var textBoxScene = preload("res://scenes/speech_bubble.tscn")

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
		
	
