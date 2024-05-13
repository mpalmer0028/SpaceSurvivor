class_name MoveInputComponent
extends Node

#@export var move_stats: MoveStats
@export var move_component: MoveComponent
@export var speed: float = 1000


func _input(event):
	var x_axis = Input.get_axis("move_left", "move_right")
	var y_axis = Input.get_axis("move_up", "move_down")
	var input_vector = Input.get_vector("move_left", "move_right","move_up","move_down")
	move_component.velocity = input_vector * speed
	if input_vector.length() > 0:
		move_component.forward_direction = input_vector.angle()
