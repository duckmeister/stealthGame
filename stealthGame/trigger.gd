extends Area3D

var timeOut = 1

func _ready() -> void:
	$MeshInstance3D.hide()

func _on_trigger_timer_timeout() -> void:
		timeOut = 0
		print ("TimeOut!")
		$zone.hide()
		$MeshInstance3D.hide()

func _on_body_entered(body: Node3D) -> void:
	$CollisionShape3D/triggerTimer.start()
	if timeOut == 0:
		$MeshInstance3D.hide()
	else:
		$MeshInstance3D.show()
	

func _on_body_exited(body: Node3D) -> void:
	$MeshInstance3D.hide()
	if timeOut == 0:
		pass
	else:
		$CollisionShape3D/triggerTimer.stop()

func _process(delta: float) -> void:
	if timeOut == 0:
		pass
	else:
		print_debug(roundf($CollisionShape3D/triggerTimer.time_left))

	$SubViewport/Control/Label.text = str(ceil($CollisionShape3D/triggerTimer.time_left)) 
	$SubViewport/Control/TextureProgressBar.value = $CollisionShape3D/triggerTimer.time_left
