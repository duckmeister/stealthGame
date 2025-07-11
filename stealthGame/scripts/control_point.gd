extends Node3D

var timeOut = 1
@onready var area_3d: Area3D = $Area3D
@onready var collision_shape_3d: CollisionShape3D = $Area3D/CollisionShape3D
@onready var mesh_instance_3d: MeshInstance3D = $Area3D/MeshInstance3D
@onready var trigger_timer: Timer = $Area3D/CollisionShape3D/triggerTimer
@onready var progress_bar: TextureProgressBar = $Area3D/SubViewport/Control/TextureProgressBar
@onready var game_state: Node = $"../../GameState"


func _ready() -> void:
	mesh_instance_3d.hide()
	progress_bar.value = 10

func _on_trigger_timer_timeout() -> void:
		#print ("TimeOut!")
		game_state.add_point()
		timeOut = 0
		area_3d.queue_free()

func _on_area_3d_body_entered(_body: Node3D) -> void:
	trigger_timer.start()
	if timeOut == 0:
		mesh_instance_3d.hide()
	else:
		mesh_instance_3d.show()

func _on_area_3d_body_exited(_body: Node3D) -> void:
	mesh_instance_3d.hide()
	if timeOut == 0:
		pass
	else:
		trigger_timer.stop()
		
func _process(delta: float) -> void:
	if timeOut == 0:
		pass
	else:
		progress_bar.value = roundf(trigger_timer.time_left)
