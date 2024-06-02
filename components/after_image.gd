class_name AfterImageComponent
extends Node2D
#@export var number 
@export var colliders:Array[CollisionShape2D]
@export var sprites:Array[Sprite2D]
@export var animated_sprites:Array[AnimatedSprite2D]
@onready var move_input_component:MoveComponent = $"../MoveComp"

var sprite_copies:Array[Sprite2D]

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	for c in colliders:
		c.disabled = move_input_component.is_dashing
	for s in sprites:
		s.material.set_shader_parameter("factor", 1 if move_input_component.is_dashing else 0) 
	pass
