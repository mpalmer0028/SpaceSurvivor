class_name MoveComponent
extends Node

@export var actor: Node2D
@export var velocity: Vector2
@export var forward_direction: Vector2
@export var dashing_end: float = -2
@export var dashing_cooldown_end: float = -2
var is_dashing: bool = false
var dash_vector: Vector2 = Vector2.ZERO
var dash_camera_offset: Vector2 = Vector2.ZERO

func _process(delta):
	actor.rotation = rotate_toward(actor.rotation, forward_direction.angle(), delta*10)

func _physics_process(delta):
	is_dashing = dashing_end > Time.get_ticks_msec()
	if is_dashing:			
		actor.translate(dash_vector * delta*2.5)		
	else:		
		actor.translate(velocity * delta)	
	

