extends Node

@export var move_component: MoveComponent
@onready var effect_sprite = $"../ThrustEffectSprite2D"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if move_component.velocity.length() > 0:
		effect_sprite.play("thrust_high")
	else:
		effect_sprite.play("off")
	
