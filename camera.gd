extends Camera2D

@onready var space = %Space
@export var player: CharacterBody2D
@export var window_padding_amount: float = .2
@export var max_follow_distance: float = 200

var space_layer: ParallaxLayer
var far_star_layer: ParallaxLayer
var close_star_layer: ParallaxLayer

# Called when the node enters the scene tree for the first time.
func _ready():
	if is_instance_valid(space):
		space_layer = space.get_node("ParallaxBackground/SpaceLayer")
		far_star_layer = space.get_node("ParallaxBackground/FarStarsLayer")
		close_star_layer = space.get_node("ParallaxBackground/CloseStarsLayer")



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if is_instance_valid(player):
		var viewport = get_viewport_rect()
		for i in ['x','y']:
			if global_position[i] - player.global_position[i] > viewport.size[i]*.5*window_padding_amount:			
				global_position[i] = player.global_position[i] + viewport.size[i]*.5*window_padding_amount
			elif global_position[i] - player.global_position[i] < -viewport.size[i]*.5*window_padding_amount:
				global_position[i] = player.global_position[i] - viewport.size[i]*.5*window_padding_amount

		if is_instance_valid(space):
			space.global_position = global_position

	
