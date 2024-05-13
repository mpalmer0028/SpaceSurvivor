class_name MoveComponent
extends Node

@export var actor: Node2D
@export var velocity: Vector2
@export var forward_direction: float

func _process(delta):
	actor.translate(velocity * delta)	
	actor.rotation = rotate_toward(actor.rotation, forward_direction, delta*10)
