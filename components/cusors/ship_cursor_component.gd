class_name ShipCursorComponent
extends Area2D
@export var color: Color
var cursor_crosshairs = load("res://components/cusors/ship_cursor.png")
var focused := true
@export var player: CharacterBody2D
@onready var move_component: MoveComponent = player.find_child("MoveComp")
@onready var aim_component: AimComponent = player.find_child("AimComp")
@export var camera_border_fix_offset: Vector2 = Vector2.ZERO
@export var camera_component: CameraComponent

func _notification(what: int) -> void:
	match what:
		NOTIFICATION_APPLICATION_FOCUS_OUT:
			focused = false
		NOTIFICATION_APPLICATION_FOCUS_IN:
			focused = true

# Called when the node enters the scene tree for the first time.
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	$Sprite2D.material.set_shader_parameter("color", color.to_rgba32())

func reposition_cusor(offset:Vector2):
	if aim_component.mouse_aim_mode == aim_component.AimModes.MOUSE:
		global_position = get_global_mouse_position() + offset
		
	elif aim_component.mouse_aim_mode == aim_component.AimModes.STICK:
		global_position =(move_component.forward_direction.normalized()*70)+(move_component.forward_direction * 150 + player.global_position)
