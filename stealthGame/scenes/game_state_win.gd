extends Node3D

@onready var label: Label = $YouWinLabel
@onready var timer: Timer = $YouWinTimer
@onready var clapping_audio: AudioStreamPlayer = $ClappingAudio

func _ready() -> void:
	label.hide()

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("debug"):
		GameState.points = 3
		print(GameState.points)
	if GameState.points == 3:
		_win()

func _win():
		label.show()
		timer.start()
		print_debug(roundf(timer.time_left))
		clapping_audio.play()

func _on_timer_timeout() -> void:
	get_tree().change_scene_to_file("res://Levels/Main.tscn")
	pass
