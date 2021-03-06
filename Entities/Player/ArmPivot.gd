extends Node2D

onready var directions = get_parent().get_node("Directions")

func _physics_process(delta):
	if !get_parent().state_machine.current_state in [
		"Attack", "Attack2", "Pull", "Pull2"
	]:
		look_at(global_position + (directions.get_input_direction()))
	$Scythe/AttackHitbox.layer = get_parent().layer
	$Scythe/PullHitbox.layer = get_parent().layer
	
