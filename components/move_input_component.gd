class_name MoveInputComponent
extends Node

@onready var camera = $"../../Camera"
#@export var move_stats: MoveStats
@export var move_component: MoveComponent
@export var speed: float = 650
@export var input_vector: Vector2
@export var dash_length: float = 350
@export var dash_cooldown_length: float = 1000


func _input(event):
	input_vector = Input.get_vector("move_left", "move_right","move_up","move_down")
	move_component.velocity = input_vector * speed
	if Input.is_action_pressed("dash") and Time.get_ticks_msec() > move_component.dashing_cooldown_end and input_vector.length() > .01:
		#start dashing
		move_component.dashing_end = Time.get_ticks_msec() + dash_length
		move_component.dashing_cooldown_end = Time.get_ticks_msec() + dash_cooldown_length
		move_component.dash_vector = input_vector.normalized() * speed
		move_component.dash_camera_offset = camera.global_position - get_parent().global_position
		$"../DashAudioStreamPlayer2D".play()
