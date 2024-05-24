class_name AimComponent
extends Node2D
enum AimModes { MOUSE, STICK}
var mouse_aim_mode = AimModes.MOUSE
@onready var player: CharacterBody2D = $".."
@export var move_component: MoveComponent
@onready var debug_value: Label = $"../../Camera/MarginContainer/GridContainer/DebugValue"

var initial_player_rot_offset
var last_updated_mouse_pos
# Called when the node enters the scene tree for the first time.
func _ready():
	initial_player_rot_offset = player.rotation
	last_updated_mouse_pos = get_global_mouse_position()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if mouse_aim_mode == AimModes.MOUSE:
		move_component.forward_direction = player.global_position.direction_to(get_global_mouse_position())

func _input(event):
	if event is InputEventMouseMotion:
		mouse_aim_mode = AimModes.MOUSE
		
		last_updated_mouse_pos = get_global_mouse_position()
		move_component.forward_direction = player.global_position.direction_to(get_global_mouse_position())
	else:		
		var input_vector = Input.get_vector("stick_aim_left", "stick_aim_right","stick_aim_up","stick_aim_down")
		if input_vector.length() > 0:
			mouse_aim_mode = AimModes.STICK
			move_component.forward_direction = input_vector
	debug_value.text = AimModes.keys()[mouse_aim_mode]
	
	

	
