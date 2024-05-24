class_name CameraComponent
extends Camera2D

@onready var space = %Space
@export var player: CharacterBody2D
@onready var move_component: MoveComponent = player.find_child("MoveComp")
@export var ship_cursor_component: ShipCursorComponent 
@export var window_padding_amount: float = .2
@export var max_follow_distance: float = 200

var space_layer: ParallaxLayer
var far_star_layer: ParallaxLayer
var close_star_layer: ParallaxLayer

# Called when the node enters the scene tree for the first time.
func _ready():
	var move_comp: MoveComponent = player.find_child("MoveComp")
	if is_instance_valid(space):
		space_layer = space.get_node("ParallaxBackground/SpaceLayer")
		far_star_layer = space.get_node("ParallaxBackground/FarStarsLayer")
		close_star_layer = space.get_node("ParallaxBackground/CloseStarsLayer")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	reposition_camera(delta)

func reposition_camera(delta):
	if is_instance_valid(player):
		var viewport = get_viewport_rect()
		var old_global_position = global_position
		for i in ['x','y']:
			if move_component.is_dashing:
				global_position[i] = player.global_position[i]+move_component.dash_camera_offset[i]
			elif global_position[i] - player.global_position[i] > viewport.size[i]*.5*window_padding_amount:				
				global_position[i] = player.global_position[i] + viewport.size[i]*.5*window_padding_amount				
			elif global_position[i] - player.global_position[i] < -viewport.size[i]*.5*window_padding_amount:
				global_position[i] = player.global_position[i] - viewport.size[i]*.5*window_padding_amount
			else:
				global_position[i] = lerp(global_position[i],player.global_position[i],delta)
			
		
		# Need this to fix wiggle of cusor near the edges that the camera got repositioned to
		ship_cursor_component.reposition_cusor(global_position-old_global_position)
