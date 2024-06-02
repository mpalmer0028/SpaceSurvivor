class_name DamageableComponent
extends Node2D
@export var max_health:int = 100
@onready var sound_player:AudioStreamPlayer2D = $"../AudioStreamPlayer2D"
@export var hit_sound: AudioStream
@export var destroy_sound: AudioStream
var current_health:int = max_health 
var dead:bool = false

func damage(damage_amount:int, other_body):
	current_health -= damage_amount
	var parent = get_parent()
	if current_health < 1:				
		destroy()
	else:		
		if parent is RigidBody2D:
			if other_body is Area2D:
				var push_vector = other_body.global_position.direction_to(parent.global_position).normalized() * damage_amount*4
				parent.apply_impulse(push_vector, other_body.global_position)
		if sound_player and hit_sound:
			sound_player.stream = hit_sound
			sound_player.play(0)
		

func destroy():
	if dead:
		return
	dead = true
	var parent:RigidBody2D = get_parent()
	parent.linear_velocity = Vector2.ZERO
	parent.angular_velocity = 0
	parent.sleeping = true
	var animated_sprite = parent.find_child("AnimatedSprite2D")
	if animated_sprite:
			animated_sprite.play(&"destroy")
	if sound_player.is_playing:
		sound_player.stop()
	sound_player.stream = destroy_sound
	sound_player.play(0)
	


func _on_animated_sprite_2d_animation_finished():
	var animated_sprite:AnimatedSprite2D = get_parent().find_child("AnimatedSprite2D")
	#if animated_sprite and animated_sprite.animation == &"destroy":
		#destroy()
	pass # Replace with function body.


func _on_audio_stream_player_2d_finished():
	if sound_player.stream == destroy_sound:
		get_parent().queue_free()
	pass # Replace with function body.
