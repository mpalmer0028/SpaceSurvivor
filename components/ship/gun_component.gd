class_name GunComponent
extends Node2D
@onready var bullet_instance_point:Marker2D = $BulletInstancingPoint
@onready var gun_sound_player:AudioStreamPlayer2D = $GunAudioStreamPlayer2D
@export var bullet:PackedScene = load("res://components/projectiles/bullet.tscn")
var time_between_shots:int = 100
var shot_paused_till:int = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass 


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _physics_process(delta):
	var t = Time.get_ticks_msec()
	if Input.is_action_pressed("shoot") and t > shot_paused_till:
		shot_paused_till = t + time_between_shots
		blast()

func blast():
	gun_sound_player.play()
	var b:Bullet = bullet.instantiate()
	owner.get_parent().add_child(b)
	b.global_position =  bullet_instance_point.global_position
	b.global_rotation = bullet_instance_point.global_rotation
	b.ship_input_vector = $"../MoveInputComp".input_vector
	b.ship_speed = $"../MoveInputComp".speed
	pass
	
