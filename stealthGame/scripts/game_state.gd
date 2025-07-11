extends Node
@onready var label: Label = $Label
@onready var timer: Timer = $Timer

var points = 0

func _ready() -> void:
	label.hide()

func add_point():
	points += 1
	print(points)

	if points == 3:
		label.show()
		timer.start()


func _on_timer_timeout() -> void:
	get_tree().change_scene_to_file("res://Levels/mainMenu.tscn")
