extends Node

@onready var interaction_controller: Node = %InteractionController
@onready var interaction_raycast: RayCast3D = %InteractionRaycast
@onready var player_camera: Camera3D = %Camera3D
@onready var hand: Marker3D = %Hand

var current_obj: Object
var last_potential_obj: Object
var interaction_component: Node

func _process(_delta: float) -> void:
	
	if current_obj:
		if Input.is_action_pressed("use"):
			if  interaction_component:
				interaction_component.interact()
		else:
			if interaction_component:
				interaction_component.postInteract()
				current_obj = null
	else:
		var potential_obj: Object = interaction_raycast.get_collider()
		
		if potential_obj and potential_obj is Node:
			interaction_component = potential_obj.get_node_or_null("InteractionComponent")
			if interaction_component:
				if interaction_component.can_interact == false:
					return
					
				last_potential_obj = current_obj
				
				if Input.is_action_pressed("use"):
					current_obj = potential_obj
					interaction_component.preInteract(hand)
