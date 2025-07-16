extends Control
@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer
@onready var timer: Timer = $AudioStreamPlayer/Timer

func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE

func _on_start_pressed() -> void:
	audio_stream_player.play()
	get_tree().change_scene_to_file("res://Levels/Game.tscn")

func _on_multiplayer_pressed() -> void:
	audio_stream_player.play()

func _on_options_pressed() -> void:
	audio_stream_player.play()

func _on_exit_pressed() -> void:
	audio_stream_player.play()
	timer.start()

func _on_timer_timeout() -> void:
	get_tree().quit()
	
