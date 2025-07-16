extends Node

enum InteractionType {
	DEFAULT
}

@export var obj_ref: Node3D
@export var interaction_type: InteractionType = InteractionType.DEFAULT

var can_interact: bool = true
var is_interacting: bool = false

var player_hand: Marker3D

func _ready() -> void:
	return
	
func preInteract(hand: Marker3D) -> void:
	is_interacting = true
	match interaction_type:
		InteractionType.DEFAULT:
			player_hand = hand
	
func interact() -> void:
	if not can_interact:
		return
		
	match interaction_type:
		InteractionType.DEFAULT:
			_default_interact()
	
func postInteract() -> void:
	is_interacting = false
	
func _input(_event: InputEvent) -> void:
	return
	
func _default_interact() -> void:
	var obj_current_position: Vector3 = obj_ref.global_transform.origin
	var player_hand_position: Vector3 = player_hand.global_transform.origin
	var obj_distance: Vector3 = player_hand_position-obj_current_position
	
	var rigid_body_3d: RigidBody3D = obj_ref as RigidBody3D
	if rigid_body_3d:
		rigid_body_3d.set_linear_velocity((obj_distance)*(5/rigid_body_3d.mass))
