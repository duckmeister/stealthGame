extends Node3D

@onready var label: Label = $YouWinLabel
@onready var timer: Timer = $YouWinTimer
@onready var clapping_audio: AudioStreamPlayer = $ClappingAudio
@onready var animation_player: AnimationPlayer = $"../gate/AnimationPlayer"
@onready var key_slot: Area3D = $"../keySlot"
var gateKey = preload("res://scenes/key.tscn")
var isKeySpawned = false
var keyInSlot = false
var winner = false

func _ready() -> void:
	label.hide()
	key_slot.hide()
	
func spawnKey(pos):
	isKeySpawned = true
	var instance = gateKey.instantiate()
	instance.position = pos
	add_child(instance)

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("debug"):
		GameState.points = 3
		key_slot.show()
	if GameState.points == 3:
		if isKeySpawned == false:
			spawnKey(Vector3(16,2.5,16))
		else:
			pass
	if GameState.points == 3 and keyInSlot == true:
		if winner == false: 
			win()

func win():
		label.show()
		timer.start()
		clapping_audio.play()
		winner = true

func _on_timer_timeout() -> void:
	animation_player.play("gate_open")
	pass


func _on_exit_body_entered(body: Node3D) -> void:
	if body.is_in_group("Player"):
		get_tree().change_scene_to_file("res://Levels/Main.tscn")
	


func _on_key_slot_body_entered(body: Node3D) -> void:
	if body.is_in_group("Key"):
		keyInSlot = true
