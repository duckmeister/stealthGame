extends Node
@onready var label: Label = $Label
@onready var timer: Timer = $Timer
@onready var audio_stream_player: AudioStreamPlayer = $"../AudioStreamPlayer"

var points = 0

func _ready() -> void:
	label.hide()

func add_point():
	points += 1
	print(points)

	if points == 3:
		label.show()
		timer.start()
		audio_stream_player.play()


func _on_timer_timeout() -> void:
	get_tree().change_scene_to_file("res://Levels/mainMenu.tscn")
