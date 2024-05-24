extends Node2D
@export var player: CharacterBody2D
@onready var move_component: MoveComponent = player.find_child("MoveComp")
@onready var space: CanvasItem = $ParallaxBackground/SpaceLayer/Space
@onready var far_stars = $ParallaxBackground/FarStarsLayer/FarStars
@onready var close_stars = $ParallaxBackground/CloseStarsLayer/CloseStars
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if move_component.is_dashing:
		#space.material.set_shader_parameter("factor", 1)
		far_stars.material.set_shader_parameter("factor", 1)
		close_stars.material.set_shader_parameter("factor", 1)
	else:
		#space.material.set_shader_parameter("factor", 0)
		far_stars.material.set_shader_parameter("factor", 0)
		close_stars.material.set_shader_parameter("factor", 0)
